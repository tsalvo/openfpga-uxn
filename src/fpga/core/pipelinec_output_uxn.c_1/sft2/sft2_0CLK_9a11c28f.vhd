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
-- Submodules: 95
entity sft2_0CLK_9a11c28f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_9a11c28f;
architecture arch of sft2_0CLK_9a11c28f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2448_c6_b5c9]
signal BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2448_c2_3369]
signal tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2448_c2_3369]
signal t8_MUX_uxn_opcodes_h_l2448_c2_3369_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2448_c2_3369_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2448_c2_3369]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2448_c2_3369]
signal result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2448_c2_3369]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2448_c2_3369]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2448_c2_3369]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2448_c2_3369]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2448_c2_3369]
signal n16_MUX_uxn_opcodes_h_l2448_c2_3369_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2448_c2_3369_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2453_c11_ebdb]
signal BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2453_c7_83d6]
signal tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2453_c7_83d6]
signal t8_MUX_uxn_opcodes_h_l2453_c7_83d6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2453_c7_83d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2453_c7_83d6]
signal result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2453_c7_83d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2453_c7_83d6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2453_c7_83d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2453_c7_83d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2453_c7_83d6]
signal n16_MUX_uxn_opcodes_h_l2453_c7_83d6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2456_c11_0b23]
signal BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2456_c7_26c7]
signal tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l2456_c7_26c7]
signal t8_MUX_uxn_opcodes_h_l2456_c7_26c7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2456_c7_26c7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2456_c7_26c7]
signal result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2456_c7_26c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2456_c7_26c7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2456_c7_26c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2456_c7_26c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2456_c7_26c7]
signal n16_MUX_uxn_opcodes_h_l2456_c7_26c7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2460_c11_f57e]
signal BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2460_c7_4c60]
signal tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2460_c7_4c60]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2460_c7_4c60]
signal result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2460_c7_4c60]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2460_c7_4c60]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2460_c7_4c60]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2460_c7_4c60]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2460_c7_4c60]
signal n16_MUX_uxn_opcodes_h_l2460_c7_4c60_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2463_c11_0061]
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2463_c7_789b]
signal tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2463_c7_789b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2463_c7_789b]
signal result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2463_c7_789b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2463_c7_789b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2463_c7_789b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2463_c7_789b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2463_c7_789b]
signal n16_MUX_uxn_opcodes_h_l2463_c7_789b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2463_c7_789b_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2465_c3_5972]
signal CONST_SL_8_uxn_opcodes_h_l2465_c3_5972_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2465_c3_5972_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2468_c11_71fa]
signal BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2468_c7_6256]
signal tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2468_c7_6256]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2468_c7_6256]
signal result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2468_c7_6256]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2468_c7_6256]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2468_c7_6256]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2468_c7_6256]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2468_c7_6256]
signal n16_MUX_uxn_opcodes_h_l2468_c7_6256_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2468_c7_6256_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2471_c11_26d5]
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2471_c7_e914]
signal tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2471_c7_e914]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2471_c7_e914]
signal result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2471_c7_e914]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2471_c7_e914]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2471_c7_e914]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2471_c7_e914]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2471_c7_e914]
signal n16_MUX_uxn_opcodes_h_l2471_c7_e914_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2471_c7_e914_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2472_c3_f9ba]
signal BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2474_c32_1e92]
signal BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2474_c32_b822]
signal BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2474_c32_2ea9]
signal MUX_uxn_opcodes_h_l2474_c32_2ea9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2474_c32_2ea9_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2474_c32_2ea9_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2474_c32_2ea9_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2476_c11_4d7d]
signal BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2476_c7_6d42]
signal tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2476_c7_6d42]
signal result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2476_c7_6d42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2476_c7_6d42]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2476_c7_6d42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2476_c7_6d42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2477_c20_e391]
signal BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2477_c12_bd67]
signal BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2477_c36_e6c8]
signal CONST_SR_4_uxn_opcodes_h_l2477_c36_e6c8_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2477_c36_e6c8_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2477_c12_53bb]
signal BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2483_c11_89f3]
signal BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2483_c7_7bb5]
signal result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2483_c7_7bb5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2483_c7_7bb5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2483_c7_7bb5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2485_c34_1147]
signal CONST_SR_8_uxn_opcodes_h_l2485_c34_1147_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2485_c34_1147_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2487_c11_a094]
signal BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2487_c7_2cb5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2487_c7_2cb5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9
BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_left,
BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_right,
BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2448_c2_3369
tmp16_MUX_uxn_opcodes_h_l2448_c2_3369 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_cond,
tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue,
tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse,
tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_return_output);

