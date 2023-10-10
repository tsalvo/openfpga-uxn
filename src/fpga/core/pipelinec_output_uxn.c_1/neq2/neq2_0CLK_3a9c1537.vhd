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
entity neq2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_3a9c1537;
architecture arch of neq2_0CLK_3a9c1537 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1433_c6_5ff2]
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1433_c1_a9c3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1433_c2_be9a]
signal n16_MUX_uxn_opcodes_h_l1433_c2_be9a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1433_c2_be9a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1433_c2_be9a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1433_c2_be9a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1433_c2_be9a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1433_c2_be9a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1433_c2_be9a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1433_c2_be9a]
signal result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1433_c2_be9a]
signal t16_MUX_uxn_opcodes_h_l1433_c2_be9a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1434_c3_427f[uxn_opcodes_h_l1434_c3_427f]
signal printf_uxn_opcodes_h_l1434_c3_427f_uxn_opcodes_h_l1434_c3_427f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1439_c11_1952]
signal BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1439_c7_0ef7]
signal n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1439_c7_0ef7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1439_c7_0ef7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1439_c7_0ef7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1439_c7_0ef7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1439_c7_0ef7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1439_c7_0ef7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1439_c7_0ef7]
signal result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1439_c7_0ef7]
signal t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1442_c11_4e93]
signal BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1442_c7_257e]
signal n16_MUX_uxn_opcodes_h_l1442_c7_257e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1442_c7_257e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1442_c7_257e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1442_c7_257e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1442_c7_257e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1442_c7_257e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1442_c7_257e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1442_c7_257e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1442_c7_257e]
signal result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1442_c7_257e]
signal t16_MUX_uxn_opcodes_h_l1442_c7_257e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1442_c7_257e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1447_c11_90b6]
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1447_c7_b40b]
signal n16_MUX_uxn_opcodes_h_l1447_c7_b40b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1447_c7_b40b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1447_c7_b40b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1447_c7_b40b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1447_c7_b40b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1447_c7_b40b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1447_c7_b40b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1447_c7_b40b]
signal result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1447_c7_b40b]
signal t16_MUX_uxn_opcodes_h_l1447_c7_b40b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1450_c11_e149]
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1450_c7_8647]
signal n16_MUX_uxn_opcodes_h_l1450_c7_8647_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1450_c7_8647_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1450_c7_8647]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1450_c7_8647]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1450_c7_8647]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1450_c7_8647]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1450_c7_8647]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1450_c7_8647]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1450_c7_8647]
signal result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1450_c7_8647]
signal t16_MUX_uxn_opcodes_h_l1450_c7_8647_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1450_c7_8647_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1451_c3_fc77]
signal BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1454_c11_5d72]
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1454_c7_0c85]
signal n16_MUX_uxn_opcodes_h_l1454_c7_0c85_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1454_c7_0c85]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1454_c7_0c85]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1454_c7_0c85]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1454_c7_0c85]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1454_c7_0c85]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1454_c7_0c85]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1454_c7_0c85]
signal result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1457_c11_30e8]
signal BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1457_c7_a11c]
signal n16_MUX_uxn_opcodes_h_l1457_c7_a11c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1457_c7_a11c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1457_c7_a11c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1457_c7_a11c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1457_c7_a11c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1457_c7_a11c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1457_c7_a11c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1457_c7_a11c]
signal result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1462_c11_f54d]
signal BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1462_c7_1c38]
signal n16_MUX_uxn_opcodes_h_l1462_c7_1c38_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1462_c7_1c38]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1462_c7_1c38]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1462_c7_1c38]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1462_c7_1c38]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1462_c7_1c38]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1462_c7_1c38]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1462_c7_1c38]
signal result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1465_c11_efcf]
signal BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1465_c7_4cd4]
signal n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1465_c7_4cd4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1465_c7_4cd4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1465_c7_4cd4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1465_c7_4cd4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1465_c7_4cd4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1465_c7_4cd4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1465_c7_4cd4]
signal result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1466_c3_349b]
signal BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1469_c32_1fa8]
signal BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1469_c32_0806]
signal BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1469_c32_9a15]
signal MUX_uxn_opcodes_h_l1469_c32_9a15_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1469_c32_9a15_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1469_c32_9a15_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1469_c32_9a15_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1471_c11_82fd]
signal BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1471_c7_1911]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1471_c7_1911]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1471_c7_1911]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1471_c7_1911]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1471_c7_1911]
signal result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1475_c24_7d5c]
signal BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1475_c24_4864]
signal MUX_uxn_opcodes_h_l1475_c24_4864_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1475_c24_4864_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1475_c24_4864_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1475_c24_4864_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1477_c11_73d9]
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c7_35ca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c7_35ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1459_l1444_DUPLICATE_bdfc
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1459_l1444_DUPLICATE_bdfc_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1459_l1444_DUPLICATE_bdfc_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2
BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_left,
BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_right,
BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_return_output);

