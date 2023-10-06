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
-- Submodules: 125
entity div2_0CLK_444c40b9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_444c40b9;
architecture arch of div2_0CLK_444c40b9 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2433_c6_f7e5]
signal BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2433_c1_cce6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2433_c2_9377]
signal n16_MUX_uxn_opcodes_h_l2433_c2_9377_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2433_c2_9377]
signal t16_MUX_uxn_opcodes_h_l2433_c2_9377_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2433_c2_9377]
signal tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2433_c2_9377]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2433_c2_9377]
signal result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2433_c2_9377]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2433_c2_9377]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2433_c2_9377]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2433_c2_9377]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2433_c2_9377]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2434_c3_c335[uxn_opcodes_h_l2434_c3_c335]
signal printf_uxn_opcodes_h_l2434_c3_c335_uxn_opcodes_h_l2434_c3_c335_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2439_c11_7bc7]
signal BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2439_c7_290a]
signal n16_MUX_uxn_opcodes_h_l2439_c7_290a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2439_c7_290a]
signal t16_MUX_uxn_opcodes_h_l2439_c7_290a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2439_c7_290a]
signal tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2439_c7_290a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2439_c7_290a]
signal result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2439_c7_290a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2439_c7_290a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2439_c7_290a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2439_c7_290a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2439_c7_290a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2442_c11_a3c0]
signal BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2442_c7_23f6]
signal n16_MUX_uxn_opcodes_h_l2442_c7_23f6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2442_c7_23f6]
signal t16_MUX_uxn_opcodes_h_l2442_c7_23f6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2442_c7_23f6]
signal tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2442_c7_23f6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2442_c7_23f6]
signal result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2442_c7_23f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2442_c7_23f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2442_c7_23f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2442_c7_23f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2442_c7_23f6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2447_c11_ec2d]
signal BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2447_c7_8c0c]
signal n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2447_c7_8c0c]
signal t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2447_c7_8c0c]
signal tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2447_c7_8c0c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2447_c7_8c0c]
signal result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2447_c7_8c0c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2447_c7_8c0c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2447_c7_8c0c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2447_c7_8c0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2447_c7_8c0c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2450_c11_e59e]
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2450_c7_00af]
signal n16_MUX_uxn_opcodes_h_l2450_c7_00af_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2450_c7_00af]
signal t16_MUX_uxn_opcodes_h_l2450_c7_00af_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2450_c7_00af]
signal tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2450_c7_00af]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2450_c7_00af]
signal result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2450_c7_00af]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2450_c7_00af]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2450_c7_00af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2450_c7_00af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2450_c7_00af]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2451_c3_ec93]
signal BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2454_c11_ba1d]
signal BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2454_c7_4ee1]
signal n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2454_c7_4ee1]
signal tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2454_c7_4ee1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2454_c7_4ee1]
signal result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2454_c7_4ee1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2454_c7_4ee1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2454_c7_4ee1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2454_c7_4ee1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2454_c7_4ee1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2457_c11_a421]
signal BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2457_c7_6a58]
signal n16_MUX_uxn_opcodes_h_l2457_c7_6a58_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2457_c7_6a58]
signal tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2457_c7_6a58]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2457_c7_6a58]
signal result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2457_c7_6a58]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2457_c7_6a58]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2457_c7_6a58]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2457_c7_6a58]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2457_c7_6a58]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2462_c11_0145]
signal BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2462_c7_0fa2]
signal n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2462_c7_0fa2]
signal tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2462_c7_0fa2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2462_c7_0fa2]
signal result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2462_c7_0fa2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2462_c7_0fa2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2462_c7_0fa2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2462_c7_0fa2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2462_c7_0fa2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2465_c11_5c8d]
signal BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2465_c7_b6f4]
signal n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2465_c7_b6f4]
signal tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2465_c7_b6f4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2465_c7_b6f4]
signal result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2465_c7_b6f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2465_c7_b6f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2465_c7_b6f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2465_c7_b6f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2465_c7_b6f4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2466_c3_cddb]
signal BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2467_c11_39d0]
signal BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2467_c26_2c7c]
signal BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2467_c11_6d8c]
signal MUX_uxn_opcodes_h_l2467_c11_6d8c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2467_c11_6d8c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2467_c11_6d8c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2467_c11_6d8c_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2470_c32_b25e]
signal BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2470_c32_1e67]
signal BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2470_c32_361e]
signal MUX_uxn_opcodes_h_l2470_c32_361e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2470_c32_361e_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2470_c32_361e_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2470_c32_361e_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2472_c11_2003]
signal BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2472_c7_b791]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2472_c7_b791]
signal result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2472_c7_b791]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2472_c7_b791]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2472_c7_b791]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2478_c11_6d9f]
signal BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2478_c7_6b42]
signal result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2478_c7_6b42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2478_c7_6b42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2478_c7_6b42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2480_c34_b328]
signal CONST_SR_8_uxn_opcodes_h_l2480_c34_b328_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2480_c34_b328_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2482_c11_e104]
signal BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2482_c7_f53c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2482_c7_f53c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2459_l2444_DUPLICATE_e2b3
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2459_l2444_DUPLICATE_e2b3_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2459_l2444_DUPLICATE_e2b3_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5
BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_left,
BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_right,
BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_return_output);

