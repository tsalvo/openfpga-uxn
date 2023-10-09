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
-- Submodules: 64
entity ora_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora_0CLK_fd2391e7;
architecture arch of ora_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1107_c6_a956]
signal BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1107_c1_5e2c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1107_c2_23a3]
signal t8_MUX_uxn_opcodes_h_l1107_c2_23a3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1107_c2_23a3]
signal n8_MUX_uxn_opcodes_h_l1107_c2_23a3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1107_c2_23a3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1107_c2_23a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1107_c2_23a3]
signal result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1107_c2_23a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1107_c2_23a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1107_c2_23a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1107_c2_23a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1108_c3_5a85[uxn_opcodes_h_l1108_c3_5a85]
signal printf_uxn_opcodes_h_l1108_c3_5a85_uxn_opcodes_h_l1108_c3_5a85_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1113_c11_b712]
signal BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1113_c7_c37d]
signal t8_MUX_uxn_opcodes_h_l1113_c7_c37d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1113_c7_c37d]
signal n8_MUX_uxn_opcodes_h_l1113_c7_c37d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1113_c7_c37d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1113_c7_c37d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1113_c7_c37d]
signal result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1113_c7_c37d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1113_c7_c37d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1113_c7_c37d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1113_c7_c37d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1116_c11_7b78]
signal BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1116_c7_044a]
signal t8_MUX_uxn_opcodes_h_l1116_c7_044a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1116_c7_044a_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1116_c7_044a]
signal n8_MUX_uxn_opcodes_h_l1116_c7_044a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1116_c7_044a_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1116_c7_044a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1116_c7_044a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1116_c7_044a]
signal result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1116_c7_044a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1116_c7_044a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1116_c7_044a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1116_c7_044a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1120_c11_9227]
signal BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1120_c7_a1e8]
signal n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1120_c7_a1e8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1120_c7_a1e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1120_c7_a1e8]
signal result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1120_c7_a1e8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1120_c7_a1e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1120_c7_a1e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1120_c7_a1e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1123_c11_a135]
signal BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1123_c7_f955]
signal n8_MUX_uxn_opcodes_h_l1123_c7_f955_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1123_c7_f955_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1123_c7_f955]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1123_c7_f955]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1123_c7_f955]
signal result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1123_c7_f955]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1123_c7_f955]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1123_c7_f955]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1123_c7_f955]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1127_c32_8089]
signal BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1127_c32_42a3]
signal BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1127_c32_5ec4]
signal MUX_uxn_opcodes_h_l1127_c32_5ec4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1127_c32_5ec4_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1127_c32_5ec4_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1127_c32_5ec4_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1129_c11_25f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1129_c7_150d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1129_c7_150d]
signal result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1129_c7_150d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1129_c7_150d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1129_c7_150d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1133_c24_d54f]
signal BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1135_c11_f7a4]
signal BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1135_c7_6dbc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1135_c7_6dbc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956
BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_left,
BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_right,
BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_return_output);

-- t8_MUX_uxn_opcodes_h_l1107_c2_23a3
t8_MUX_uxn_opcodes_h_l1107_c2_23a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1107_c2_23a3_cond,
t8_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue,
t8_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse,
t8_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output);

-- n8_MUX_uxn_opcodes_h_l1107_c2_23a3
n8_MUX_uxn_opcodes_h_l1107_c2_23a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1107_c2_23a3_cond,
n8_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue,
n8_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse,
n8_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3
result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3
result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3
result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3
result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3
result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output);

-- printf_uxn_opcodes_h_l1108_c3_5a85_uxn_opcodes_h_l1108_c3_5a85
printf_uxn_opcodes_h_l1108_c3_5a85_uxn_opcodes_h_l1108_c3_5a85 : entity work.printf_uxn_opcodes_h_l1108_c3_5a85_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1108_c3_5a85_uxn_opcodes_h_l1108_c3_5a85_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712
BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_left,
BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_right,
BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_return_output);

-- t8_MUX_uxn_opcodes_h_l1113_c7_c37d
t8_MUX_uxn_opcodes_h_l1113_c7_c37d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1113_c7_c37d_cond,
t8_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue,
t8_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse,
t8_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output);

