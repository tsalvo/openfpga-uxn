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
-- Submodules: 128
entity swp2_0CLK_04f7be23 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_04f7be23;
architecture arch of swp2_0CLK_04f7be23 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2496_c6_7d0e]
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2496_c1_0668]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2496_c2_d5d6]
signal n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2496_c2_d5d6]
signal result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c2_d5d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2496_c2_d5d6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2496_c2_d5d6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c2_d5d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c2_d5d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c2_d5d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2496_c2_d5d6]
signal t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2497_c3_6cfa[uxn_opcodes_h_l2497_c3_6cfa]
signal printf_uxn_opcodes_h_l2497_c3_6cfa_uxn_opcodes_h_l2497_c3_6cfa_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2502_c11_0b42]
signal BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2502_c7_43eb]
signal n16_MUX_uxn_opcodes_h_l2502_c7_43eb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2502_c7_43eb]
signal result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2502_c7_43eb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2502_c7_43eb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2502_c7_43eb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2502_c7_43eb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2502_c7_43eb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2502_c7_43eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2502_c7_43eb]
signal t16_MUX_uxn_opcodes_h_l2502_c7_43eb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2505_c11_46a4]
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2505_c7_b484]
signal n16_MUX_uxn_opcodes_h_l2505_c7_b484_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2505_c7_b484_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2505_c7_b484]
signal result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2505_c7_b484]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2505_c7_b484]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2505_c7_b484]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2505_c7_b484]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2505_c7_b484]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2505_c7_b484]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2505_c7_b484]
signal t16_MUX_uxn_opcodes_h_l2505_c7_b484_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2505_c7_b484_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2510_c11_4e9b]
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2510_c7_15d3]
signal n16_MUX_uxn_opcodes_h_l2510_c7_15d3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2510_c7_15d3]
signal result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2510_c7_15d3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2510_c7_15d3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2510_c7_15d3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2510_c7_15d3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2510_c7_15d3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2510_c7_15d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2510_c7_15d3]
signal t16_MUX_uxn_opcodes_h_l2510_c7_15d3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_4fb8]
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2513_c7_7e93]
signal n16_MUX_uxn_opcodes_h_l2513_c7_7e93_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2513_c7_7e93]
signal result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_7e93]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2513_c7_7e93]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2513_c7_7e93]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_7e93]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c7_7e93]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_7e93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2513_c7_7e93]
signal t16_MUX_uxn_opcodes_h_l2513_c7_7e93_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2514_c3_ff53]
signal BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_3961]
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2517_c7_1e3d]
signal n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2517_c7_1e3d]
signal result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_1e3d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2517_c7_1e3d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2517_c7_1e3d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_1e3d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_1e3d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_1e3d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2520_c11_4ffe]
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2520_c7_0666]
signal n16_MUX_uxn_opcodes_h_l2520_c7_0666_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2520_c7_0666_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2520_c7_0666]
signal result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2520_c7_0666]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2520_c7_0666]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2520_c7_0666]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2520_c7_0666]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2520_c7_0666]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2520_c7_0666]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_c66f]
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2525_c7_44c6]
signal n16_MUX_uxn_opcodes_h_l2525_c7_44c6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2525_c7_44c6]
signal result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2525_c7_44c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2525_c7_44c6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2525_c7_44c6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2525_c7_44c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2525_c7_44c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_44c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2528_c11_e0ac]
signal BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2528_c7_aacc]
signal n16_MUX_uxn_opcodes_h_l2528_c7_aacc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2528_c7_aacc]
signal result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2528_c7_aacc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2528_c7_aacc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2528_c7_aacc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2528_c7_aacc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2528_c7_aacc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2528_c7_aacc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2529_c3_628a]
signal BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2532_c32_cd8d]
signal BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2532_c32_db81]
signal BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2532_c32_e800]
signal MUX_uxn_opcodes_h_l2532_c32_e800_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2532_c32_e800_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2532_c32_e800_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2532_c32_e800_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2534_c11_7fab]
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2534_c7_9abc]
signal result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2534_c7_9abc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2534_c7_9abc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2534_c7_9abc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2534_c7_9abc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2540_c11_a89c]
signal BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2540_c7_7883]
signal result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2540_c7_7883]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2540_c7_7883]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2540_c7_7883]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2540_c7_7883]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2542_c34_02d7]
signal CONST_SR_8_uxn_opcodes_h_l2542_c34_02d7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2542_c34_02d7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2544_c11_6031]
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2544_c7_4fca]
signal result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2544_c7_4fca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2544_c7_4fca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2544_c7_4fca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2544_c7_4fca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2549_c11_9baf]
signal BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2549_c7_d34f]
signal result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2549_c7_d34f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2549_c7_d34f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2549_c7_d34f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2551_c34_f7c2]
signal CONST_SR_8_uxn_opcodes_h_l2551_c34_f7c2_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2551_c34_f7c2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2553_c11_6ba0]
signal BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2553_c7_9007]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2553_c7_9007]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2522_l2507_DUPLICATE_cef8
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2522_l2507_DUPLICATE_cef8_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2522_l2507_DUPLICATE_cef8_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_left,
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_right,
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_return_output);

