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
-- Submodules: 86
entity swp2_0CLK_e768ce5a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_e768ce5a;
architecture arch of swp2_0CLK_e768ce5a is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2451_c6_18ab]
signal BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2451_c1_c8c3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2451_c2_286a]
signal n16_MUX_uxn_opcodes_h_l2451_c2_286a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2451_c2_286a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2451_c2_286a]
signal result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2451_c2_286a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2451_c2_286a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2451_c2_286a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2451_c2_286a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2451_c2_286a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2451_c2_286a]
signal t16_MUX_uxn_opcodes_h_l2451_c2_286a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2451_c2_286a_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2452_c3_d1aa[uxn_opcodes_h_l2452_c3_d1aa]
signal printf_uxn_opcodes_h_l2452_c3_d1aa_uxn_opcodes_h_l2452_c3_d1aa_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2456_c11_a1c3]
signal BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2456_c7_499c]
signal n16_MUX_uxn_opcodes_h_l2456_c7_499c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2456_c7_499c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2456_c7_499c]
signal result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2456_c7_499c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2456_c7_499c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2456_c7_499c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2456_c7_499c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2456_c7_499c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2456_c7_499c]
signal t16_MUX_uxn_opcodes_h_l2456_c7_499c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2456_c7_499c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2459_c11_12dd]
signal BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2459_c7_1c86]
signal n16_MUX_uxn_opcodes_h_l2459_c7_1c86_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2459_c7_1c86]
signal result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2459_c7_1c86]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2459_c7_1c86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2459_c7_1c86]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2459_c7_1c86]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2459_c7_1c86]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2459_c7_1c86]
signal t16_MUX_uxn_opcodes_h_l2459_c7_1c86_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2464_c11_cef0]
signal BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2464_c7_12e1]
signal n16_MUX_uxn_opcodes_h_l2464_c7_12e1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2464_c7_12e1]
signal result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2464_c7_12e1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2464_c7_12e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2464_c7_12e1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2464_c7_12e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2464_c7_12e1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2464_c7_12e1]
signal t16_MUX_uxn_opcodes_h_l2464_c7_12e1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2465_c3_4ef2]
signal BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2468_c11_b590]
signal BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2468_c7_5a25]
signal n16_MUX_uxn_opcodes_h_l2468_c7_5a25_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2468_c7_5a25]
signal result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2468_c7_5a25]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2468_c7_5a25]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2468_c7_5a25]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2468_c7_5a25]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2468_c7_5a25]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2472_c11_010d]
signal BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2472_c7_aa61]
signal n16_MUX_uxn_opcodes_h_l2472_c7_aa61_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2472_c7_aa61]
signal result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2472_c7_aa61]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2472_c7_aa61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2472_c7_aa61]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2472_c7_aa61]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2472_c7_aa61]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2473_c3_21fe]
signal BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2475_c30_345c]
signal sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2480_c11_aab9]
signal BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2480_c7_e09f]
signal result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2480_c7_e09f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2480_c7_e09f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2480_c7_e09f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2480_c7_e09f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2483_c31_67ef]
signal CONST_SR_8_uxn_opcodes_h_l2483_c31_67ef_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2483_c31_67ef_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2485_c11_6942]
signal BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2485_c7_72cf]
signal result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2485_c7_72cf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2485_c7_72cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2485_c7_72cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2485_c7_72cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2490_c11_ddb2]
signal BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2490_c7_1f5b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2490_c7_1f5b]
signal result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2490_c7_1f5b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2490_c7_1f5b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2492_c31_2986]
signal CONST_SR_8_uxn_opcodes_h_l2492_c31_2986_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2492_c31_2986_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2494_c11_1381]
signal BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2494_c7_d610]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2494_c7_d610]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2470_l2461_DUPLICATE_4e4a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2470_l2461_DUPLICATE_4e4a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2470_l2461_DUPLICATE_4e4a_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab
BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_left,
BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_right,
BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_return_output);

-- n16_MUX_uxn_opcodes_h_l2451_c2_286a
n16_MUX_uxn_opcodes_h_l2451_c2_286a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2451_c2_286a_cond,
n16_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue,
n16_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse,
n16_MUX_uxn_opcodes_h_l2451_c2_286a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a
result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a
result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a
result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a
result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_return_output);