-- n16_MUX_uxn_opcodes_h_l1433_c2_be9a
n16_MUX_uxn_opcodes_h_l1433_c2_be9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1433_c2_be9a_cond,
n16_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue,
n16_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse,
n16_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a
result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a
result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a
result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output);

-- t16_MUX_uxn_opcodes_h_l1433_c2_be9a
t16_MUX_uxn_opcodes_h_l1433_c2_be9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1433_c2_be9a_cond,
t16_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue,
t16_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse,
t16_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output);

-- printf_uxn_opcodes_h_l1434_c3_427f_uxn_opcodes_h_l1434_c3_427f
printf_uxn_opcodes_h_l1434_c3_427f_uxn_opcodes_h_l1434_c3_427f : entity work.printf_uxn_opcodes_h_l1434_c3_427f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1434_c3_427f_uxn_opcodes_h_l1434_c3_427f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_left,
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_right,
BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_return_output);

-- n16_MUX_uxn_opcodes_h_l1439_c7_0ef7
n16_MUX_uxn_opcodes_h_l1439_c7_0ef7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond,
n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue,
n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse,
n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7
result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7
result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7
result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output);

-- t16_MUX_uxn_opcodes_h_l1439_c7_0ef7
t16_MUX_uxn_opcodes_h_l1439_c7_0ef7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond,
t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue,
t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse,
t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93
BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_left,
BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_right,
BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_return_output);

-- n16_MUX_uxn_opcodes_h_l1442_c7_257e
n16_MUX_uxn_opcodes_h_l1442_c7_257e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1442_c7_257e_cond,
n16_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue,
n16_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse,
n16_MUX_uxn_opcodes_h_l1442_c7_257e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e
result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e
result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e
result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e
result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e
result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_return_output);

-- t16_MUX_uxn_opcodes_h_l1442_c7_257e
t16_MUX_uxn_opcodes_h_l1442_c7_257e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1442_c7_257e_cond,
t16_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue,
t16_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse,
t16_MUX_uxn_opcodes_h_l1442_c7_257e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_left,
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_right,
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_return_output);

-- n16_MUX_uxn_opcodes_h_l1447_c7_b40b
n16_MUX_uxn_opcodes_h_l1447_c7_b40b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1447_c7_b40b_cond,
n16_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue,
n16_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse,
n16_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b
result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b
result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output);

-- t16_MUX_uxn_opcodes_h_l1447_c7_b40b
t16_MUX_uxn_opcodes_h_l1447_c7_b40b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1447_c7_b40b_cond,
t16_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue,
t16_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse,
t16_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_left,
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_right,
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_return_output);

-- n16_MUX_uxn_opcodes_h_l1450_c7_8647
n16_MUX_uxn_opcodes_h_l1450_c7_8647 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1450_c7_8647_cond,
n16_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue,
n16_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse,
n16_MUX_uxn_opcodes_h_l1450_c7_8647_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647
result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_cond,
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_return_output);

-- t16_MUX_uxn_opcodes_h_l1450_c7_8647
t16_MUX_uxn_opcodes_h_l1450_c7_8647 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1450_c7_8647_cond,
t16_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue,
t16_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse,
t16_MUX_uxn_opcodes_h_l1450_c7_8647_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77
BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77_left,
BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77_right,
BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_left,
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_right,
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_return_output);

-- n16_MUX_uxn_opcodes_h_l1454_c7_0c85
n16_MUX_uxn_opcodes_h_l1454_c7_0c85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1454_c7_0c85_cond,
n16_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue,
n16_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse,
n16_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_cond,
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8
BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_left,
BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_right,
BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_return_output);