-- n16_MUX_uxn_opcodes_h_l2496_c2_d5d6
n16_MUX_uxn_opcodes_h_l2496_c2_d5d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond,
n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue,
n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse,
n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6
result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6
result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6
result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output);

-- t16_MUX_uxn_opcodes_h_l2496_c2_d5d6
t16_MUX_uxn_opcodes_h_l2496_c2_d5d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond,
t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue,
t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse,
t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output);

-- printf_uxn_opcodes_h_l2497_c3_6cfa_uxn_opcodes_h_l2497_c3_6cfa
printf_uxn_opcodes_h_l2497_c3_6cfa_uxn_opcodes_h_l2497_c3_6cfa : entity work.printf_uxn_opcodes_h_l2497_c3_6cfa_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2497_c3_6cfa_uxn_opcodes_h_l2497_c3_6cfa_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42
BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_left,
BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_right,
BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_return_output);

-- n16_MUX_uxn_opcodes_h_l2502_c7_43eb
n16_MUX_uxn_opcodes_h_l2502_c7_43eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2502_c7_43eb_cond,
n16_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue,
n16_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse,
n16_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb
result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb
result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb
result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb
result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb
result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output);

-- t16_MUX_uxn_opcodes_h_l2502_c7_43eb
t16_MUX_uxn_opcodes_h_l2502_c7_43eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2502_c7_43eb_cond,
t16_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue,
t16_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse,
t16_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4
BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_left,
BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_right,
BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_return_output);

-- n16_MUX_uxn_opcodes_h_l2505_c7_b484
n16_MUX_uxn_opcodes_h_l2505_c7_b484 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2505_c7_b484_cond,
n16_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue,
n16_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse,
n16_MUX_uxn_opcodes_h_l2505_c7_b484_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484
result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_cond,
result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484
result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_return_output);

-- t16_MUX_uxn_opcodes_h_l2505_c7_b484
t16_MUX_uxn_opcodes_h_l2505_c7_b484 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2505_c7_b484_cond,
t16_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue,
t16_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse,
t16_MUX_uxn_opcodes_h_l2505_c7_b484_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_left,
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_right,
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_return_output);

-- n16_MUX_uxn_opcodes_h_l2510_c7_15d3
n16_MUX_uxn_opcodes_h_l2510_c7_15d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2510_c7_15d3_cond,
n16_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue,
n16_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse,
n16_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3
result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3
result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output);

-- t16_MUX_uxn_opcodes_h_l2510_c7_15d3
t16_MUX_uxn_opcodes_h_l2510_c7_15d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2510_c7_15d3_cond,
t16_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue,
t16_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse,
t16_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_left,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_right,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_return_output);

-- n16_MUX_uxn_opcodes_h_l2513_c7_7e93
n16_MUX_uxn_opcodes_h_l2513_c7_7e93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2513_c7_7e93_cond,
n16_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue,
n16_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse,
n16_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93
result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_cond,
result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93
result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output);

-- t16_MUX_uxn_opcodes_h_l2513_c7_7e93
t16_MUX_uxn_opcodes_h_l2513_c7_7e93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2513_c7_7e93_cond,
t16_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue,
t16_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse,
t16_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53
BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53_left,
BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53_right,
BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_left,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_right,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_return_output);