-- t16_MUX_uxn_opcodes_h_l2451_c2_286a
t16_MUX_uxn_opcodes_h_l2451_c2_286a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2451_c2_286a_cond,
t16_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue,
t16_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse,
t16_MUX_uxn_opcodes_h_l2451_c2_286a_return_output);

-- printf_uxn_opcodes_h_l2452_c3_d1aa_uxn_opcodes_h_l2452_c3_d1aa
printf_uxn_opcodes_h_l2452_c3_d1aa_uxn_opcodes_h_l2452_c3_d1aa : entity work.printf_uxn_opcodes_h_l2452_c3_d1aa_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2452_c3_d1aa_uxn_opcodes_h_l2452_c3_d1aa_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3
BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_left,
BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_right,
BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_return_output);

-- n16_MUX_uxn_opcodes_h_l2456_c7_499c
n16_MUX_uxn_opcodes_h_l2456_c7_499c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2456_c7_499c_cond,
n16_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue,
n16_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse,
n16_MUX_uxn_opcodes_h_l2456_c7_499c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c
result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c
result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_return_output);

-- t16_MUX_uxn_opcodes_h_l2456_c7_499c
t16_MUX_uxn_opcodes_h_l2456_c7_499c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2456_c7_499c_cond,
t16_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue,
t16_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse,
t16_MUX_uxn_opcodes_h_l2456_c7_499c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd
BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_left,
BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_right,
BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_return_output);

-- n16_MUX_uxn_opcodes_h_l2459_c7_1c86
n16_MUX_uxn_opcodes_h_l2459_c7_1c86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2459_c7_1c86_cond,
n16_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue,
n16_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse,
n16_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86
result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_cond,
result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86
result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86
result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output);

-- t16_MUX_uxn_opcodes_h_l2459_c7_1c86
t16_MUX_uxn_opcodes_h_l2459_c7_1c86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2459_c7_1c86_cond,
t16_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue,
t16_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse,
t16_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0
BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_left,
BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_right,
BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_return_output);

-- n16_MUX_uxn_opcodes_h_l2464_c7_12e1
n16_MUX_uxn_opcodes_h_l2464_c7_12e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2464_c7_12e1_cond,
n16_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue,
n16_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse,
n16_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1
result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1
result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1
result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1
result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output);

-- t16_MUX_uxn_opcodes_h_l2464_c7_12e1
t16_MUX_uxn_opcodes_h_l2464_c7_12e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2464_c7_12e1_cond,
t16_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue,
t16_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse,
t16_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2
BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2_left,
BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2_right,
BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_left,
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_right,
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_return_output);

-- n16_MUX_uxn_opcodes_h_l2468_c7_5a25
n16_MUX_uxn_opcodes_h_l2468_c7_5a25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2468_c7_5a25_cond,
n16_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue,
n16_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse,
n16_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25
result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_cond,
result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25
result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25
result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d
BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_left,
BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_right,
BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_return_output);