-- n16_MUX_uxn_opcodes_h_l1457_c7_a11c
n16_MUX_uxn_opcodes_h_l1457_c7_a11c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1457_c7_a11c_cond,
n16_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue,
n16_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse,
n16_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c
result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c
result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c
result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c
result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c
result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d
BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_left,
BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_right,
BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_return_output);

-- n16_MUX_uxn_opcodes_h_l1462_c7_1c38
n16_MUX_uxn_opcodes_h_l1462_c7_1c38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1462_c7_1c38_cond,
n16_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue,
n16_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse,
n16_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38
result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38
result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38
result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38
result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38
result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38
result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_cond,
result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf
BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_left,
BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_right,
BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_return_output);

-- n16_MUX_uxn_opcodes_h_l1465_c7_4cd4
n16_MUX_uxn_opcodes_h_l1465_c7_4cd4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond,
n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue,
n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse,
n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4
result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4
result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4
result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4
result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4
result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b
BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b_left,
BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b_right,
BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8
BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8_left,
BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8_right,
BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806
BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806_left,
BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806_right,
BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806_return_output);

-- MUX_uxn_opcodes_h_l1469_c32_9a15
MUX_uxn_opcodes_h_l1469_c32_9a15 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1469_c32_9a15_cond,
MUX_uxn_opcodes_h_l1469_c32_9a15_iftrue,
MUX_uxn_opcodes_h_l1469_c32_9a15_iffalse,
MUX_uxn_opcodes_h_l1469_c32_9a15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd
BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_left,
BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_right,
BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911
result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911
result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_cond,
result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c
BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c_left,
BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c_right,
BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c_return_output);