-- n16_MUX_uxn_opcodes_h_l2433_c2_9377
n16_MUX_uxn_opcodes_h_l2433_c2_9377 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2433_c2_9377_cond,
n16_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue,
n16_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse,
n16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output);

-- t16_MUX_uxn_opcodes_h_l2433_c2_9377
t16_MUX_uxn_opcodes_h_l2433_c2_9377 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2433_c2_9377_cond,
t16_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue,
t16_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse,
t16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2433_c2_9377
tmp16_MUX_uxn_opcodes_h_l2433_c2_9377 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_cond,
tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue,
tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse,
tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377
result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377
result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_cond,
result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377
result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377
result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377
result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377
result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_return_output);

-- printf_uxn_opcodes_h_l2434_c3_c335_uxn_opcodes_h_l2434_c3_c335
printf_uxn_opcodes_h_l2434_c3_c335_uxn_opcodes_h_l2434_c3_c335 : entity work.printf_uxn_opcodes_h_l2434_c3_c335_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2434_c3_c335_uxn_opcodes_h_l2434_c3_c335_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7
BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_left,
BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_right,
BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_return_output);

-- n16_MUX_uxn_opcodes_h_l2439_c7_290a
n16_MUX_uxn_opcodes_h_l2439_c7_290a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2439_c7_290a_cond,
n16_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue,
n16_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse,
n16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output);

-- t16_MUX_uxn_opcodes_h_l2439_c7_290a
t16_MUX_uxn_opcodes_h_l2439_c7_290a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2439_c7_290a_cond,
t16_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue,
t16_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse,
t16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2439_c7_290a
tmp16_MUX_uxn_opcodes_h_l2439_c7_290a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_cond,
tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a
result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a
result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a
result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a
result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a
result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0
BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_left,
BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_right,
BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_return_output);

-- n16_MUX_uxn_opcodes_h_l2442_c7_23f6
n16_MUX_uxn_opcodes_h_l2442_c7_23f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2442_c7_23f6_cond,
n16_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue,
n16_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse,
n16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output);

-- t16_MUX_uxn_opcodes_h_l2442_c7_23f6
t16_MUX_uxn_opcodes_h_l2442_c7_23f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2442_c7_23f6_cond,
t16_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue,
t16_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse,
t16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6
tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_cond,
tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6
result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6
result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6
result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d
BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_left,
BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_right,
BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_return_output);

-- n16_MUX_uxn_opcodes_h_l2447_c7_8c0c
n16_MUX_uxn_opcodes_h_l2447_c7_8c0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond,
n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue,
n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse,
n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output);

-- t16_MUX_uxn_opcodes_h_l2447_c7_8c0c
t16_MUX_uxn_opcodes_h_l2447_c7_8c0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond,
t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue,
t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse,
t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c
tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond,
tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c
result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c
result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c
result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c
result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c
result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e
BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_left,
BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_right,
BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_return_output);

-- n16_MUX_uxn_opcodes_h_l2450_c7_00af
n16_MUX_uxn_opcodes_h_l2450_c7_00af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2450_c7_00af_cond,
n16_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue,
n16_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse,
n16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output);