-- n16_MUX_uxn_opcodes_h_l2472_c7_aa61
n16_MUX_uxn_opcodes_h_l2472_c7_aa61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2472_c7_aa61_cond,
n16_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue,
n16_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse,
n16_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61
result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_cond,
result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61
result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61
result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61
result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61
result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe
BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe_left,
BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe_right,
BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2475_c30_345c
sp_relative_shift_uxn_opcodes_h_l2475_c30_345c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_ins,
sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_x,
sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_y,
sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9
BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_left,
BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_right,
BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f
result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f
result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f
result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f
result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2483_c31_67ef
CONST_SR_8_uxn_opcodes_h_l2483_c31_67ef : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2483_c31_67ef_x,
CONST_SR_8_uxn_opcodes_h_l2483_c31_67ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942
BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_left,
BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_right,
BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf
result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_cond,
result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf
result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf
result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf
result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2
BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_left,
BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_right,
BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b
result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b
result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b
result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2492_c31_2986
CONST_SR_8_uxn_opcodes_h_l2492_c31_2986 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2492_c31_2986_x,
CONST_SR_8_uxn_opcodes_h_l2492_c31_2986_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381
BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381_left,
BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381_right,
BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610
result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610
result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2470_l2461_DUPLICATE_4e4a
CONST_SL_8_uint16_t_uxn_opcodes_h_l2470_l2461_DUPLICATE_4e4a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2470_l2461_DUPLICATE_4e4a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2470_l2461_DUPLICATE_4e4a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_return_output,
 n16_MUX_uxn_opcodes_h_l2451_c2_286a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_return_output,
 t16_MUX_uxn_opcodes_h_l2451_c2_286a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_return_output,
 n16_MUX_uxn_opcodes_h_l2456_c7_499c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_return_output,
 t16_MUX_uxn_opcodes_h_l2456_c7_499c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_return_output,
 n16_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output,
 t16_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_return_output,
 n16_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output,
 t16_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_return_output,
 n16_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_return_output,
 n16_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe_return_output,
 sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output,
 CONST_SR_8_uxn_opcodes_h_l2483_c31_67ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output,
 CONST_SR_8_uxn_opcodes_h_l2492_c31_2986_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2470_l2461_DUPLICATE_4e4a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2456_c7_499c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2451_c2_286a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2451_c2_286a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2453_c3_2c64 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2456_c7_499c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2451_c2_286a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2451_c2_286a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2452_c3_d1aa_uxn_opcodes_h_l2452_c3_d1aa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2456_c7_499c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2457_c3_57cd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2456_c7_499c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2459_c7_1c86_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2462_c3_a0c4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2459_c7_1c86_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2464_c7_12e1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2466_c3_4ec7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2464_c7_12e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2468_c7_5a25_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2472_c7_aa61_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2477_c3_cdcf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2478_c21_f8ea_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2482_c3_683a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2483_c31_67ef_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2483_c31_67ef_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2483_c21_9586_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2487_c3_96eb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2488_c21_b0bd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2491_c3_7715 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2492_c31_2986_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2492_c31_2986_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2492_c21_149e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2464_l2490_l2459_l2456_l2451_l2468_DUPLICATE_2261_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2464_l2459_l2485_l2456_l2451_l2468_DUPLICATE_eb09_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2451_l2468_DUPLICATE_8d89_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2451_l2472_l2468_DUPLICATE_513a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2472_l2468_DUPLICATE_f011_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2460_l2465_l2473_l2469_DUPLICATE_d64b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2470_l2461_DUPLICATE_4e4a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2470_l2461_DUPLICATE_4e4a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2468_l2490_DUPLICATE_8afa_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2447_l2499_DUPLICATE_e6d8_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2487_c3_96eb := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2487_c3_96eb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2477_c3_cdcf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2477_c3_cdcf;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2491_c3_7715 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2491_c3_7715;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2462_c3_a0c4 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2462_c3_a0c4;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2453_c3_2c64 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2453_c3_2c64;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2457_c3_57cd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2457_c3_57cd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2482_c3_683a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2482_c3_683a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2466_c3_4ec7 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2466_c3_4ec7;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2483_c31_67ef_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2492_c31_2986_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2485_c11_6942] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_left;
     BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_return_output := BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2464_l2490_l2459_l2456_l2451_l2468_DUPLICATE_2261 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2464_l2490_l2459_l2456_l2451_l2468_DUPLICATE_2261_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2490_c11_ddb2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2472_c11_010d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2464_c11_cef0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2483_c31_67ef] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2483_c31_67ef_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2483_c31_67ef_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2483_c31_67ef_return_output := CONST_SR_8_uxn_opcodes_h_l2483_c31_67ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2494_c11_1381] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381_left;
     BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381_return_output := BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2472_l2468_DUPLICATE_f011 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2472_l2468_DUPLICATE_f011_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2459_c11_12dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2451_l2468_DUPLICATE_8d89 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2451_l2468_DUPLICATE_8d89_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l2492_c31_2986] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2492_c31_2986_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2492_c31_2986_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2492_c31_2986_return_output := CONST_SR_8_uxn_opcodes_h_l2492_c31_2986_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2460_l2465_l2473_l2469_DUPLICATE_d64b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2460_l2465_l2473_l2469_DUPLICATE_d64b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2480_c11_aab9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2451_c6_18ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2488_c21_b0bd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2488_c21_b0bd_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2464_l2459_l2485_l2456_l2451_l2468_DUPLICATE_eb09 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2464_l2459_l2485_l2456_l2451_l2468_DUPLICATE_eb09_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2468_l2490_DUPLICATE_8afa LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2468_l2490_DUPLICATE_8afa_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2468_c11_b590] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_left;
     BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_return_output := BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2451_l2472_l2468_DUPLICATE_513a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2451_l2472_l2468_DUPLICATE_513a_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l2475_c30_345c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_ins;
     sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_x;
     sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_return_output := sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2456_c11_a1c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2451_c2_286a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2451_c2_286a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2451_c6_18ab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2456_c7_499c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2456_c7_499c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_a1c3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2459_c7_1c86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2459_c7_1c86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_12dd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2464_c7_12e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2464_c7_12e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_cef0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2468_c7_5a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_b590_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2472_c7_aa61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_010d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_aab9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_6942_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2490_c11_ddb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_1381_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2460_l2465_l2473_l2469_DUPLICATE_d64b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2460_l2465_l2473_l2469_DUPLICATE_d64b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2470_l2461_DUPLICATE_4e4a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2460_l2465_l2473_l2469_DUPLICATE_d64b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2488_c21_b0bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2451_l2472_l2468_DUPLICATE_513a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2451_l2472_l2468_DUPLICATE_513a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2451_l2472_l2468_DUPLICATE_513a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2451_l2472_l2468_DUPLICATE_513a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2451_l2472_l2468_DUPLICATE_513a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2464_l2459_l2456_l2451_l2472_l2468_DUPLICATE_513a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2472_l2468_DUPLICATE_f011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2472_l2468_DUPLICATE_f011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2472_l2468_DUPLICATE_f011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2472_l2468_DUPLICATE_f011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2472_l2468_DUPLICATE_f011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2472_l2468_DUPLICATE_f011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2472_l2468_DUPLICATE_f011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2472_l2468_DUPLICATE_f011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2472_l2468_DUPLICATE_f011_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2464_l2459_l2485_l2456_l2451_l2468_DUPLICATE_eb09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2464_l2459_l2485_l2456_l2451_l2468_DUPLICATE_eb09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2464_l2459_l2485_l2456_l2451_l2468_DUPLICATE_eb09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2464_l2459_l2485_l2456_l2451_l2468_DUPLICATE_eb09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2464_l2459_l2485_l2456_l2451_l2468_DUPLICATE_eb09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2464_l2459_l2485_l2456_l2451_l2468_DUPLICATE_eb09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2451_l2468_DUPLICATE_8d89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2451_l2468_DUPLICATE_8d89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2451_l2468_DUPLICATE_8d89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2451_l2468_DUPLICATE_8d89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2451_l2468_DUPLICATE_8d89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2451_l2468_DUPLICATE_8d89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2451_l2468_DUPLICATE_8d89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2451_l2468_DUPLICATE_8d89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2494_l2464_l2490_l2459_l2485_l2456_l2480_l2451_l2468_DUPLICATE_8d89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2468_l2490_DUPLICATE_8afa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2468_l2490_DUPLICATE_8afa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2464_l2490_l2459_l2456_l2451_l2468_DUPLICATE_2261_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2464_l2490_l2459_l2456_l2451_l2468_DUPLICATE_2261_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2464_l2490_l2459_l2456_l2451_l2468_DUPLICATE_2261_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2464_l2490_l2459_l2456_l2451_l2468_DUPLICATE_2261_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2464_l2490_l2459_l2456_l2451_l2468_DUPLICATE_2261_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2464_l2490_l2459_l2456_l2451_l2468_DUPLICATE_2261_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2475_c30_345c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2494_c7_d610] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2470_l2461_DUPLICATE_4e4a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2470_l2461_DUPLICATE_4e4a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2470_l2461_DUPLICATE_4e4a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2470_l2461_DUPLICATE_4e4a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2470_l2461_DUPLICATE_4e4a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2485_c7_72cf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2451_c1_c8c3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2494_c7_d610] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2483_c21_9586] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2483_c21_9586_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2483_c31_67ef_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2472_c7_aa61] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2492_c21_149e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2492_c21_149e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2492_c31_2986_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2473_c3_21fe] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe_left;
     BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe_return_output := BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2465_c3_4ef2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2_left;
     BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2_return_output := BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2490_c7_1f5b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2465_c3_4ef2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2483_c21_9586_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2492_c21_149e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2470_l2461_DUPLICATE_4e4a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2470_l2461_DUPLICATE_4e4a_return_output;
     VAR_printf_uxn_opcodes_h_l2452_c3_d1aa_uxn_opcodes_h_l2452_c3_d1aa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2451_c1_c8c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_d610_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2494_c7_d610_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output;
     -- printf_uxn_opcodes_h_l2452_c3_d1aa[uxn_opcodes_h_l2452_c3_d1aa] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2452_c3_d1aa_uxn_opcodes_h_l2452_c3_d1aa_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2452_c3_d1aa_uxn_opcodes_h_l2452_c3_d1aa_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2480_c7_e09f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2490_c7_1f5b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2472_c7_aa61] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2472_c7_aa61_cond <= VAR_n16_MUX_uxn_opcodes_h_l2472_c7_aa61_cond;
     n16_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue;
     n16_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output := n16_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output;

     -- t16_MUX[uxn_opcodes_h_l2464_c7_12e1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2464_c7_12e1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2464_c7_12e1_cond;
     t16_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue;
     t16_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output := t16_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2468_c7_5a25] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2478_c21_f8ea] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2478_c21_f8ea_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2473_c3_21fe_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2490_c7_1f5b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2490_c7_1f5b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2485_c7_72cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2478_c21_f8ea_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2490_c7_1f5b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2485_c7_72cf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output := result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2485_c7_72cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2480_c7_e09f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2464_c7_12e1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2472_c7_aa61] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2485_c7_72cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output;

     -- t16_MUX[uxn_opcodes_h_l2459_c7_1c86] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2459_c7_1c86_cond <= VAR_t16_MUX_uxn_opcodes_h_l2459_c7_1c86_cond;
     t16_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue;
     t16_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output := t16_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output;

     -- n16_MUX[uxn_opcodes_h_l2468_c7_5a25] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2468_c7_5a25_cond <= VAR_n16_MUX_uxn_opcodes_h_l2468_c7_5a25_cond;
     n16_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue;
     n16_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output := n16_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2485_c7_72cf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2472_c7_aa61] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output;

     -- n16_MUX[uxn_opcodes_h_l2464_c7_12e1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2464_c7_12e1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2464_c7_12e1_cond;
     n16_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue;
     n16_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output := n16_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2480_c7_e09f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2456_c7_499c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2456_c7_499c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2456_c7_499c_cond;
     t16_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue;
     t16_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2456_c7_499c_return_output := t16_MUX_uxn_opcodes_h_l2456_c7_499c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2459_c7_1c86] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2480_c7_e09f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2468_c7_5a25] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2480_c7_e09f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2480_c7_e09f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2456_c7_499c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2464_c7_12e1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2468_c7_5a25] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2472_c7_aa61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2456_c7_499c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2472_c7_aa61] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output := result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2472_c7_aa61] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output;

     -- t16_MUX[uxn_opcodes_h_l2451_c2_286a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2451_c2_286a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2451_c2_286a_cond;
     t16_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue;
     t16_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2451_c2_286a_return_output := t16_MUX_uxn_opcodes_h_l2451_c2_286a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2459_c7_1c86] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2459_c7_1c86_cond <= VAR_n16_MUX_uxn_opcodes_h_l2459_c7_1c86_cond;
     n16_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue;
     n16_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output := n16_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_499c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2472_c7_aa61_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2451_c2_286a_return_output;
     -- n16_MUX[uxn_opcodes_h_l2456_c7_499c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2456_c7_499c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2456_c7_499c_cond;
     n16_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue;
     n16_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2456_c7_499c_return_output := n16_MUX_uxn_opcodes_h_l2456_c7_499c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2468_c7_5a25] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2451_c2_286a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2468_c7_5a25] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output := result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2468_c7_5a25] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2459_c7_1c86] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2464_c7_12e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2456_c7_499c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2468_c7_5a25_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2464_c7_12e1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2456_c7_499c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2451_c2_286a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2451_c2_286a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2451_c2_286a_cond;
     n16_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue;
     n16_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2451_c2_286a_return_output := n16_MUX_uxn_opcodes_h_l2451_c2_286a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2464_c7_12e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2459_c7_1c86] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2464_c7_12e1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2451_c2_286a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_499c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2464_c7_12e1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2459_c7_1c86] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2456_c7_499c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2459_c7_1c86] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output := result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2459_c7_1c86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2451_c2_286a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_499c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_1c86_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2456_c7_499c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2451_c2_286a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2456_c7_499c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2456_c7_499c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_499c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_499c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_499c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2451_c2_286a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2451_c2_286a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2451_c2_286a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2447_l2499_DUPLICATE_e6d8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2447_l2499_DUPLICATE_e6d8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2451_c2_286a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2451_c2_286a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2451_c2_286a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2451_c2_286a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2451_c2_286a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2451_c2_286a_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2447_l2499_DUPLICATE_e6d8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2447_l2499_DUPLICATE_e6d8_return_output;
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