-- n16_MUX_uxn_opcodes_h_l2517_c7_1e3d
n16_MUX_uxn_opcodes_h_l2517_c7_1e3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond,
n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue,
n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse,
n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d
result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d
result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_left,
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_right,
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_return_output);

-- n16_MUX_uxn_opcodes_h_l2520_c7_0666
n16_MUX_uxn_opcodes_h_l2520_c7_0666 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2520_c7_0666_cond,
n16_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue,
n16_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse,
n16_MUX_uxn_opcodes_h_l2520_c7_0666_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666
result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_cond,
result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666
result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666
result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_left,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_right,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_return_output);

-- n16_MUX_uxn_opcodes_h_l2525_c7_44c6
n16_MUX_uxn_opcodes_h_l2525_c7_44c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2525_c7_44c6_cond,
n16_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue,
n16_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse,
n16_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6
result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6
result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6
result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac
BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_left,
BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_right,
BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_return_output);

-- n16_MUX_uxn_opcodes_h_l2528_c7_aacc
n16_MUX_uxn_opcodes_h_l2528_c7_aacc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2528_c7_aacc_cond,
n16_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue,
n16_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse,
n16_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc
result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_cond,
result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc
result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc
result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc
result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a
BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a_left,
BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a_right,
BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d
BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d_left,
BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d_right,
BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81
BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81_left,
BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81_right,
BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81_return_output);