-- t16_MUX_uxn_opcodes_h_l2450_c7_00af
t16_MUX_uxn_opcodes_h_l2450_c7_00af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2450_c7_00af_cond,
t16_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue,
t16_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse,
t16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2450_c7_00af
tmp16_MUX_uxn_opcodes_h_l2450_c7_00af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_cond,
tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue,
tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse,
tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af
result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_cond,
result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af
result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93
BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93_left,
BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93_right,
BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d
BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_left,
BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_right,
BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_return_output);

-- n16_MUX_uxn_opcodes_h_l2454_c7_4ee1
n16_MUX_uxn_opcodes_h_l2454_c7_4ee1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond,
n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue,
n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse,
n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1
tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond,
tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1
result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1
result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1
result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1
result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1
result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421
BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_left,
BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_right,
BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_return_output);

-- n16_MUX_uxn_opcodes_h_l2457_c7_6a58
n16_MUX_uxn_opcodes_h_l2457_c7_6a58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2457_c7_6a58_cond,
n16_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue,
n16_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse,
n16_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58
tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_cond,
tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue,
tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse,
tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58
result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58
result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_cond,
result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58
result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58
result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58
result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58
result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145
BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_left,
BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_right,
BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_return_output);

-- n16_MUX_uxn_opcodes_h_l2462_c7_0fa2
n16_MUX_uxn_opcodes_h_l2462_c7_0fa2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond,
n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue,
n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse,
n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2
tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond,
tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2
result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2
result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2
result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2
result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2
result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d
BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_left,
BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_right,
BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_return_output);

-- n16_MUX_uxn_opcodes_h_l2465_c7_b6f4
n16_MUX_uxn_opcodes_h_l2465_c7_b6f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond,
n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue,
n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse,
n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4
tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond,
tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4
result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4
result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4
result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4
result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4
result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb
BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb_left,
BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb_right,
BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0_left,
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0_right,
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c
BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c_left,
BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c_right,
BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c_return_output);

-- MUX_uxn_opcodes_h_l2467_c11_6d8c
MUX_uxn_opcodes_h_l2467_c11_6d8c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2467_c11_6d8c_cond,
MUX_uxn_opcodes_h_l2467_c11_6d8c_iftrue,
MUX_uxn_opcodes_h_l2467_c11_6d8c_iffalse,
MUX_uxn_opcodes_h_l2467_c11_6d8c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e
BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e_left,
BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e_right,
BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67
BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67_left,
BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67_right,
BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67_return_output);