-- n8_MUX_uxn_opcodes_h_l1113_c7_c37d
n8_MUX_uxn_opcodes_h_l1113_c7_c37d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1113_c7_c37d_cond,
n8_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue,
n8_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse,
n8_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d
result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d
result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d
result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d
result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d
result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78
BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_left,
BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_right,
BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_return_output);

-- t8_MUX_uxn_opcodes_h_l1116_c7_044a
t8_MUX_uxn_opcodes_h_l1116_c7_044a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1116_c7_044a_cond,
t8_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue,
t8_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse,
t8_MUX_uxn_opcodes_h_l1116_c7_044a_return_output);

-- n8_MUX_uxn_opcodes_h_l1116_c7_044a
n8_MUX_uxn_opcodes_h_l1116_c7_044a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1116_c7_044a_cond,
n8_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue,
n8_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse,
n8_MUX_uxn_opcodes_h_l1116_c7_044a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a
result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a
result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a
result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a
result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a
result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227
BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_left,
BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_right,
BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_return_output);

-- n8_MUX_uxn_opcodes_h_l1120_c7_a1e8
n8_MUX_uxn_opcodes_h_l1120_c7_a1e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond,
n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue,
n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse,
n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8
result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8
result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8
result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8
result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8
result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135
BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_left,
BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_right,
BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_return_output);

-- n8_MUX_uxn_opcodes_h_l1123_c7_f955
n8_MUX_uxn_opcodes_h_l1123_c7_f955 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1123_c7_f955_cond,
n8_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue,
n8_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse,
n8_MUX_uxn_opcodes_h_l1123_c7_f955_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955
result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955
result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955
result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_cond,
result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955
result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955
result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955
result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089
BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089_left,
BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089_right,
BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3
BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3_left,
BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3_right,
BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3_return_output);