-- t8_MUX_uxn_opcodes_h_l2448_c2_3369
t8_MUX_uxn_opcodes_h_l2448_c2_3369 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2448_c2_3369_cond,
t8_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue,
t8_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse,
t8_MUX_uxn_opcodes_h_l2448_c2_3369_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369
result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369
result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_cond,
result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369
result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369
result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369
result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_return_output);

-- n16_MUX_uxn_opcodes_h_l2448_c2_3369
n16_MUX_uxn_opcodes_h_l2448_c2_3369 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2448_c2_3369_cond,
n16_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue,
n16_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse,
n16_MUX_uxn_opcodes_h_l2448_c2_3369_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb
BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_left,
BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_right,
BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6
tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_cond,
tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output);

-- t8_MUX_uxn_opcodes_h_l2453_c7_83d6
t8_MUX_uxn_opcodes_h_l2453_c7_83d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2453_c7_83d6_cond,
t8_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue,
t8_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse,
t8_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6
result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6
result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output);

-- n16_MUX_uxn_opcodes_h_l2453_c7_83d6
n16_MUX_uxn_opcodes_h_l2453_c7_83d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2453_c7_83d6_cond,
n16_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue,
n16_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse,
n16_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23
BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_left,
BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_right,
BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7
tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_cond,
tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output);

-- t8_MUX_uxn_opcodes_h_l2456_c7_26c7
t8_MUX_uxn_opcodes_h_l2456_c7_26c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2456_c7_26c7_cond,
t8_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue,
t8_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse,
t8_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7
result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7
result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output);

-- n16_MUX_uxn_opcodes_h_l2456_c7_26c7
n16_MUX_uxn_opcodes_h_l2456_c7_26c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2456_c7_26c7_cond,
n16_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue,
n16_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse,
n16_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e
BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_left,
BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_right,
BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60
tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_cond,
tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue,
tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse,
tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60
result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_cond,
result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60
result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output);

-- n16_MUX_uxn_opcodes_h_l2460_c7_4c60
n16_MUX_uxn_opcodes_h_l2460_c7_4c60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2460_c7_4c60_cond,
n16_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue,
n16_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse,
n16_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_left,
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_right,
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2463_c7_789b
tmp16_MUX_uxn_opcodes_h_l2463_c7_789b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_cond,
tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b
result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_return_output);

-- n16_MUX_uxn_opcodes_h_l2463_c7_789b
n16_MUX_uxn_opcodes_h_l2463_c7_789b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2463_c7_789b_cond,
n16_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue,
n16_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse,
n16_MUX_uxn_opcodes_h_l2463_c7_789b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2465_c3_5972
CONST_SL_8_uxn_opcodes_h_l2465_c3_5972 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2465_c3_5972_x,
CONST_SL_8_uxn_opcodes_h_l2465_c3_5972_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_left,
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_right,
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2468_c7_6256
tmp16_MUX_uxn_opcodes_h_l2468_c7_6256 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_cond,
tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue,
tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse,
tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256
result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256
result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_cond,
result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256
result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_return_output);

-- n16_MUX_uxn_opcodes_h_l2468_c7_6256
n16_MUX_uxn_opcodes_h_l2468_c7_6256 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2468_c7_6256_cond,
n16_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue,
n16_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse,
n16_MUX_uxn_opcodes_h_l2468_c7_6256_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_left,
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_right,
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2471_c7_e914
tmp16_MUX_uxn_opcodes_h_l2471_c7_e914 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_cond,
tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue,
tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse,
tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914
result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_cond,
result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_return_output);