-- MUX_uxn_opcodes_h_l2532_c32_e800
MUX_uxn_opcodes_h_l2532_c32_e800 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2532_c32_e800_cond,
MUX_uxn_opcodes_h_l2532_c32_e800_iftrue,
MUX_uxn_opcodes_h_l2532_c32_e800_iffalse,
MUX_uxn_opcodes_h_l2532_c32_e800_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_left,
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_right,
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc
result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_cond,
result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc
result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c
BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_left,
BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_right,
BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883
result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_cond,
result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883
result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883
result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883
result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2542_c34_02d7
CONST_SR_8_uxn_opcodes_h_l2542_c34_02d7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2542_c34_02d7_x,
CONST_SR_8_uxn_opcodes_h_l2542_c34_02d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_left,
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_right,
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca
result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_cond,
result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca
result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf
BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_left,
BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_right,
BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f
result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f
result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f
result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2551_c34_f7c2
CONST_SR_8_uxn_opcodes_h_l2551_c34_f7c2 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2551_c34_f7c2_x,
CONST_SR_8_uxn_opcodes_h_l2551_c34_f7c2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0
BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0_left,
BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0_right,
BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007
result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007
result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2522_l2507_DUPLICATE_cef8
CONST_SL_8_uint16_t_uxn_opcodes_h_l2522_l2507_DUPLICATE_cef8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2522_l2507_DUPLICATE_cef8_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2522_l2507_DUPLICATE_cef8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_return_output,
 n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output,
 t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_return_output,
 n16_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output,
 t16_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_return_output,
 n16_MUX_uxn_opcodes_h_l2505_c7_b484_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_return_output,
 t16_MUX_uxn_opcodes_h_l2505_c7_b484_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_return_output,
 n16_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output,
 t16_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_return_output,
 n16_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output,
 t16_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_return_output,
 n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_return_output,
 n16_MUX_uxn_opcodes_h_l2520_c7_0666_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_return_output,
 n16_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_return_output,
 n16_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81_return_output,
 MUX_uxn_opcodes_h_l2532_c32_e800_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_return_output,
 CONST_SR_8_uxn_opcodes_h_l2542_c34_02d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output,
 CONST_SR_8_uxn_opcodes_h_l2551_c34_f7c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2522_l2507_DUPLICATE_cef8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2499_c3_385f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2497_c3_6cfa_uxn_opcodes_h_l2497_c3_6cfa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2505_c7_b484_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2502_c7_43eb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2503_c3_d783 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2505_c7_b484_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2502_c7_43eb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2505_c7_b484_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2508_c3_b1b3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2505_c7_b484_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2510_c7_15d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_33f7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2510_c7_15d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c7_7e93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_53b3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_7e93_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2520_c7_0666_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2518_c3_c08e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2520_c7_0666_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2523_c3_5628 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_44c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2526_c3_1df4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2528_c7_aacc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2532_c32_e800_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2532_c32_e800_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2532_c32_e800_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2532_c32_e800_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2537_c3_d3f9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2538_c24_0e72_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2541_c3_0485 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2542_c34_02d7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2542_c34_02d7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2542_c24_b8a3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2546_c3_0ab4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2547_c24_c35a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2550_c3_7676 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2551_c34_f7c2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2551_c34_f7c2_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2551_c24_4e06_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2496_l2520_l2549_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_7fe8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2544_l2513_l2540_l2510_l2505_l2502_l2525_DUPLICATE_b0d3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_d29d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2553_l2496_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2505_l2528_l2502_l2525_DUPLICATE_c28c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_ecb1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2534_l2505_l2528_l2502_l2525_DUPLICATE_d8e8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2529_l2506_l2521_DUPLICATE_d90a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2522_l2507_DUPLICATE_cef8_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2522_l2507_DUPLICATE_cef8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2528_l2549_DUPLICATE_2385_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2558_l2492_DUPLICATE_50cb_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2499_c3_385f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2499_c3_385f;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2526_c3_1df4 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2526_c3_1df4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2523_c3_5628 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2523_c3_5628;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l2532_c32_e800_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2541_c3_0485 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2541_c3_0485;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_33f7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_33f7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2508_c3_b1b3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2508_c3_b1b3;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_53b3 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_53b3;
     VAR_MUX_uxn_opcodes_h_l2532_c32_e800_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_right := to_unsigned(10, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2550_c3_7676 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2550_c3_7676;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2503_c3_d783 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2503_c3_d783;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2546_c3_0ab4 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2546_c3_0ab4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2537_c3_d3f9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2537_c3_d3f9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2518_c3_c08e := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2518_c3_c08e;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2542_c34_02d7_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2551_c34_f7c2_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse := t16;
     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_d29d LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_d29d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_c66f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2547_c24_c35a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2547_c24_c35a_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2534_c11_7fab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2505_c11_46a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2520_c11_4ffe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2529_l2506_l2521_DUPLICATE_d90a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2529_l2506_l2521_DUPLICATE_d90a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_ecb1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_ecb1_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_3961] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_left;
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_return_output := BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2544_c11_6031] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_left;
     BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_return_output := BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2496_c6_7d0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2496_l2520_l2549_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_7fe8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2496_l2520_l2549_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_7fe8_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2549_c11_9baf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2553_c11_6ba0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2502_c11_0b42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_left;
     BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_return_output := BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2528_l2549_DUPLICATE_2385 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2528_l2549_DUPLICATE_2385_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_4fb8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2538_c24_0e72] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2538_c24_0e72_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_SR_8[uxn_opcodes_h_l2551_c34_f7c2] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2551_c34_f7c2_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2551_c34_f7c2_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2551_c34_f7c2_return_output := CONST_SR_8_uxn_opcodes_h_l2551_c34_f7c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2528_c11_e0ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2532_c32_cd8d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d_left;
     BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d_return_output := BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2510_c11_4e9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2542_c34_02d7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2542_c34_02d7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2542_c34_02d7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2542_c34_02d7_return_output := CONST_SR_8_uxn_opcodes_h_l2542_c34_02d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2540_c11_a89c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2534_l2505_l2528_l2502_l2525_DUPLICATE_d8e8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2534_l2505_l2528_l2502_l2525_DUPLICATE_d8e8_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2553_l2496_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2505_l2528_l2502_l2525_DUPLICATE_c28c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2553_l2496_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2505_l2528_l2502_l2525_DUPLICATE_c28c_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2544_l2513_l2540_l2510_l2505_l2502_l2525_DUPLICATE_b0d3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2544_l2513_l2540_l2510_l2505_l2502_l2525_DUPLICATE_b0d3_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2532_c32_cd8d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_7d0e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2502_c7_43eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2502_c7_43eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_0b42_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2505_c7_b484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2505_c7_b484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_46a4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2510_c7_15d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2510_c7_15d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_4e9b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2513_c7_7e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_7e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_4fb8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_3961_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2520_c7_0666_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_4ffe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_44c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_c66f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2528_c7_aacc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2528_c11_e0ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_7fab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2540_c11_a89c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_6031_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_9baf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_6ba0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2529_l2506_l2521_DUPLICATE_d90a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2529_l2506_l2521_DUPLICATE_d90a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2522_l2507_DUPLICATE_cef8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2529_l2506_l2521_DUPLICATE_d90a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2538_c24_0e72_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2547_c24_c35a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_d29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_d29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_d29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_d29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_d29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_d29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_d29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_d29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_d29d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2534_l2505_l2528_l2502_l2525_DUPLICATE_d8e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2534_l2505_l2528_l2502_l2525_DUPLICATE_d8e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2534_l2505_l2528_l2502_l2525_DUPLICATE_d8e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2534_l2505_l2528_l2502_l2525_DUPLICATE_d8e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2534_l2505_l2528_l2502_l2525_DUPLICATE_d8e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2534_l2505_l2528_l2502_l2525_DUPLICATE_d8e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2534_l2505_l2528_l2502_l2525_DUPLICATE_d8e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2534_l2505_l2528_l2502_l2525_DUPLICATE_d8e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2534_l2505_l2528_l2502_l2525_DUPLICATE_d8e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2534_l2505_l2528_l2502_l2525_DUPLICATE_d8e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2534_l2505_l2528_l2502_l2525_DUPLICATE_d8e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2534_l2505_l2528_l2502_l2525_DUPLICATE_d8e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2534_l2505_l2528_l2502_l2525_DUPLICATE_d8e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2544_l2513_l2540_l2510_l2505_l2502_l2525_DUPLICATE_b0d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2544_l2513_l2540_l2510_l2505_l2502_l2525_DUPLICATE_b0d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2544_l2513_l2540_l2510_l2505_l2502_l2525_DUPLICATE_b0d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2544_l2513_l2540_l2510_l2505_l2502_l2525_DUPLICATE_b0d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2544_l2513_l2540_l2510_l2505_l2502_l2525_DUPLICATE_b0d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2544_l2513_l2540_l2510_l2505_l2502_l2525_DUPLICATE_b0d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2544_l2513_l2540_l2510_l2505_l2502_l2525_DUPLICATE_b0d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2544_l2513_l2540_l2510_l2505_l2502_l2525_DUPLICATE_b0d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2544_l2513_l2540_l2510_l2505_l2502_l2525_DUPLICATE_b0d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2496_l2520_l2517_l2544_l2513_l2540_l2510_l2505_l2502_l2525_DUPLICATE_b0d3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_ecb1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_ecb1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_ecb1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_ecb1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_ecb1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_ecb1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_ecb1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2520_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_ecb1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2553_l2496_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2505_l2528_l2502_l2525_DUPLICATE_c28c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2553_l2496_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2505_l2528_l2502_l2525_DUPLICATE_c28c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2553_l2496_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2505_l2528_l2502_l2525_DUPLICATE_c28c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2553_l2496_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2505_l2528_l2502_l2525_DUPLICATE_c28c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2553_l2496_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2505_l2528_l2502_l2525_DUPLICATE_c28c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2553_l2496_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2505_l2528_l2502_l2525_DUPLICATE_c28c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2553_l2496_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2505_l2528_l2502_l2525_DUPLICATE_c28c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2553_l2496_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2505_l2528_l2502_l2525_DUPLICATE_c28c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2553_l2496_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2505_l2528_l2502_l2525_DUPLICATE_c28c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2553_l2496_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2505_l2528_l2502_l2525_DUPLICATE_c28c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2553_l2496_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2505_l2528_l2502_l2525_DUPLICATE_c28c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2553_l2496_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2505_l2528_l2502_l2525_DUPLICATE_c28c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2553_l2496_l2520_l2549_l2517_l2544_l2513_l2540_l2510_l2505_l2528_l2502_l2525_DUPLICATE_c28c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2528_l2549_DUPLICATE_2385_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2528_l2549_DUPLICATE_2385_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2496_l2520_l2549_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_7fe8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2496_l2520_l2549_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_7fe8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2496_l2520_l2549_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_7fe8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2496_l2520_l2549_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_7fe8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2496_l2520_l2549_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_7fe8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2496_l2520_l2549_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_7fe8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2496_l2520_l2549_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_7fe8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2496_l2520_l2549_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_7fe8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2496_l2520_l2549_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_7fe8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2496_l2520_l2549_l2517_l2513_l2510_l2505_l2528_l2502_l2525_DUPLICATE_7fe8_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2551_c24_4e06] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2551_c24_4e06_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2551_c34_f7c2_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2528_c7_aacc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2496_c1_0668] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2549_c7_d34f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2532_c32_db81] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81_left;
     BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81_return_output := BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2544_c7_4fca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2529_c3_628a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a_left;
     BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a_return_output := BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2514_c3_ff53] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53_left;
     BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53_return_output := BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2553_c7_9007] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2522_l2507_DUPLICATE_cef8 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2522_l2507_DUPLICATE_cef8_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2522_l2507_DUPLICATE_cef8_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2522_l2507_DUPLICATE_cef8_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2522_l2507_DUPLICATE_cef8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2542_c24_b8a3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2542_c24_b8a3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2542_c34_02d7_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2553_c7_9007] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2532_c32_e800_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2532_c32_db81_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2514_c3_ff53_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2529_c3_628a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2542_c24_b8a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2551_c24_4e06_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2522_l2507_DUPLICATE_cef8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2522_l2507_DUPLICATE_cef8_return_output;
     VAR_printf_uxn_opcodes_h_l2497_c3_6cfa_uxn_opcodes_h_l2497_c3_6cfa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2496_c1_0668_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_9007_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2553_c7_9007_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2549_c7_d34f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output;

     -- MUX[uxn_opcodes_h_l2532_c32_e800] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2532_c32_e800_cond <= VAR_MUX_uxn_opcodes_h_l2532_c32_e800_cond;
     MUX_uxn_opcodes_h_l2532_c32_e800_iftrue <= VAR_MUX_uxn_opcodes_h_l2532_c32_e800_iftrue;
     MUX_uxn_opcodes_h_l2532_c32_e800_iffalse <= VAR_MUX_uxn_opcodes_h_l2532_c32_e800_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2532_c32_e800_return_output := MUX_uxn_opcodes_h_l2532_c32_e800_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2549_c7_d34f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2549_c7_d34f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2528_c7_aacc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2528_c7_aacc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2528_c7_aacc_cond;
     n16_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue;
     n16_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output := n16_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2544_c7_4fca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output;

     -- t16_MUX[uxn_opcodes_h_l2513_c7_7e93] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2513_c7_7e93_cond <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_7e93_cond;
     t16_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue;
     t16_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output := t16_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2540_c7_7883] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_return_output;

     -- printf_uxn_opcodes_h_l2497_c3_6cfa[uxn_opcodes_h_l2497_c3_6cfa] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2497_c3_6cfa_uxn_opcodes_h_l2497_c3_6cfa_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2497_c3_6cfa_uxn_opcodes_h_l2497_c3_6cfa_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2525_c7_44c6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue := VAR_MUX_uxn_opcodes_h_l2532_c32_e800_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2540_c7_7883_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2549_c7_d34f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output;
     -- n16_MUX[uxn_opcodes_h_l2525_c7_44c6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2525_c7_44c6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_44c6_cond;
     n16_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue;
     n16_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output := n16_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2534_c7_9abc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2544_c7_4fca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2520_c7_0666] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2544_c7_4fca] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output := result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2540_c7_7883] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2544_c7_4fca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2528_c7_aacc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output;

     -- t16_MUX[uxn_opcodes_h_l2510_c7_15d3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2510_c7_15d3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2510_c7_15d3_cond;
     t16_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue;
     t16_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output := t16_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2520_c7_0666_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2540_c7_7883_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_4fca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2534_c7_9abc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2528_c7_aacc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2517_c7_1e3d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2525_c7_44c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2540_c7_7883] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2540_c7_7883] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_return_output := result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_return_output;

     -- t16_MUX[uxn_opcodes_h_l2505_c7_b484] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2505_c7_b484_cond <= VAR_t16_MUX_uxn_opcodes_h_l2505_c7_b484_cond;
     t16_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue;
     t16_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2505_c7_b484_return_output := t16_MUX_uxn_opcodes_h_l2505_c7_b484_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2540_c7_7883] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_return_output;

     -- n16_MUX[uxn_opcodes_h_l2520_c7_0666] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2520_c7_0666_cond <= VAR_n16_MUX_uxn_opcodes_h_l2520_c7_0666_cond;
     n16_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue;
     n16_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2520_c7_0666_return_output := n16_MUX_uxn_opcodes_h_l2520_c7_0666_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2520_c7_0666_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2540_c7_7883_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2540_c7_7883_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2540_c7_7883_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2505_c7_b484_return_output;
     -- n16_MUX[uxn_opcodes_h_l2517_c7_1e3d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond;
     n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue;
     n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output := n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2502_c7_43eb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2502_c7_43eb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2502_c7_43eb_cond;
     t16_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue;
     t16_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output := t16_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2525_c7_44c6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2534_c7_9abc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2534_c7_9abc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output := result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2520_c7_0666] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2528_c7_aacc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2513_c7_7e93] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2534_c7_9abc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2520_c7_0666_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2534_c7_9abc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2528_c7_aacc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output := result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2528_c7_aacc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2520_c7_0666] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_1e3d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2496_c2_d5d6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond;
     t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue;
     t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output := t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2513_c7_7e93] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2513_c7_7e93_cond <= VAR_n16_MUX_uxn_opcodes_h_l2513_c7_7e93_cond;
     n16_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue;
     n16_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output := n16_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2510_c7_15d3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2525_c7_44c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2528_c7_aacc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_0666_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2528_c7_aacc_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2525_c7_44c6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_7e93] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2520_c7_0666] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_44c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2505_c7_b484] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_return_output;

     -- n16_MUX[uxn_opcodes_h_l2510_c7_15d3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2510_c7_15d3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2510_c7_15d3_cond;
     n16_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue;
     n16_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output := n16_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2517_c7_1e3d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2525_c7_44c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2505_c7_b484_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2520_c7_0666_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2525_c7_44c6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2510_c7_15d3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2520_c7_0666] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2520_c7_0666] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_return_output := result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2520_c7_0666] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_return_output;

     -- n16_MUX[uxn_opcodes_h_l2505_c7_b484] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2505_c7_b484_cond <= VAR_n16_MUX_uxn_opcodes_h_l2505_c7_b484_cond;
     n16_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue;
     n16_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2505_c7_b484_return_output := n16_MUX_uxn_opcodes_h_l2505_c7_b484_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_1e3d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2513_c7_7e93] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2502_c7_43eb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2505_c7_b484_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_0666_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2520_c7_0666_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2520_c7_0666_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2517_c7_1e3d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2496_c2_d5d6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_1e3d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2505_c7_b484] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_1e3d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_7e93] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2510_c7_15d3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2502_c7_43eb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2502_c7_43eb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2502_c7_43eb_cond;
     n16_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue;
     n16_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output := n16_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2505_c7_b484_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2517_c7_1e3d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2505_c7_b484] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_return_output;

     -- n16_MUX[uxn_opcodes_h_l2496_c2_d5d6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond;
     n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue;
     n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output := n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2513_c7_7e93] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output := result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c7_7e93] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2502_c7_43eb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2510_c7_15d3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_7e93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_b484_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2513_c7_7e93_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2510_c7_15d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2502_c7_43eb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2510_c7_15d3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2505_c7_b484] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2510_c7_15d3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c2_d5d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_b484_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2510_c7_15d3_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2496_c2_d5d6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2505_c7_b484] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2502_c7_43eb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2505_c7_b484] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_return_output := result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2505_c7_b484] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_b484_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_b484_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_b484_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2502_c7_43eb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c2_d5d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2502_c7_43eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2502_c7_43eb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2502_c7_43eb_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2496_c2_d5d6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c2_d5d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c2_d5d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output;

     -- Submodule level 15
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2558_l2492_DUPLICATE_50cb LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2558_l2492_DUPLICATE_50cb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_d5d6_return_output);

     -- Submodule level 16
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2558_l2492_DUPLICATE_50cb_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2558_l2492_DUPLICATE_50cb_return_output;
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