-- MUX_uxn_opcodes_h_l2470_c32_361e
MUX_uxn_opcodes_h_l2470_c32_361e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2470_c32_361e_cond,
MUX_uxn_opcodes_h_l2470_c32_361e_iftrue,
MUX_uxn_opcodes_h_l2470_c32_361e_iffalse,
MUX_uxn_opcodes_h_l2470_c32_361e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003
BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_left,
BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_right,
BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791
result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791
result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_cond,
result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791
result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791
result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f
BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_left,
BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_right,
BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42
result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_cond,
result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42
result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42
result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2480_c34_b328
CONST_SR_8_uxn_opcodes_h_l2480_c34_b328 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2480_c34_b328_x,
CONST_SR_8_uxn_opcodes_h_l2480_c34_b328_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104
BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104_left,
BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104_right,
BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c
result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c
result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2459_l2444_DUPLICATE_e2b3
CONST_SL_8_uint16_t_uxn_opcodes_h_l2459_l2444_DUPLICATE_e2b3 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2459_l2444_DUPLICATE_e2b3_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2459_l2444_DUPLICATE_e2b3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_return_output,
 n16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output,
 t16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output,
 tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_return_output,
 n16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output,
 t16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_return_output,
 n16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output,
 t16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output,
 tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_return_output,
 n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output,
 t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_return_output,
 n16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output,
 t16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output,
 tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_return_output,
 n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_return_output,
 n16_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output,
 tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_return_output,
 n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_return_output,
 n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c_return_output,
 MUX_uxn_opcodes_h_l2467_c11_6d8c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67_return_output,
 MUX_uxn_opcodes_h_l2470_c32_361e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output,
 CONST_SR_8_uxn_opcodes_h_l2480_c34_b328_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2459_l2444_DUPLICATE_e2b3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2433_c2_9377_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2433_c2_9377_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2436_c3_6196 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2434_c3_c335_uxn_opcodes_h_l2434_c3_c335_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2439_c7_290a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2439_c7_290a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2440_c3_088b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2442_c7_23f6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2442_c7_23f6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2445_c3_b574 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2448_c3_caa4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2450_c7_00af_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c7_00af_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2452_c3_967c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2455_c3_483f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2457_c7_6a58_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2460_c3_0681 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2463_c3_1311 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2467_c11_6d8c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2467_c11_6d8c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2467_c11_6d8c_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2467_c11_6d8c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2470_c32_361e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2470_c32_361e_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2470_c32_361e_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2470_c32_361e_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2475_c3_9d75 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2476_c24_9d7e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2479_c3_2ffc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2480_c34_b328_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2480_c34_b328_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2480_c24_727b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2472_l2442_DUPLICATE_8e54_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2478_l2447_l2442_DUPLICATE_0bfe_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2482_l2450_l2478_l2447_l2442_DUPLICATE_1b32_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2442_DUPLICATE_f5d5_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2482_l2450_l2478_l2447_l2472_l2442_DUPLICATE_7634_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2450_l2447_l2442_DUPLICATE_1d6f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2451_l2466_l2458_l2443_DUPLICATE_308e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2459_l2444_DUPLICATE_e2b3_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2459_l2444_DUPLICATE_e2b3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2465_l2478_DUPLICATE_7fa3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2487_l2429_DUPLICATE_b4a4_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l2467_c11_6d8c_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_opcodes_h_l2470_c32_361e_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2445_c3_b574 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2445_c3_b574;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2448_c3_caa4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2448_c3_caa4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l2470_c32_361e_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_right := to_unsigned(6, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2475_c3_9d75 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2475_c3_9d75;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2455_c3_483f := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2455_c3_483f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_right := to_unsigned(10, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2440_c3_088b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2440_c3_088b;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2452_c3_967c := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2452_c3_967c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2463_c3_1311 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2463_c3_1311;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2436_c3_6196 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2436_c3_6196;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2479_c3_2ffc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2479_c3_2ffc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2460_c3_0681 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2460_c3_0681;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2480_c34_b328_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2467_c11_39d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2465_c11_5c8d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2482_l2450_l2478_l2447_l2472_l2442_DUPLICATE_7634 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2482_l2450_l2478_l2447_l2472_l2442_DUPLICATE_7634_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l2470_c32_b25e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e_left;
     BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e_return_output := BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2442_c11_a3c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2433_c6_f7e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2472_l2442_DUPLICATE_8e54 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2472_l2442_DUPLICATE_8e54_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2478_c11_6d9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2482_l2450_l2478_l2447_l2442_DUPLICATE_1b32 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2482_l2450_l2478_l2447_l2442_DUPLICATE_1b32_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2478_l2447_l2442_DUPLICATE_0bfe LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2478_l2447_l2442_DUPLICATE_0bfe_return_output := result.stack_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2442_DUPLICATE_f5d5 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2442_DUPLICATE_f5d5_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2447_c11_ec2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2480_c34_b328] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2480_c34_b328_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2480_c34_b328_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2480_c34_b328_return_output := CONST_SR_8_uxn_opcodes_h_l2480_c34_b328_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2465_l2478_DUPLICATE_7fa3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2465_l2478_DUPLICATE_7fa3_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2450_l2447_l2442_DUPLICATE_1d6f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2450_l2447_l2442_DUPLICATE_1d6f_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2472_c11_2003] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_left;
     BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_return_output := BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2476_c24_9d7e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2476_c24_9d7e_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2451_l2466_l2458_l2443_DUPLICATE_308e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2451_l2466_l2458_l2443_DUPLICATE_308e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2462_c11_0145] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_left;
     BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_return_output := BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2482_c11_e104] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104_left;
     BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104_return_output := BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2457_c11_a421] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_left;
     BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_return_output := BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2439_c11_7bc7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2454_c11_ba1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2450_c11_e59e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2470_c32_b25e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2433_c2_9377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2433_c2_9377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c6_f7e5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2439_c7_290a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2439_c7_290a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2439_c11_7bc7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2442_c7_23f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2442_c7_23f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_a3c0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_ec2d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2450_c7_00af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c7_00af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_e59e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2454_c11_ba1d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2457_c7_6a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_a421_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2462_c11_0145_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_5c8d_return_output;
     VAR_MUX_uxn_opcodes_h_l2467_c11_6d8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_39d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_2003_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2478_c11_6d9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c11_e104_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2451_l2466_l2458_l2443_DUPLICATE_308e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2451_l2466_l2458_l2443_DUPLICATE_308e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2459_l2444_DUPLICATE_e2b3_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2451_l2466_l2458_l2443_DUPLICATE_308e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2476_c24_9d7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2442_DUPLICATE_f5d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2442_DUPLICATE_f5d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2442_DUPLICATE_f5d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2442_DUPLICATE_f5d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2442_DUPLICATE_f5d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2442_DUPLICATE_f5d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2442_DUPLICATE_f5d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2442_DUPLICATE_f5d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2442_DUPLICATE_f5d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2482_l2450_l2478_l2447_l2472_l2442_DUPLICATE_7634_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2482_l2450_l2478_l2447_l2472_l2442_DUPLICATE_7634_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2482_l2450_l2478_l2447_l2472_l2442_DUPLICATE_7634_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2482_l2450_l2478_l2447_l2472_l2442_DUPLICATE_7634_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2482_l2450_l2478_l2447_l2472_l2442_DUPLICATE_7634_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2482_l2450_l2478_l2447_l2472_l2442_DUPLICATE_7634_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2482_l2450_l2478_l2447_l2472_l2442_DUPLICATE_7634_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2482_l2450_l2478_l2447_l2472_l2442_DUPLICATE_7634_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2482_l2450_l2478_l2447_l2472_l2442_DUPLICATE_7634_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2482_l2450_l2478_l2447_l2472_l2442_DUPLICATE_7634_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2482_l2450_l2478_l2447_l2472_l2442_DUPLICATE_7634_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2472_l2442_DUPLICATE_8e54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2472_l2442_DUPLICATE_8e54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2472_l2442_DUPLICATE_8e54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2472_l2442_DUPLICATE_8e54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2472_l2442_DUPLICATE_8e54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2472_l2442_DUPLICATE_8e54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2472_l2442_DUPLICATE_8e54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2472_l2442_DUPLICATE_8e54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2439_l2462_l2433_l2457_l2454_l2450_l2447_l2472_l2442_DUPLICATE_8e54_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2450_l2447_l2442_DUPLICATE_1d6f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2450_l2447_l2442_DUPLICATE_1d6f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2450_l2447_l2442_DUPLICATE_1d6f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2450_l2447_l2442_DUPLICATE_1d6f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2450_l2447_l2442_DUPLICATE_1d6f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2450_l2447_l2442_DUPLICATE_1d6f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2450_l2447_l2442_DUPLICATE_1d6f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2457_l2454_l2450_l2447_l2442_DUPLICATE_1d6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2482_l2450_l2478_l2447_l2442_DUPLICATE_1b32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2482_l2450_l2478_l2447_l2442_DUPLICATE_1b32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2482_l2450_l2478_l2447_l2442_DUPLICATE_1b32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2482_l2450_l2478_l2447_l2442_DUPLICATE_1b32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2482_l2450_l2478_l2447_l2442_DUPLICATE_1b32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2482_l2450_l2478_l2447_l2442_DUPLICATE_1b32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2482_l2450_l2478_l2447_l2442_DUPLICATE_1b32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2482_l2450_l2478_l2447_l2442_DUPLICATE_1b32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2482_l2450_l2478_l2447_l2442_DUPLICATE_1b32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2482_l2450_l2478_l2447_l2442_DUPLICATE_1b32_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2482_l2450_l2478_l2447_l2442_DUPLICATE_1b32_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2465_l2478_DUPLICATE_7fa3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2465_l2478_DUPLICATE_7fa3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2478_l2447_l2442_DUPLICATE_0bfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2478_l2447_l2442_DUPLICATE_0bfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2478_l2447_l2442_DUPLICATE_0bfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2478_l2447_l2442_DUPLICATE_0bfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2478_l2447_l2442_DUPLICATE_0bfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2478_l2447_l2442_DUPLICATE_0bfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2478_l2447_l2442_DUPLICATE_0bfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2478_l2447_l2442_DUPLICATE_0bfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2478_l2447_l2442_DUPLICATE_0bfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2465_l2439_l2462_l2433_l2457_l2454_l2450_l2478_l2447_l2442_DUPLICATE_0bfe_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l2470_c32_1e67] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67_left;
     BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67_return_output := BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2451_c3_ec93] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93_left;
     BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93_return_output := BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2465_c7_b6f4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2482_c7_f53c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2433_c1_cce6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2466_c3_cddb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb_left;
     BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb_return_output := BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2480_c24_727b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2480_c24_727b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2480_c34_b328_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2472_c7_b791] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2482_c7_f53c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2478_c7_6b42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2459_l2444_DUPLICATE_e2b3 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2459_l2444_DUPLICATE_e2b3_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2459_l2444_DUPLICATE_e2b3_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2459_l2444_DUPLICATE_e2b3_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2459_l2444_DUPLICATE_e2b3_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2470_c32_361e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2470_c32_1e67_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2451_c3_ec93_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2466_c3_cddb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2480_c24_727b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2459_l2444_DUPLICATE_e2b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2459_l2444_DUPLICATE_e2b3_return_output;
     VAR_printf_uxn_opcodes_h_l2434_c3_c335_uxn_opcodes_h_l2434_c3_c335_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2433_c1_cce6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c7_f53c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_b791_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c7_f53c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2465_c7_b6f4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2467_c26_2c7c] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c_left;
     BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c_return_output := BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2450_c7_00af] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2450_c7_00af_cond <= VAR_t16_MUX_uxn_opcodes_h_l2450_c7_00af_cond;
     t16_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue;
     t16_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output := t16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output;

     -- MUX[uxn_opcodes_h_l2470_c32_361e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2470_c32_361e_cond <= VAR_MUX_uxn_opcodes_h_l2470_c32_361e_cond;
     MUX_uxn_opcodes_h_l2470_c32_361e_iftrue <= VAR_MUX_uxn_opcodes_h_l2470_c32_361e_iftrue;
     MUX_uxn_opcodes_h_l2470_c32_361e_iffalse <= VAR_MUX_uxn_opcodes_h_l2470_c32_361e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2470_c32_361e_return_output := MUX_uxn_opcodes_h_l2470_c32_361e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2478_c7_6b42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2462_c7_0fa2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2478_c7_6b42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output;

     -- n16_MUX[uxn_opcodes_h_l2465_c7_b6f4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond;
     n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue;
     n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output := n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2472_c7_b791] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2478_c7_6b42] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output := result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output;

     -- printf_uxn_opcodes_h_l2434_c3_c335[uxn_opcodes_h_l2434_c3_c335] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2434_c3_c335_uxn_opcodes_h_l2434_c3_c335_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2434_c3_c335_uxn_opcodes_h_l2434_c3_c335_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2467_c11_6d8c_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2467_c26_2c7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue := VAR_MUX_uxn_opcodes_h_l2470_c32_361e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_b791_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2478_c7_6b42_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output;
     -- MUX[uxn_opcodes_h_l2467_c11_6d8c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2467_c11_6d8c_cond <= VAR_MUX_uxn_opcodes_h_l2467_c11_6d8c_cond;
     MUX_uxn_opcodes_h_l2467_c11_6d8c_iftrue <= VAR_MUX_uxn_opcodes_h_l2467_c11_6d8c_iftrue;
     MUX_uxn_opcodes_h_l2467_c11_6d8c_iffalse <= VAR_MUX_uxn_opcodes_h_l2467_c11_6d8c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2467_c11_6d8c_return_output := MUX_uxn_opcodes_h_l2467_c11_6d8c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2457_c7_6a58] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2472_c7_b791] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_return_output := result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2465_c7_b6f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2472_c7_b791] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2462_c7_0fa2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2462_c7_0fa2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond;
     n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue;
     n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output := n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2465_c7_b6f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2472_c7_b791] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_return_output;

     -- t16_MUX[uxn_opcodes_h_l2447_c7_8c0c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond;
     t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue;
     t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output := t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue := VAR_MUX_uxn_opcodes_h_l2467_c11_6d8c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_b791_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_b791_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_b791_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2465_c7_b6f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2442_c7_23f6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2442_c7_23f6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2442_c7_23f6_cond;
     t16_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue;
     t16_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output := t16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2465_c7_b6f4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2465_c7_b6f4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond;
     tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output := tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2454_c7_4ee1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2462_c7_0fa2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2457_c7_6a58] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2457_c7_6a58_cond <= VAR_n16_MUX_uxn_opcodes_h_l2457_c7_6a58_cond;
     n16_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue;
     n16_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output := n16_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2457_c7_6a58] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2462_c7_0fa2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2465_c7_b6f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2465_c7_b6f4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2457_c7_6a58] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output;

     -- n16_MUX[uxn_opcodes_h_l2454_c7_4ee1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond;
     n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue;
     n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output := n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2454_c7_4ee1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2457_c7_6a58] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2462_c7_0fa2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2462_c7_0fa2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2462_c7_0fa2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2462_c7_0fa2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_cond;
     tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output := tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2450_c7_00af] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_return_output;

     -- t16_MUX[uxn_opcodes_h_l2439_c7_290a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2439_c7_290a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2439_c7_290a_cond;
     t16_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue;
     t16_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output := t16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2450_c7_00af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2462_c7_0fa2_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2450_c7_00af] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_return_output;

     -- n16_MUX[uxn_opcodes_h_l2450_c7_00af] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2450_c7_00af_cond <= VAR_n16_MUX_uxn_opcodes_h_l2450_c7_00af_cond;
     n16_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue;
     n16_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output := n16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2457_c7_6a58] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2454_c7_4ee1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2454_c7_4ee1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2457_c7_6a58] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2447_c7_8c0c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2457_c7_6a58] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_cond;
     tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output := tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2457_c7_6a58] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output := result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output;

     -- t16_MUX[uxn_opcodes_h_l2433_c2_9377] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2433_c2_9377_cond <= VAR_t16_MUX_uxn_opcodes_h_l2433_c2_9377_cond;
     t16_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue;
     t16_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output := t16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_00af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2457_c7_6a58_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2454_c7_4ee1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2454_c7_4ee1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2442_c7_23f6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2450_c7_00af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2454_c7_4ee1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2454_c7_4ee1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_cond;
     tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output := tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2450_c7_00af] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2447_c7_8c0c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2447_c7_8c0c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond;
     n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue;
     n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output := n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_00af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_00af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2454_c7_4ee1_return_output;
     -- n16_MUX[uxn_opcodes_h_l2442_c7_23f6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2442_c7_23f6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2442_c7_23f6_cond;
     n16_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue;
     n16_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output := n16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2450_c7_00af] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2450_c7_00af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2447_c7_8c0c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2447_c7_8c0c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2450_c7_00af] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_return_output := result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2442_c7_23f6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2450_c7_00af] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_cond;
     tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output := tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2439_c7_290a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_00af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2439_c7_290a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_00af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2450_c7_00af_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2450_c7_00af_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2442_c7_23f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2447_c7_8c0c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2447_c7_8c0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2433_c2_9377] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2442_c7_23f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2439_c7_290a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2447_c7_8c0c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2439_c7_290a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2439_c7_290a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2439_c7_290a_cond;
     n16_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue;
     n16_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output := n16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2447_c7_8c0c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_cond;
     tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output := tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2439_c7_290a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2447_c7_8c0c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2433_c2_9377] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2439_c7_290a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2442_c7_23f6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_cond;
     tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output := tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2442_c7_23f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2439_c7_290a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2433_c2_9377] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2433_c2_9377_cond <= VAR_n16_MUX_uxn_opcodes_h_l2433_c2_9377_cond;
     n16_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue;
     n16_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output := n16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2442_c7_23f6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2442_c7_23f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2439_c7_290a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2439_c7_290a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2442_c7_23f6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2439_c7_290a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2439_c7_290a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2433_c2_9377] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2439_c7_290a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2433_c2_9377] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2439_c7_290a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_cond;
     tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output := tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2439_c7_290a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2439_c7_290a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2439_c7_290a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2439_c7_290a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2433_c2_9377] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2433_c2_9377] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_cond;
     tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output := tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2433_c2_9377] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_return_output := result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2433_c2_9377] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_return_output;

     -- Submodule level 13
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2433_c2_9377_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2487_l2429_DUPLICATE_b4a4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2487_l2429_DUPLICATE_b4a4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2433_c2_9377_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c2_9377_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c2_9377_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2433_c2_9377_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c2_9377_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c2_9377_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2433_c2_9377_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2487_l2429_DUPLICATE_b4a4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2487_l2429_DUPLICATE_b4a4_return_output;
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