-- MUX_uxn_opcodes_h_l1475_c24_4864
MUX_uxn_opcodes_h_l1475_c24_4864 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1475_c24_4864_cond,
MUX_uxn_opcodes_h_l1475_c24_4864_iftrue,
MUX_uxn_opcodes_h_l1475_c24_4864_iffalse,
MUX_uxn_opcodes_h_l1475_c24_4864_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9_left,
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9_right,
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1459_l1444_DUPLICATE_bdfc
CONST_SL_8_uint16_t_uxn_opcodes_h_l1459_l1444_DUPLICATE_bdfc : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1459_l1444_DUPLICATE_bdfc_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1459_l1444_DUPLICATE_bdfc_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_return_output,
 n16_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output,
 t16_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_return_output,
 n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output,
 t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_return_output,
 n16_MUX_uxn_opcodes_h_l1442_c7_257e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_return_output,
 t16_MUX_uxn_opcodes_h_l1442_c7_257e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_return_output,
 n16_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output,
 t16_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_return_output,
 n16_MUX_uxn_opcodes_h_l1450_c7_8647_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_return_output,
 t16_MUX_uxn_opcodes_h_l1450_c7_8647_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_return_output,
 n16_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_return_output,
 n16_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_return_output,
 n16_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_return_output,
 n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806_return_output,
 MUX_uxn_opcodes_h_l1469_c32_9a15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c_return_output,
 MUX_uxn_opcodes_h_l1475_c24_4864_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1459_l1444_DUPLICATE_bdfc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1433_c2_be9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1436_c3_b6a9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1433_c2_be9a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1434_c3_427f_uxn_opcodes_h_l1434_c3_427f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1442_c7_257e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1440_c3_6d4c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1442_c7_257e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1442_c7_257e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1445_c3_7d54 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1442_c7_257e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8647_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1447_c7_b40b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_91f7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1450_c7_8647_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1447_c7_b40b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8647_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1452_c3_cce5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1450_c7_8647_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1454_c7_0c85_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1455_c3_ac1a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1457_c7_a11c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1460_c3_fe0d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1462_c7_1c38_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1463_c3_cc1e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1469_c32_9a15_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1469_c32_9a15_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1469_c32_9a15_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1469_c32_9a15_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1474_c3_926b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1475_c24_4864_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1475_c24_4864_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1475_c24_4864_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1475_c24_4864_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1439_l1462_DUPLICATE_8cdd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_86f7_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1477_l1447_l1442_l1465_l1439_l1462_DUPLICATE_30c2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_ea83_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_7d29_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1477_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_874f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1443_l1466_l1458_l1451_DUPLICATE_7d5d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1459_l1444_DUPLICATE_bdfc_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1459_l1444_DUPLICATE_bdfc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1465_l1471_DUPLICATE_9d5a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1482_l1429_DUPLICATE_3a17_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l1475_c24_4864_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1445_c3_7d54 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1445_c3_7d54;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1436_c3_b6a9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1436_c3_b6a9;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1455_c3_ac1a := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1455_c3_ac1a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1452_c3_cce5 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1452_c3_cce5;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_91f7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_91f7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1440_c3_6d4c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1440_c3_6d4c;
     VAR_MUX_uxn_opcodes_h_l1469_c32_9a15_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1463_c3_cc1e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1463_c3_cc1e;
     VAR_MUX_uxn_opcodes_h_l1469_c32_9a15_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1460_c3_fe0d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1460_c3_fe0d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1474_c3_926b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1474_c3_926b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9_right := to_unsigned(10, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_right := to_unsigned(8, 4);
     VAR_MUX_uxn_opcodes_h_l1475_c24_4864_iffalse := resize(to_unsigned(1, 1), 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1471_c11_82fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1475_c24_7d5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1477_l1447_l1442_l1465_l1439_l1462_DUPLICATE_30c2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1477_l1447_l1442_l1465_l1439_l1462_DUPLICATE_30c2_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1439_l1462_DUPLICATE_8cdd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1439_l1462_DUPLICATE_8cdd_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_86f7 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_86f7_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1442_c11_4e93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_left;
     BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_return_output := BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1465_l1471_DUPLICATE_9d5a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1465_l1471_DUPLICATE_9d5a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1450_c11_e149] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_left;
     BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_return_output := BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1477_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_874f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1477_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_874f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1477_c11_73d9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1447_c11_90b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1443_l1466_l1458_l1451_DUPLICATE_7d5d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1443_l1466_l1458_l1451_DUPLICATE_7d5d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_7d29 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_7d29_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l1469_c32_1fa8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8_left;
     BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8_return_output := BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1465_c11_efcf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1439_c11_1952] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_left;
     BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_return_output := BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1457_c11_30e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_ea83 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_ea83_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1462_c11_f54d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1433_c6_5ff2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1454_c11_5d72] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_left;
     BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_return_output := BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1469_c32_1fa8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1433_c2_be9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1433_c2_be9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c6_5ff2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1439_c11_1952_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1442_c7_257e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1442_c7_257e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_4e93_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1447_c7_b40b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1447_c7_b40b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_90b6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1450_c7_8647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_e149_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1454_c7_0c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_5d72_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1457_c7_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_30e8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1462_c7_1c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1462_c11_f54d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1465_c11_efcf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_82fd_return_output;
     VAR_MUX_uxn_opcodes_h_l1475_c24_4864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1475_c24_7d5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_73d9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1443_l1466_l1458_l1451_DUPLICATE_7d5d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1443_l1466_l1458_l1451_DUPLICATE_7d5d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1459_l1444_DUPLICATE_bdfc_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1443_l1466_l1458_l1451_DUPLICATE_7d5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_86f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_86f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_86f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_86f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_86f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_86f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_86f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_86f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_86f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1477_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_874f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1477_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_874f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1477_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_874f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1477_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_874f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1477_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_874f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1477_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_874f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1477_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_874f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1477_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_874f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1477_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_874f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1477_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_874f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1439_l1462_DUPLICATE_8cdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1439_l1462_DUPLICATE_8cdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1439_l1462_DUPLICATE_8cdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1439_l1462_DUPLICATE_8cdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1439_l1462_DUPLICATE_8cdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1439_l1462_DUPLICATE_8cdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1439_l1462_DUPLICATE_8cdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1439_l1462_DUPLICATE_8cdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1439_l1462_DUPLICATE_8cdd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_7d29_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_7d29_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_7d29_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_7d29_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_7d29_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_7d29_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_7d29_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1457_l1454_l1450_l1447_l1442_l1465_l1439_l1462_DUPLICATE_7d29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1477_l1447_l1442_l1465_l1439_l1462_DUPLICATE_30c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1477_l1447_l1442_l1465_l1439_l1462_DUPLICATE_30c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1477_l1447_l1442_l1465_l1439_l1462_DUPLICATE_30c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1477_l1447_l1442_l1465_l1439_l1462_DUPLICATE_30c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1477_l1447_l1442_l1465_l1439_l1462_DUPLICATE_30c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1477_l1447_l1442_l1465_l1439_l1462_DUPLICATE_30c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1477_l1447_l1442_l1465_l1439_l1462_DUPLICATE_30c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1477_l1447_l1442_l1465_l1439_l1462_DUPLICATE_30c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1477_l1447_l1442_l1465_l1439_l1462_DUPLICATE_30c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1477_l1447_l1442_l1465_l1439_l1462_DUPLICATE_30c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1465_l1471_DUPLICATE_9d5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1465_l1471_DUPLICATE_9d5a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_ea83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_ea83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_ea83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_ea83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_ea83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_ea83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_ea83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_ea83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_ea83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1433_l1457_l1454_l1450_l1447_l1471_l1442_l1465_l1439_l1462_DUPLICATE_ea83_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1459_l1444_DUPLICATE_bdfc LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1459_l1444_DUPLICATE_bdfc_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1459_l1444_DUPLICATE_bdfc_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1459_l1444_DUPLICATE_bdfc_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1459_l1444_DUPLICATE_bdfc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1433_c1_a9c3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_return_output;

     -- MUX[uxn_opcodes_h_l1475_c24_4864] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1475_c24_4864_cond <= VAR_MUX_uxn_opcodes_h_l1475_c24_4864_cond;
     MUX_uxn_opcodes_h_l1475_c24_4864_iftrue <= VAR_MUX_uxn_opcodes_h_l1475_c24_4864_iftrue;
     MUX_uxn_opcodes_h_l1475_c24_4864_iffalse <= VAR_MUX_uxn_opcodes_h_l1475_c24_4864_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1475_c24_4864_return_output := MUX_uxn_opcodes_h_l1475_c24_4864_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c7_35ca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1465_c7_4cd4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c7_35ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1466_c3_349b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b_left;
     BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b_return_output := BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1451_c3_fc77] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77_left;
     BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77_return_output := BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1469_c32_0806] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806_left;
     BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806_return_output := BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1471_c7_1911] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1471_c7_1911] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1469_c32_9a15_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1469_c32_0806_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1451_c3_fc77_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1466_c3_349b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1459_l1444_DUPLICATE_bdfc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1459_l1444_DUPLICATE_bdfc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue := VAR_MUX_uxn_opcodes_h_l1475_c24_4864_return_output;
     VAR_printf_uxn_opcodes_h_l1434_c3_427f_uxn_opcodes_h_l1434_c3_427f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1433_c1_a9c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_35ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1471_c7_1911_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_35ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_1911_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1471_c7_1911] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1465_c7_4cd4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1462_c7_1c38] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1465_c7_4cd4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output;

     -- printf_uxn_opcodes_h_l1434_c3_427f[uxn_opcodes_h_l1434_c3_427f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1434_c3_427f_uxn_opcodes_h_l1434_c3_427f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1434_c3_427f_uxn_opcodes_h_l1434_c3_427f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1471_c7_1911] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1471_c7_1911] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_return_output := result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_return_output;

     -- MUX[uxn_opcodes_h_l1469_c32_9a15] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1469_c32_9a15_cond <= VAR_MUX_uxn_opcodes_h_l1469_c32_9a15_cond;
     MUX_uxn_opcodes_h_l1469_c32_9a15_iftrue <= VAR_MUX_uxn_opcodes_h_l1469_c32_9a15_iftrue;
     MUX_uxn_opcodes_h_l1469_c32_9a15_iffalse <= VAR_MUX_uxn_opcodes_h_l1469_c32_9a15_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1469_c32_9a15_return_output := MUX_uxn_opcodes_h_l1469_c32_9a15_return_output;

     -- n16_MUX[uxn_opcodes_h_l1465_c7_4cd4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond;
     n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue;
     n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output := n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1450_c7_8647] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1450_c7_8647_cond <= VAR_t16_MUX_uxn_opcodes_h_l1450_c7_8647_cond;
     t16_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue;
     t16_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1450_c7_8647_return_output := t16_MUX_uxn_opcodes_h_l1450_c7_8647_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue := VAR_MUX_uxn_opcodes_h_l1469_c32_9a15_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_1911_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_1911_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1471_c7_1911_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1450_c7_8647_return_output;
     -- n16_MUX[uxn_opcodes_h_l1462_c7_1c38] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1462_c7_1c38_cond <= VAR_n16_MUX_uxn_opcodes_h_l1462_c7_1c38_cond;
     n16_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue;
     n16_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output := n16_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1462_c7_1c38] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1462_c7_1c38] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1465_c7_4cd4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1465_c7_4cd4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1465_c7_4cd4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1447_c7_b40b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1447_c7_b40b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1447_c7_b40b_cond;
     t16_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue;
     t16_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output := t16_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1457_c7_a11c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1465_c7_4cd4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1465_c7_4cd4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1457_c7_a11c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1442_c7_257e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1442_c7_257e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1442_c7_257e_cond;
     t16_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue;
     t16_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1442_c7_257e_return_output := t16_MUX_uxn_opcodes_h_l1442_c7_257e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1457_c7_a11c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1454_c7_0c85] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1462_c7_1c38] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1462_c7_1c38] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output;

     -- n16_MUX[uxn_opcodes_h_l1457_c7_a11c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1457_c7_a11c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1457_c7_a11c_cond;
     n16_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue;
     n16_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output := n16_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1462_c7_1c38] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output := result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1462_c7_1c38] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1462_c7_1c38_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1442_c7_257e_return_output;
     -- t16_MUX[uxn_opcodes_h_l1439_c7_0ef7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond;
     t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue;
     t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output := t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1457_c7_a11c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1454_c7_0c85] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1454_c7_0c85] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1457_c7_a11c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1457_c7_a11c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1454_c7_0c85] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1454_c7_0c85_cond <= VAR_n16_MUX_uxn_opcodes_h_l1454_c7_0c85_cond;
     n16_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue;
     n16_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output := n16_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1450_c7_8647] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1457_c7_a11c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1450_c7_8647_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1457_c7_a11c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1454_c7_0c85] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1454_c7_0c85] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1454_c7_0c85] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output := result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1447_c7_b40b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1450_c7_8647] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_return_output;

     -- t16_MUX[uxn_opcodes_h_l1433_c2_be9a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1433_c2_be9a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1433_c2_be9a_cond;
     t16_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue;
     t16_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output := t16_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1450_c7_8647] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_return_output;

     -- n16_MUX[uxn_opcodes_h_l1450_c7_8647] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1450_c7_8647_cond <= VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8647_cond;
     n16_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue;
     n16_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8647_return_output := n16_MUX_uxn_opcodes_h_l1450_c7_8647_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1454_c7_0c85] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1450_c7_8647_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1450_c7_8647_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_8647_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1454_c7_0c85_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1450_c7_8647] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_return_output := result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1447_c7_b40b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1442_c7_257e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1450_c7_8647] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_return_output;

     -- n16_MUX[uxn_opcodes_h_l1447_c7_b40b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1447_c7_b40b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1447_c7_b40b_cond;
     n16_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue;
     n16_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output := n16_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1447_c7_b40b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1450_c7_8647] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1450_c7_8647] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_8647_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1442_c7_257e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_8647_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1450_c7_8647_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_8647_return_output;
     -- n16_MUX[uxn_opcodes_h_l1442_c7_257e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1442_c7_257e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1442_c7_257e_cond;
     n16_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue;
     n16_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1442_c7_257e_return_output := n16_MUX_uxn_opcodes_h_l1442_c7_257e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1447_c7_b40b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1439_c7_0ef7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1442_c7_257e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1447_c7_b40b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1447_c7_b40b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1442_c7_257e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1447_c7_b40b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1442_c7_257e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1442_c7_257e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_257e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_b40b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1439_c7_0ef7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1433_c2_be9a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1439_c7_0ef7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1442_c7_257e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1442_c7_257e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1442_c7_257e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1439_c7_0ef7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond;
     n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue;
     n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output := n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1442_c7_257e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_257e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_257e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_257e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_257e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1439_c7_0ef7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1439_c7_0ef7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1439_c7_0ef7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1433_c2_be9a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1433_c2_be9a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1433_c2_be9a_cond;
     n16_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue;
     n16_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output := n16_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1433_c2_be9a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1439_c7_0ef7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1433_c2_be9a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1439_c7_0ef7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1433_c2_be9a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1433_c2_be9a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1433_c2_be9a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1433_c2_be9a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1482_l1429_DUPLICATE_3a17 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1482_l1429_DUPLICATE_3a17_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1433_c2_be9a_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1482_l1429_DUPLICATE_3a17_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1482_l1429_DUPLICATE_3a17_return_output;
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