-- n16_MUX_uxn_opcodes_h_l2471_c7_e914
n16_MUX_uxn_opcodes_h_l2471_c7_e914 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2471_c7_e914_cond,
n16_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue,
n16_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse,
n16_MUX_uxn_opcodes_h_l2471_c7_e914_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba
BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba_left,
BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba_right,
BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92
BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92_left,
BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92_right,
BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822
BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822_left,
BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822_right,
BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822_return_output);

-- MUX_uxn_opcodes_h_l2474_c32_2ea9
MUX_uxn_opcodes_h_l2474_c32_2ea9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2474_c32_2ea9_cond,
MUX_uxn_opcodes_h_l2474_c32_2ea9_iftrue,
MUX_uxn_opcodes_h_l2474_c32_2ea9_iffalse,
MUX_uxn_opcodes_h_l2474_c32_2ea9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d
BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_left,
BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_right,
BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42
tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_cond,
tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue,
tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse,
tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42
result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_cond,
result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42
result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42
result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42
result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391
BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391_left,
BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391_right,
BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67
BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67_left,
BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67_right,
BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2477_c36_e6c8
CONST_SR_4_uxn_opcodes_h_l2477_c36_e6c8 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2477_c36_e6c8_x,
CONST_SR_4_uxn_opcodes_h_l2477_c36_e6c8_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb
BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb_left,
BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb_right,
BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3
BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_left,
BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_right,
BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5
result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond,
result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5
result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5
result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2485_c34_1147
CONST_SR_8_uxn_opcodes_h_l2485_c34_1147 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2485_c34_1147_x,
CONST_SR_8_uxn_opcodes_h_l2485_c34_1147_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094
BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094_left,
BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094_right,
BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5
result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5
result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_return_output,
 t8_MUX_uxn_opcodes_h_l2448_c2_3369_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_return_output,
 n16_MUX_uxn_opcodes_h_l2448_c2_3369_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_return_output,
 tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output,
 t8_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output,
 n16_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_return_output,
 tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output,
 t8_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output,
 n16_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output,
 n16_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_return_output,
 tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_return_output,
 n16_MUX_uxn_opcodes_h_l2463_c7_789b_return_output,
 CONST_SL_8_uxn_opcodes_h_l2465_c3_5972_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_return_output,
 tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_return_output,
 n16_MUX_uxn_opcodes_h_l2468_c7_6256_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_return_output,
 n16_MUX_uxn_opcodes_h_l2471_c7_e914_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822_return_output,
 MUX_uxn_opcodes_h_l2474_c32_2ea9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67_return_output,
 CONST_SR_4_uxn_opcodes_h_l2477_c36_e6c8_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output,
 CONST_SR_8_uxn_opcodes_h_l2485_c34_1147_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2448_c2_3369_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2448_c2_3369_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2450_c3_9b98 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2448_c2_3369_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2448_c2_3369_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2453_c7_83d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2454_c3_a347 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2453_c7_83d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2456_c7_26c7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2458_c3_2072 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2456_c7_26c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_7126 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_789b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2460_c7_4c60_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2466_c3_6136 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2468_c7_6256_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_789b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2465_c3_5972_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2465_c3_5972_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2469_c3_0d45 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2471_c7_e914_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2468_c7_6256_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2471_c7_e914_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2474_c32_2ea9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2474_c32_2ea9_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2474_c32_2ea9_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2474_c32_2ea9_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2480_c3_8180 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2477_c36_e6c8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2477_c36_e6c8_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2481_c24_d2d9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2484_c3_a9b4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2485_c34_1147_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2485_c34_1147_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2485_c24_4e53_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2453_l2448_DUPLICATE_b53f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2483_l2453_l2448_DUPLICATE_e05c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2468_l2463_l2460_l2456_l2453_l2476_l2448_DUPLICATE_2e1f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2448_DUPLICATE_a807_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2476_DUPLICATE_b1db_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2472_l2464_DUPLICATE_6064_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2471_l2483_DUPLICATE_f751_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2492_l2443_DUPLICATE_e57b_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2474_c32_2ea9_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2454_c3_a347 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2454_c3_a347;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2474_c32_2ea9_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2469_c3_0d45 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2469_c3_0d45;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_7126 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_7126;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2450_c3_9b98 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2450_c3_9b98;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2484_c3_a9b4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2484_c3_a9b4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2466_c3_6136 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2466_c3_6136;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2480_c3_8180 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2480_c3_8180;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2458_c3_2072 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2458_c3_2072;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094_right := to_unsigned(9, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba_left := n16;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2477_c36_e6c8_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2485_c34_1147_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse := tmp16;
     -- CONST_SR_4[uxn_opcodes_h_l2477_c36_e6c8] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2477_c36_e6c8_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2477_c36_e6c8_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2477_c36_e6c8_return_output := CONST_SR_4_uxn_opcodes_h_l2477_c36_e6c8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2468_l2463_l2460_l2456_l2453_l2476_l2448_DUPLICATE_2e1f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2468_l2463_l2460_l2456_l2453_l2476_l2448_DUPLICATE_2e1f_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2471_l2483_DUPLICATE_f751 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2471_l2483_DUPLICATE_f751_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2472_l2464_DUPLICATE_6064 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2472_l2464_DUPLICATE_6064_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2460_c11_f57e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2471_c11_26d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2448_c6_b5c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2483_l2453_l2448_DUPLICATE_e05c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2483_l2453_l2448_DUPLICATE_e05c_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l2474_c32_1e92] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92_left;
     BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92_return_output := BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2448_DUPLICATE_a807 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2448_DUPLICATE_a807_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l2485_c34_1147] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2485_c34_1147_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2485_c34_1147_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2485_c34_1147_return_output := CONST_SR_8_uxn_opcodes_h_l2485_c34_1147_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2483_c11_89f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2477_c20_e391] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391_left;
     BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391_return_output := BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2463_c11_0061] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_left;
     BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_return_output := BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2476_c11_4d7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2453_c11_ebdb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2476_DUPLICATE_b1db LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2476_DUPLICATE_b1db_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2468_c11_71fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2456_c11_0b23] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_left;
     BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_return_output := BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2453_l2448_DUPLICATE_b53f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2453_l2448_DUPLICATE_b53f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2487_c11_a094] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094_left;
     BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094_return_output := BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2474_c32_1e92_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2477_c20_e391_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2448_c2_3369_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2448_c2_3369_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c6_b5c9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2453_c7_83d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2453_c7_83d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_ebdb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2456_c7_26c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2456_c7_26c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_0b23_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2460_c7_4c60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_f57e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_789b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0061_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2468_c7_6256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_71fa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2471_c7_e914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_26d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_4d7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2483_c11_89f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_a094_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2472_l2464_DUPLICATE_6064_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2465_c3_5972_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2472_l2464_DUPLICATE_6064_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2453_l2448_DUPLICATE_b53f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2453_l2448_DUPLICATE_b53f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2453_l2448_DUPLICATE_b53f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2453_l2448_DUPLICATE_b53f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2453_l2448_DUPLICATE_b53f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2453_l2448_DUPLICATE_b53f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2453_l2448_DUPLICATE_b53f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2476_DUPLICATE_b1db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2476_DUPLICATE_b1db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2476_DUPLICATE_b1db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2476_DUPLICATE_b1db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2476_DUPLICATE_b1db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2476_DUPLICATE_b1db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2476_DUPLICATE_b1db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2476_DUPLICATE_b1db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2476_DUPLICATE_b1db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2468_l2463_l2460_l2456_l2453_l2476_l2448_DUPLICATE_2e1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2468_l2463_l2460_l2456_l2453_l2476_l2448_DUPLICATE_2e1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2468_l2463_l2460_l2456_l2453_l2476_l2448_DUPLICATE_2e1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2468_l2463_l2460_l2456_l2453_l2476_l2448_DUPLICATE_2e1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2468_l2463_l2460_l2456_l2453_l2476_l2448_DUPLICATE_2e1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2468_l2463_l2460_l2456_l2453_l2476_l2448_DUPLICATE_2e1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2468_l2463_l2460_l2456_l2453_l2476_l2448_DUPLICATE_2e1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2448_DUPLICATE_a807_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2448_DUPLICATE_a807_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2448_DUPLICATE_a807_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2448_DUPLICATE_a807_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2448_DUPLICATE_a807_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2448_DUPLICATE_a807_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2448_DUPLICATE_a807_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2448_DUPLICATE_a807_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2487_l2456_l2483_l2453_l2448_DUPLICATE_a807_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2471_l2483_DUPLICATE_f751_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2471_l2483_DUPLICATE_f751_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2483_l2453_l2448_DUPLICATE_e05c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2483_l2453_l2448_DUPLICATE_e05c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2483_l2453_l2448_DUPLICATE_e05c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2483_l2453_l2448_DUPLICATE_e05c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2483_l2453_l2448_DUPLICATE_e05c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2483_l2453_l2448_DUPLICATE_e05c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2483_l2453_l2448_DUPLICATE_e05c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2471_l2468_l2463_l2460_l2456_l2483_l2453_l2448_DUPLICATE_e05c_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb_right := VAR_CONST_SR_4_uxn_opcodes_h_l2477_c36_e6c8_return_output;
     -- t8_MUX[uxn_opcodes_h_l2456_c7_26c7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2456_c7_26c7_cond <= VAR_t8_MUX_uxn_opcodes_h_l2456_c7_26c7_cond;
     t8_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue;
     t8_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output := t8_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2477_c12_bd67] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67_left;
     BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67_return_output := BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2483_c7_7bb5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2472_c3_f9ba] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba_left;
     BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba_return_output := BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2485_c24_4e53] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2485_c24_4e53_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2485_c34_1147_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2476_c7_6d42] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2465_c3_5972] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2465_c3_5972_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2465_c3_5972_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2465_c3_5972_return_output := CONST_SL_8_uxn_opcodes_h_l2465_c3_5972_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2487_c7_2cb5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2474_c32_b822] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822_left;
     BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822_return_output := BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2487_c7_2cb5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2474_c32_2ea9_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2474_c32_b822_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_f9ba_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2477_c12_bd67_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2485_c24_4e53_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2465_c3_5972_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_2cb5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_2cb5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2483_c7_7bb5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2477_c12_53bb] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb_left;
     BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb_return_output := BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2483_c7_7bb5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output := result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2471_c7_e914] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2476_c7_6d42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output;

     -- t8_MUX[uxn_opcodes_h_l2453_c7_83d6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2453_c7_83d6_cond <= VAR_t8_MUX_uxn_opcodes_h_l2453_c7_83d6_cond;
     t8_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue;
     t8_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output := t8_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2483_c7_7bb5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output;

     -- n16_MUX[uxn_opcodes_h_l2471_c7_e914] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2471_c7_e914_cond <= VAR_n16_MUX_uxn_opcodes_h_l2471_c7_e914_cond;
     n16_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue;
     n16_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2471_c7_e914_return_output := n16_MUX_uxn_opcodes_h_l2471_c7_e914_return_output;

     -- MUX[uxn_opcodes_h_l2474_c32_2ea9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2474_c32_2ea9_cond <= VAR_MUX_uxn_opcodes_h_l2474_c32_2ea9_cond;
     MUX_uxn_opcodes_h_l2474_c32_2ea9_iftrue <= VAR_MUX_uxn_opcodes_h_l2474_c32_2ea9_iftrue;
     MUX_uxn_opcodes_h_l2474_c32_2ea9_iffalse <= VAR_MUX_uxn_opcodes_h_l2474_c32_2ea9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2474_c32_2ea9_return_output := MUX_uxn_opcodes_h_l2474_c32_2ea9_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue := VAR_MUX_uxn_opcodes_h_l2474_c32_2ea9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2471_c7_e914_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_e914_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2483_c7_7bb5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2476_c7_6d42] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_cond;
     tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output := tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2476_c7_6d42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output;

     -- n16_MUX[uxn_opcodes_h_l2468_c7_6256] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2468_c7_6256_cond <= VAR_n16_MUX_uxn_opcodes_h_l2468_c7_6256_cond;
     n16_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue;
     n16_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2468_c7_6256_return_output := n16_MUX_uxn_opcodes_h_l2468_c7_6256_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2468_c7_6256] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_return_output;

     -- t8_MUX[uxn_opcodes_h_l2448_c2_3369] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2448_c2_3369_cond <= VAR_t8_MUX_uxn_opcodes_h_l2448_c2_3369_cond;
     t8_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue;
     t8_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2448_c2_3369_return_output := t8_MUX_uxn_opcodes_h_l2448_c2_3369_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2471_c7_e914] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2471_c7_e914] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2481_c24_d2d9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2481_c24_d2d9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2477_c12_53bb_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2476_c7_6d42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output;

     -- Submodule level 4
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2481_c24_d2d9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2468_c7_6256_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_6256_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_e914_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_e914_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2448_c2_3369_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2476_c7_6d42] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output := result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2471_c7_e914] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2471_c7_e914] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_cond;
     tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_return_output := tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2468_c7_6256] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_return_output;

     -- n16_MUX[uxn_opcodes_h_l2463_c7_789b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2463_c7_789b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2463_c7_789b_cond;
     n16_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue;
     n16_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_789b_return_output := n16_MUX_uxn_opcodes_h_l2463_c7_789b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2471_c7_e914] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2463_c7_789b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2468_c7_6256] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2463_c7_789b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_e914_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_789b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_e914_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_6256_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_6256_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2476_c7_6d42_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2471_c7_e914_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2460_c7_4c60] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2463_c7_789b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2471_c7_e914] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_return_output := result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2468_c7_6256] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2463_c7_789b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2468_c7_6256] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_cond;
     tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_return_output := tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_return_output;

     -- n16_MUX[uxn_opcodes_h_l2460_c7_4c60] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2460_c7_4c60_cond <= VAR_n16_MUX_uxn_opcodes_h_l2460_c7_4c60_cond;
     n16_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue;
     n16_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output := n16_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2468_c7_6256] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_6256_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_6256_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_789b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_789b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2471_c7_e914_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2468_c7_6256_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2463_c7_789b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_cond;
     tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_return_output := tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2460_c7_4c60] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2456_c7_26c7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2460_c7_4c60] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2463_c7_789b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2456_c7_26c7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2456_c7_26c7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2456_c7_26c7_cond;
     n16_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue;
     n16_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output := n16_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2468_c7_6256] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_return_output := result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2463_c7_789b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_789b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_789b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_6256_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2463_c7_789b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2463_c7_789b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2460_c7_4c60] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2456_c7_26c7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2456_c7_26c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2453_c7_83d6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2453_c7_83d6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2453_c7_83d6_cond;
     n16_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue;
     n16_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output := n16_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2453_c7_83d6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2460_c7_4c60] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2460_c7_4c60] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_cond;
     tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output := tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2463_c7_789b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2456_c7_26c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2453_c7_83d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2456_c7_26c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2448_c2_3369] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_return_output;

     -- n16_MUX[uxn_opcodes_h_l2448_c2_3369] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2448_c2_3369_cond <= VAR_n16_MUX_uxn_opcodes_h_l2448_c2_3369_cond;
     n16_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue;
     n16_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2448_c2_3369_return_output := n16_MUX_uxn_opcodes_h_l2448_c2_3369_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2453_c7_83d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2460_c7_4c60] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output := result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2456_c7_26c7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_cond;
     tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output := tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2448_c2_3369_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2460_c7_4c60_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2456_c7_26c7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2448_c2_3369] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2448_c2_3369] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2453_c7_83d6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_cond;
     tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output := tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2453_c7_83d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2453_c7_83d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2456_c7_26c7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2448_c2_3369] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_cond;
     tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_return_output := tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2453_c7_83d6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2448_c2_3369] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2448_c2_3369] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_return_output;

     -- Submodule level 11
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2453_c7_83d6_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2448_c2_3369_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2448_c2_3369] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_return_output := result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2492_l2443_DUPLICATE_e57b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2492_l2443_DUPLICATE_e57b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c2_3369_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2448_c2_3369_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c2_3369_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c2_3369_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2448_c2_3369_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c2_3369_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2492_l2443_DUPLICATE_e57b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2492_l2443_DUPLICATE_e57b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