-- MUX_uxn_opcodes_h_l1127_c32_5ec4
MUX_uxn_opcodes_h_l1127_c32_5ec4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1127_c32_5ec4_cond,
MUX_uxn_opcodes_h_l1127_c32_5ec4_iftrue,
MUX_uxn_opcodes_h_l1127_c32_5ec4_iffalse,
MUX_uxn_opcodes_h_l1127_c32_5ec4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9
BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d
result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d
result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d
result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d
result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f
BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f_left,
BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f_right,
BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4
BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4_left,
BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4_right,
BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc
result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc
result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_return_output,
 t8_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output,
 n8_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_return_output,
 t8_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output,
 n8_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_return_output,
 t8_MUX_uxn_opcodes_h_l1116_c7_044a_return_output,
 n8_MUX_uxn_opcodes_h_l1116_c7_044a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_return_output,
 n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_return_output,
 n8_MUX_uxn_opcodes_h_l1123_c7_f955_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3_return_output,
 MUX_uxn_opcodes_h_l1127_c32_5ec4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1107_c2_23a3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1107_c2_23a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1110_c3_622e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1108_c3_5a85_uxn_opcodes_h_l1108_c3_5a85_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1116_c7_044a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1113_c7_c37d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1116_c7_044a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1113_c7_c37d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1114_c3_ad36 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1116_c7_044a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1116_c7_044a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_beb4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1123_c7_f955_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_5cee : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1123_c7_f955_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1127_c32_5ec4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1127_c32_5ec4_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1127_c32_5ec4_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1127_c32_5ec4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1132_c3_edd8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_DUPLICATE_1324_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_l1129_DUPLICATE_d94d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1120_l1116_l1113_l1107_l1129_DUPLICATE_e7b7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_l1135_DUPLICATE_1cae_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1113_l1123_l1116_l1120_DUPLICATE_7d25_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1135_l1129_DUPLICATE_3884_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1123_l1129_DUPLICATE_b048_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1103_l1140_DUPLICATE_08cc_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1127_c32_5ec4_iffalse := resize(to_signed(-1, 2), 8);
     VAR_MUX_uxn_opcodes_h_l1127_c32_5ec4_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1110_c3_622e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1110_c3_622e;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1114_c3_ad36 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1114_c3_ad36;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_beb4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1118_c3_beb4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1132_c3_edd8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1132_c3_edd8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_5cee := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_5cee;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_l1135_DUPLICATE_1cae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_l1135_DUPLICATE_1cae_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1135_c11_f7a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1113_l1123_l1116_l1120_DUPLICATE_7d25 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1113_l1123_l1116_l1120_DUPLICATE_7d25_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1129_c11_25f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1133_c24_d54f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f_left;
     BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f_return_output := BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_DUPLICATE_1324 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_DUPLICATE_1324_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1120_l1116_l1113_l1107_l1129_DUPLICATE_e7b7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1120_l1116_l1113_l1107_l1129_DUPLICATE_e7b7_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1135_l1129_DUPLICATE_3884 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1135_l1129_DUPLICATE_3884_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_l1129_DUPLICATE_d94d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_l1129_DUPLICATE_d94d_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1123_c11_a135] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_left;
     BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_return_output := BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1107_c6_a956] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_left;
     BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_return_output := BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1123_l1129_DUPLICATE_b048 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1123_l1129_DUPLICATE_b048_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1120_c11_9227] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_left;
     BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_return_output := BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1127_c32_8089] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089_left;
     BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089_return_output := BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1116_c11_7b78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_left;
     BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_return_output := BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1113_c11_b712] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_left;
     BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_return_output := BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1127_c32_8089_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1107_c2_23a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1107_c2_23a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1107_c6_a956_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1113_c7_c37d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1113_c7_c37d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1113_c11_b712_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1116_c7_044a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1116_c7_044a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1116_c11_7b78_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1120_c11_9227_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1123_c7_f955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a135_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1129_c11_25f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1135_c11_f7a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c24_d54f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_DUPLICATE_1324_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_DUPLICATE_1324_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_DUPLICATE_1324_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_DUPLICATE_1324_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_DUPLICATE_1324_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1135_l1129_DUPLICATE_3884_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1135_l1129_DUPLICATE_3884_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1135_l1129_DUPLICATE_3884_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1135_l1129_DUPLICATE_3884_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1135_l1129_DUPLICATE_3884_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1135_l1129_DUPLICATE_3884_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1120_l1116_l1113_l1107_l1129_DUPLICATE_e7b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1120_l1116_l1113_l1107_l1129_DUPLICATE_e7b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1120_l1116_l1113_l1107_l1129_DUPLICATE_e7b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1120_l1116_l1113_l1107_l1129_DUPLICATE_e7b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1120_l1116_l1113_l1107_l1129_DUPLICATE_e7b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1113_l1123_l1116_l1120_DUPLICATE_7d25_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1113_l1123_l1116_l1120_DUPLICATE_7d25_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1113_l1123_l1116_l1120_DUPLICATE_7d25_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1113_l1123_l1116_l1120_DUPLICATE_7d25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_l1135_DUPLICATE_1cae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_l1135_DUPLICATE_1cae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_l1135_DUPLICATE_1cae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_l1135_DUPLICATE_1cae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_l1135_DUPLICATE_1cae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_l1135_DUPLICATE_1cae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1123_l1129_DUPLICATE_b048_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1123_l1129_DUPLICATE_b048_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_l1129_DUPLICATE_d94d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_l1129_DUPLICATE_d94d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_l1129_DUPLICATE_d94d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_l1129_DUPLICATE_d94d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_l1129_DUPLICATE_d94d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1123_l1120_l1116_l1113_l1107_l1129_DUPLICATE_d94d_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l1127_c32_42a3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3_left;
     BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3_return_output := BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1135_c7_6dbc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1129_c7_150d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1116_c7_044a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1116_c7_044a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1116_c7_044a_cond;
     t8_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue;
     t8_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1116_c7_044a_return_output := t8_MUX_uxn_opcodes_h_l1116_c7_044a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1123_c7_f955] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1135_c7_6dbc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1129_c7_150d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1107_c1_5e2c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1129_c7_150d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_return_output;

     -- n8_MUX[uxn_opcodes_h_l1123_c7_f955] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1123_c7_f955_cond <= VAR_n8_MUX_uxn_opcodes_h_l1123_c7_f955_cond;
     n8_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue;
     n8_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1123_c7_f955_return_output := n8_MUX_uxn_opcodes_h_l1123_c7_f955_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1127_c32_5ec4_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1127_c32_42a3_return_output;
     VAR_printf_uxn_opcodes_h_l1108_c3_5a85_uxn_opcodes_h_l1108_c3_5a85_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1107_c1_5e2c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1123_c7_f955_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1135_c7_6dbc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1129_c7_150d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_f955_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1135_c7_6dbc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1129_c7_150d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1129_c7_150d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1116_c7_044a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1129_c7_150d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_return_output;

     -- printf_uxn_opcodes_h_l1108_c3_5a85[uxn_opcodes_h_l1108_c3_5a85] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1108_c3_5a85_uxn_opcodes_h_l1108_c3_5a85_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1108_c3_5a85_uxn_opcodes_h_l1108_c3_5a85_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1123_c7_f955] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_return_output;

     -- t8_MUX[uxn_opcodes_h_l1113_c7_c37d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1113_c7_c37d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1113_c7_c37d_cond;
     t8_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue;
     t8_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output := t8_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1123_c7_f955] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1120_c7_a1e8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output;

     -- MUX[uxn_opcodes_h_l1127_c32_5ec4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1127_c32_5ec4_cond <= VAR_MUX_uxn_opcodes_h_l1127_c32_5ec4_cond;
     MUX_uxn_opcodes_h_l1127_c32_5ec4_iftrue <= VAR_MUX_uxn_opcodes_h_l1127_c32_5ec4_iftrue;
     MUX_uxn_opcodes_h_l1127_c32_5ec4_iffalse <= VAR_MUX_uxn_opcodes_h_l1127_c32_5ec4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1127_c32_5ec4_return_output := MUX_uxn_opcodes_h_l1127_c32_5ec4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1123_c7_f955] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_return_output := result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_return_output;

     -- n8_MUX[uxn_opcodes_h_l1120_c7_a1e8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond <= VAR_n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond;
     n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue;
     n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output := n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1129_c7_150d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue := VAR_MUX_uxn_opcodes_h_l1127_c32_5ec4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1129_c7_150d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_f955_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1129_c7_150d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_f955_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_f955_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1120_c7_a1e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1123_c7_f955] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1123_c7_f955] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_return_output;

     -- t8_MUX[uxn_opcodes_h_l1107_c2_23a3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1107_c2_23a3_cond <= VAR_t8_MUX_uxn_opcodes_h_l1107_c2_23a3_cond;
     t8_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue;
     t8_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output := t8_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1116_c7_044a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1120_c7_a1e8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1123_c7_f955] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_return_output;

     -- n8_MUX[uxn_opcodes_h_l1116_c7_044a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1116_c7_044a_cond <= VAR_n8_MUX_uxn_opcodes_h_l1116_c7_044a_cond;
     n8_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue;
     n8_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1116_c7_044a_return_output := n8_MUX_uxn_opcodes_h_l1116_c7_044a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1120_c7_a1e8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1116_c7_044a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_f955_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1116_c7_044a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_f955_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_f955_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1120_c7_a1e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1116_c7_044a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_return_output;

     -- n8_MUX[uxn_opcodes_h_l1113_c7_c37d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1113_c7_c37d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1113_c7_c37d_cond;
     n8_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue;
     n8_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output := n8_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1116_c7_044a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1116_c7_044a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1113_c7_c37d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1120_c7_a1e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1120_c7_a1e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1116_c7_044a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1120_c7_a1e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1116_c7_044a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1116_c7_044a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1116_c7_044a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1116_c7_044a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_return_output;

     -- n8_MUX[uxn_opcodes_h_l1107_c2_23a3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1107_c2_23a3_cond <= VAR_n8_MUX_uxn_opcodes_h_l1107_c2_23a3_cond;
     n8_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue;
     n8_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output := n8_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1107_c2_23a3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1113_c7_c37d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1113_c7_c37d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1113_c7_c37d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1116_c7_044a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1116_c7_044a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1116_c7_044a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1116_c7_044a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1107_c2_23a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1107_c2_23a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1113_c7_c37d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1113_c7_c37d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1107_c2_23a3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1113_c7_c37d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1113_c7_c37d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1107_c2_23a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1107_c2_23a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1107_c2_23a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1103_l1140_DUPLICATE_08cc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1103_l1140_DUPLICATE_08cc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1107_c2_23a3_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1103_l1140_DUPLICATE_08cc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1103_l1140_DUPLICATE_08cc_return_output;
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
