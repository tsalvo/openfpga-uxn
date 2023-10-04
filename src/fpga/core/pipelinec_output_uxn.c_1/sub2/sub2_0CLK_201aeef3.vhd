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
-- Submodules: 123
entity sub2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_201aeef3;
architecture arch of sub2_0CLK_201aeef3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2246_c6_a5c0]
signal BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2246_c1_0fef]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2246_c2_841e]
signal tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2246_c2_841e]
signal t16_MUX_uxn_opcodes_h_l2246_c2_841e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2246_c2_841e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2246_c2_841e]
signal result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2246_c2_841e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2246_c2_841e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2246_c2_841e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2246_c2_841e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2246_c2_841e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2246_c2_841e]
signal n16_MUX_uxn_opcodes_h_l2246_c2_841e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2247_c3_5261[uxn_opcodes_h_l2247_c3_5261]
signal printf_uxn_opcodes_h_l2247_c3_5261_uxn_opcodes_h_l2247_c3_5261_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2252_c11_2033]
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2252_c7_cc7d]
signal tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2252_c7_cc7d]
signal t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2252_c7_cc7d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2252_c7_cc7d]
signal result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2252_c7_cc7d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2252_c7_cc7d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2252_c7_cc7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2252_c7_cc7d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2252_c7_cc7d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2252_c7_cc7d]
signal n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2255_c11_10f9]
signal BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2255_c7_4675]
signal tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2255_c7_4675]
signal t16_MUX_uxn_opcodes_h_l2255_c7_4675_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2255_c7_4675]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2255_c7_4675]
signal result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2255_c7_4675]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2255_c7_4675]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2255_c7_4675]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2255_c7_4675]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2255_c7_4675]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2255_c7_4675]
signal n16_MUX_uxn_opcodes_h_l2255_c7_4675_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2260_c11_c6b0]
signal BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2260_c7_7eb9]
signal tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2260_c7_7eb9]
signal t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2260_c7_7eb9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2260_c7_7eb9]
signal result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2260_c7_7eb9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2260_c7_7eb9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2260_c7_7eb9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2260_c7_7eb9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2260_c7_7eb9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2260_c7_7eb9]
signal n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2263_c11_1c56]
signal BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2263_c7_f296]
signal tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2263_c7_f296]
signal t16_MUX_uxn_opcodes_h_l2263_c7_f296_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2263_c7_f296]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2263_c7_f296]
signal result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2263_c7_f296]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2263_c7_f296]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2263_c7_f296]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2263_c7_f296]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2263_c7_f296]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2263_c7_f296]
signal n16_MUX_uxn_opcodes_h_l2263_c7_f296_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2264_c3_bed9]
signal BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2267_c11_4225]
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2267_c7_1f15]
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2267_c7_1f15]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2267_c7_1f15]
signal result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2267_c7_1f15]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2267_c7_1f15]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2267_c7_1f15]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2267_c7_1f15]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2267_c7_1f15]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2267_c7_1f15]
signal n16_MUX_uxn_opcodes_h_l2267_c7_1f15_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2270_c11_ac1a]
signal BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2270_c7_1733]
signal tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2270_c7_1733]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2270_c7_1733]
signal result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2270_c7_1733]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2270_c7_1733]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2270_c7_1733]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2270_c7_1733]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2270_c7_1733]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2270_c7_1733]
signal n16_MUX_uxn_opcodes_h_l2270_c7_1733_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2270_c7_1733_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2275_c11_9b27]
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2275_c7_4781]
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2275_c7_4781]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2275_c7_4781]
signal result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2275_c7_4781]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2275_c7_4781]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2275_c7_4781]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2275_c7_4781]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2275_c7_4781]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2275_c7_4781]
signal n16_MUX_uxn_opcodes_h_l2275_c7_4781_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_4781_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2278_c11_fc9f]
signal BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2278_c7_27a3]
signal tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2278_c7_27a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2278_c7_27a3]
signal result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2278_c7_27a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2278_c7_27a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2278_c7_27a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2278_c7_27a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2278_c7_27a3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2278_c7_27a3]
signal n16_MUX_uxn_opcodes_h_l2278_c7_27a3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2279_c3_bfaf]
signal BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2280_c11_5856]
signal BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2283_c32_e9ff]
signal BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2283_c32_00d8]
signal BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2283_c32_ac59]
signal MUX_uxn_opcodes_h_l2283_c32_ac59_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2283_c32_ac59_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2283_c32_ac59_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2283_c32_ac59_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2285_c11_2a54]
signal BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2285_c7_cf08]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2285_c7_cf08]
signal result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2285_c7_cf08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2285_c7_cf08]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2285_c7_cf08]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2291_c11_c890]
signal BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2291_c7_24fd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2291_c7_24fd]
signal result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2291_c7_24fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2291_c7_24fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2293_c34_6c21]
signal CONST_SR_8_uxn_opcodes_h_l2293_c34_6c21_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2293_c34_6c21_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2295_c11_31d4]
signal BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2295_c7_2cf5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2295_c7_2cf5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2257_l2272_DUPLICATE_e450
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2257_l2272_DUPLICATE_e450_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2257_l2272_DUPLICATE_e450_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0
BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_left,
BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_right,
BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2246_c2_841e
tmp16_MUX_uxn_opcodes_h_l2246_c2_841e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_cond,
tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output);

-- t16_MUX_uxn_opcodes_h_l2246_c2_841e
t16_MUX_uxn_opcodes_h_l2246_c2_841e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2246_c2_841e_cond,
t16_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue,
t16_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse,
t16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e
result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e
result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e
result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e
result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e
result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_return_output);

-- n16_MUX_uxn_opcodes_h_l2246_c2_841e
n16_MUX_uxn_opcodes_h_l2246_c2_841e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2246_c2_841e_cond,
n16_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue,
n16_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse,
n16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output);

-- printf_uxn_opcodes_h_l2247_c3_5261_uxn_opcodes_h_l2247_c3_5261
printf_uxn_opcodes_h_l2247_c3_5261_uxn_opcodes_h_l2247_c3_5261 : entity work.printf_uxn_opcodes_h_l2247_c3_5261_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2247_c3_5261_uxn_opcodes_h_l2247_c3_5261_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_left,
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_right,
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d
tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond,
tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output);

-- t16_MUX_uxn_opcodes_h_l2252_c7_cc7d
t16_MUX_uxn_opcodes_h_l2252_c7_cc7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond,
t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue,
t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse,
t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d
result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d
result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output);

-- n16_MUX_uxn_opcodes_h_l2252_c7_cc7d
n16_MUX_uxn_opcodes_h_l2252_c7_cc7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond,
n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue,
n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse,
n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9
BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_left,
BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_right,
BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2255_c7_4675
tmp16_MUX_uxn_opcodes_h_l2255_c7_4675 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_cond,
tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue,
tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse,
tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output);

-- t16_MUX_uxn_opcodes_h_l2255_c7_4675
t16_MUX_uxn_opcodes_h_l2255_c7_4675 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2255_c7_4675_cond,
t16_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue,
t16_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse,
t16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675
result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675
result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_cond,
result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675
result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675
result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675
result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675
result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_return_output);

-- n16_MUX_uxn_opcodes_h_l2255_c7_4675
n16_MUX_uxn_opcodes_h_l2255_c7_4675 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2255_c7_4675_cond,
n16_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue,
n16_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse,
n16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0
BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_left,
BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_right,
BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9
tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond,
tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output);

-- t16_MUX_uxn_opcodes_h_l2260_c7_7eb9
t16_MUX_uxn_opcodes_h_l2260_c7_7eb9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond,
t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue,
t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse,
t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9
result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9
result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9
result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9
result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9
result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output);

-- n16_MUX_uxn_opcodes_h_l2260_c7_7eb9
n16_MUX_uxn_opcodes_h_l2260_c7_7eb9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond,
n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue,
n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse,
n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56
BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_left,
BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_right,
BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2263_c7_f296
tmp16_MUX_uxn_opcodes_h_l2263_c7_f296 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_cond,
tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue,
tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse,
tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output);

-- t16_MUX_uxn_opcodes_h_l2263_c7_f296
t16_MUX_uxn_opcodes_h_l2263_c7_f296 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2263_c7_f296_cond,
t16_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue,
t16_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse,
t16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296
result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296
result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_cond,
result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296
result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296
result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296
result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296
result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_return_output);

-- n16_MUX_uxn_opcodes_h_l2263_c7_f296
n16_MUX_uxn_opcodes_h_l2263_c7_f296 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2263_c7_f296_cond,
n16_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue,
n16_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse,
n16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9
BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9_left,
BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9_right,
BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_left,
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_right,
BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15
tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_cond,
tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue,
tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse,
tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15
result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15
result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_cond,
result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15
result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output);

-- n16_MUX_uxn_opcodes_h_l2267_c7_1f15
n16_MUX_uxn_opcodes_h_l2267_c7_1f15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2267_c7_1f15_cond,
n16_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue,
n16_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse,
n16_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a
BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_left,
BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_right,
BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2270_c7_1733
tmp16_MUX_uxn_opcodes_h_l2270_c7_1733 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_cond,
tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue,
tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse,
tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733
result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733
result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_cond,
result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733
result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733
result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733
result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733
result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_return_output);

-- n16_MUX_uxn_opcodes_h_l2270_c7_1733
n16_MUX_uxn_opcodes_h_l2270_c7_1733 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2270_c7_1733_cond,
n16_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue,
n16_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse,
n16_MUX_uxn_opcodes_h_l2270_c7_1733_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_left,
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_right,
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2275_c7_4781
tmp16_MUX_uxn_opcodes_h_l2275_c7_4781 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_cond,
tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue,
tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse,
tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781
result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781
result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_cond,
result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781
result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_return_output);

-- n16_MUX_uxn_opcodes_h_l2275_c7_4781
n16_MUX_uxn_opcodes_h_l2275_c7_4781 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2275_c7_4781_cond,
n16_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue,
n16_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse,
n16_MUX_uxn_opcodes_h_l2275_c7_4781_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f
BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_left,
BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_right,
BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3
tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_cond,
tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue,
tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse,
tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3
result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3
result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3
result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3
result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3
result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output);

-- n16_MUX_uxn_opcodes_h_l2278_c7_27a3
n16_MUX_uxn_opcodes_h_l2278_c7_27a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2278_c7_27a3_cond,
n16_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue,
n16_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse,
n16_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf
BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf_left,
BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf_right,
BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856
BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856_left,
BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856_right,
BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff
BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff_left,
BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff_right,
BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8
BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8_left,
BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8_right,
BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8_return_output);

-- MUX_uxn_opcodes_h_l2283_c32_ac59
MUX_uxn_opcodes_h_l2283_c32_ac59 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2283_c32_ac59_cond,
MUX_uxn_opcodes_h_l2283_c32_ac59_iftrue,
MUX_uxn_opcodes_h_l2283_c32_ac59_iffalse,
MUX_uxn_opcodes_h_l2283_c32_ac59_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54
BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_left,
BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_right,
BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08
result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08
result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_cond,
result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08
result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08
result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890
BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_left,
BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_right,
BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd
result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_cond,
result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd
result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd
result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2293_c34_6c21
CONST_SR_8_uxn_opcodes_h_l2293_c34_6c21 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2293_c34_6c21_x,
CONST_SR_8_uxn_opcodes_h_l2293_c34_6c21_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4
BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4_left,
BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4_right,
BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5
result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5
result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2257_l2272_DUPLICATE_e450
CONST_SL_8_uint16_t_uxn_opcodes_h_l2257_l2272_DUPLICATE_e450 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2257_l2272_DUPLICATE_e450_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2257_l2272_DUPLICATE_e450_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_return_output,
 tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output,
 t16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_return_output,
 n16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_return_output,
 tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output,
 t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output,
 n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output,
 t16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_return_output,
 n16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output,
 t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output,
 n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_return_output,
 tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output,
 t16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_return_output,
 n16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_return_output,
 tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output,
 n16_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_return_output,
 n16_MUX_uxn_opcodes_h_l2270_c7_1733_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_return_output,
 tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_return_output,
 n16_MUX_uxn_opcodes_h_l2275_c7_4781_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output,
 n16_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8_return_output,
 MUX_uxn_opcodes_h_l2283_c32_ac59_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output,
 CONST_SR_8_uxn_opcodes_h_l2293_c34_6c21_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2257_l2272_DUPLICATE_e450_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2246_c2_841e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2249_c3_037e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2246_c2_841e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2247_c3_5261_uxn_opcodes_h_l2247_c3_5261_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2253_c3_c334 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2255_c7_4675_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2258_c3_83e3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2255_c7_4675_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_fe84 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2263_c7_f296_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_e58b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2263_c7_f296_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2268_c3_caf6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2270_c7_1733_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1f15_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2273_c3_16a8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_4781_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2270_c7_1733_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2276_c3_d2c7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_4781_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2278_c7_27a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2283_c32_ac59_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2283_c32_ac59_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2283_c32_ac59_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2283_c32_ac59_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2288_c3_e7bc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2289_c24_d2e8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2292_c3_52a9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2293_c34_6c21_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2293_c34_6c21_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2293_c24_60ef_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_c780_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_l2291_DUPLICATE_a9b2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_ae48_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2295_l2263_l2291_DUPLICATE_56d3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2278_l2252_l2275_l2270_l2267_l2295_l2263_l2291_DUPLICATE_665b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2270_l2267_l2263_DUPLICATE_ea94_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2264_l2256_l2271_l2279_DUPLICATE_adfd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2257_l2272_DUPLICATE_e450_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2257_l2272_DUPLICATE_e450_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2278_l2291_DUPLICATE_ce8d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2300_l2242_DUPLICATE_5fd4_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l2283_c32_ac59_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2292_c3_52a9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2292_c3_52a9;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2276_c3_d2c7 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2276_c3_d2c7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_right := to_unsigned(7, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2249_c3_037e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2249_c3_037e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_e58b := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2265_c3_e58b;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2273_c3_16a8 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2273_c3_16a8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2253_c3_c334 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2253_c3_c334;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_fe84 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2261_c3_fe84;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2258_c3_83e3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2258_c3_83e3;
     VAR_MUX_uxn_opcodes_h_l2283_c32_ac59_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2288_c3_e7bc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2288_c3_e7bc;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2268_c3_caf6 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2268_c3_caf6;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_right := to_unsigned(6, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2293_c34_6c21_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l2293_c34_6c21] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2293_c34_6c21_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2293_c34_6c21_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2293_c34_6c21_return_output := CONST_SR_8_uxn_opcodes_h_l2293_c34_6c21_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2252_c11_2033] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_left;
     BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_return_output := BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2275_c11_9b27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_left;
     BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_return_output := BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2263_c11_1c56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_left;
     BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_return_output := BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2285_c11_2a54] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_left;
     BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_return_output := BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_l2291_DUPLICATE_a9b2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_l2291_DUPLICATE_a9b2_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2278_l2252_l2275_l2270_l2267_l2295_l2263_l2291_DUPLICATE_665b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2278_l2252_l2275_l2270_l2267_l2295_l2263_l2291_DUPLICATE_665b_return_output := result.is_opc_done;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2289_c24_d2e8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2289_c24_d2e8_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_AND[uxn_opcodes_h_l2283_c32_e9ff] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff_left;
     BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff_return_output := BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2270_c11_ac1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2278_c11_fc9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2291_c11_c890] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_left;
     BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_return_output := BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2264_l2256_l2271_l2279_DUPLICATE_adfd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2264_l2256_l2271_l2279_DUPLICATE_adfd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_c780 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_c780_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2278_l2291_DUPLICATE_ce8d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2278_l2291_DUPLICATE_ce8d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2260_c11_c6b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2267_c11_4225] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_left;
     BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_return_output := BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_ae48 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_ae48_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2255_c11_10f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2295_l2263_l2291_DUPLICATE_56d3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2295_l2263_l2291_DUPLICATE_56d3_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2270_l2267_l2263_DUPLICATE_ea94 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2270_l2267_l2263_DUPLICATE_ea94_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2246_c6_a5c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2295_c11_31d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2283_c32_e9ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2246_c2_841e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2246_c2_841e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2246_c6_a5c0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_2033_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2255_c7_4675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2255_c7_4675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2255_c11_10f9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c11_c6b0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2263_c7_f296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2263_c7_f296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2263_c11_1c56_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1f15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2267_c11_4225_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2270_c7_1733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c11_ac1a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_4781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_9b27_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2278_c7_27a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_fc9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2285_c11_2a54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2291_c11_c890_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2295_c11_31d4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2264_l2256_l2271_l2279_DUPLICATE_adfd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2264_l2256_l2271_l2279_DUPLICATE_adfd_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2257_l2272_DUPLICATE_e450_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2264_l2256_l2271_l2279_DUPLICATE_adfd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2289_c24_d2e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_ae48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_ae48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_ae48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_ae48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_ae48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_ae48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_ae48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_ae48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_ae48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2278_l2252_l2275_l2270_l2267_l2295_l2263_l2291_DUPLICATE_665b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2278_l2252_l2275_l2270_l2267_l2295_l2263_l2291_DUPLICATE_665b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2278_l2252_l2275_l2270_l2267_l2295_l2263_l2291_DUPLICATE_665b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2278_l2252_l2275_l2270_l2267_l2295_l2263_l2291_DUPLICATE_665b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2278_l2252_l2275_l2270_l2267_l2295_l2263_l2291_DUPLICATE_665b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2278_l2252_l2275_l2270_l2267_l2295_l2263_l2291_DUPLICATE_665b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2278_l2252_l2275_l2270_l2267_l2295_l2263_l2291_DUPLICATE_665b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2278_l2252_l2275_l2270_l2267_l2295_l2263_l2291_DUPLICATE_665b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2278_l2252_l2275_l2270_l2267_l2295_l2263_l2291_DUPLICATE_665b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2278_l2252_l2275_l2270_l2267_l2295_l2263_l2291_DUPLICATE_665b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2278_l2252_l2275_l2270_l2267_l2295_l2263_l2291_DUPLICATE_665b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_c780_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_c780_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_c780_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_c780_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_c780_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_c780_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_c780_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_c780_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2260_l2285_l2255_l2252_l2275_l2246_l2270_l2267_l2263_DUPLICATE_c780_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2270_l2267_l2263_DUPLICATE_ea94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2270_l2267_l2263_DUPLICATE_ea94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2270_l2267_l2263_DUPLICATE_ea94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2270_l2267_l2263_DUPLICATE_ea94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2270_l2267_l2263_DUPLICATE_ea94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2270_l2267_l2263_DUPLICATE_ea94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2270_l2267_l2263_DUPLICATE_ea94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2270_l2267_l2263_DUPLICATE_ea94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2295_l2263_l2291_DUPLICATE_56d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2295_l2263_l2291_DUPLICATE_56d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2295_l2263_l2291_DUPLICATE_56d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2295_l2263_l2291_DUPLICATE_56d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2295_l2263_l2291_DUPLICATE_56d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2295_l2263_l2291_DUPLICATE_56d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2295_l2263_l2291_DUPLICATE_56d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2295_l2263_l2291_DUPLICATE_56d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2295_l2263_l2291_DUPLICATE_56d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2295_l2263_l2291_DUPLICATE_56d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2295_l2263_l2291_DUPLICATE_56d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2278_l2291_DUPLICATE_ce8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2278_l2291_DUPLICATE_ce8d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_l2291_DUPLICATE_a9b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_l2291_DUPLICATE_a9b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_l2291_DUPLICATE_a9b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_l2291_DUPLICATE_a9b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_l2291_DUPLICATE_a9b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_l2291_DUPLICATE_a9b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_l2291_DUPLICATE_a9b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_l2291_DUPLICATE_a9b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_l2291_DUPLICATE_a9b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2260_l2255_l2278_l2252_l2275_l2246_l2270_l2267_l2263_l2291_DUPLICATE_a9b2_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2279_c3_bfaf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf_left;
     BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf_return_output := BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2246_c1_0fef] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2285_c7_cf08] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2293_c24_60ef] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2293_c24_60ef_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2293_c34_6c21_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2295_c7_2cf5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2264_c3_bed9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9_left;
     BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9_return_output := BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2295_c7_2cf5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2278_c7_27a3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2291_c7_24fd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2257_l2272_DUPLICATE_e450 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2257_l2272_DUPLICATE_e450_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2257_l2272_DUPLICATE_e450_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2257_l2272_DUPLICATE_e450_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2257_l2272_DUPLICATE_e450_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2283_c32_00d8] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8_left;
     BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8_return_output := BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2283_c32_ac59_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2283_c32_00d8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2264_c3_bed9_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2279_c3_bfaf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2293_c24_60ef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2257_l2272_DUPLICATE_e450_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2257_l2272_DUPLICATE_e450_return_output;
     VAR_printf_uxn_opcodes_h_l2247_c3_5261_uxn_opcodes_h_l2247_c3_5261_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2246_c1_0fef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2295_c7_2cf5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2295_c7_2cf5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output;
     -- printf_uxn_opcodes_h_l2247_c3_5261[uxn_opcodes_h_l2247_c3_5261] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2247_c3_5261_uxn_opcodes_h_l2247_c3_5261_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2247_c3_5261_uxn_opcodes_h_l2247_c3_5261_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2291_c7_24fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2275_c7_4781] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_return_output;

     -- n16_MUX[uxn_opcodes_h_l2278_c7_27a3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2278_c7_27a3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2278_c7_27a3_cond;
     n16_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue;
     n16_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output := n16_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2291_c7_24fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2291_c7_24fd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output := result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2278_c7_27a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2280_c11_5856] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2285_c7_cf08] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output;

     -- t16_MUX[uxn_opcodes_h_l2263_c7_f296] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2263_c7_f296_cond <= VAR_t16_MUX_uxn_opcodes_h_l2263_c7_f296_cond;
     t16_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue;
     t16_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output := t16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output;

     -- MUX[uxn_opcodes_h_l2283_c32_ac59] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2283_c32_ac59_cond <= VAR_MUX_uxn_opcodes_h_l2283_c32_ac59_cond;
     MUX_uxn_opcodes_h_l2283_c32_ac59_iftrue <= VAR_MUX_uxn_opcodes_h_l2283_c32_ac59_iftrue;
     MUX_uxn_opcodes_h_l2283_c32_ac59_iffalse <= VAR_MUX_uxn_opcodes_h_l2283_c32_ac59_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2283_c32_ac59_return_output := MUX_uxn_opcodes_h_l2283_c32_ac59_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2280_c11_5856_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue := VAR_MUX_uxn_opcodes_h_l2283_c32_ac59_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2275_c7_4781_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2291_c7_24fd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2278_c7_27a3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_cond;
     tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output := tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2285_c7_cf08] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2278_c7_27a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2285_c7_cf08] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output := result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2278_c7_27a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2275_c7_4781] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2275_c7_4781_cond <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_4781_cond;
     n16_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue;
     n16_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_4781_return_output := n16_MUX_uxn_opcodes_h_l2275_c7_4781_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2275_c7_4781] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2285_c7_cf08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2270_c7_1733] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_return_output;

     -- t16_MUX[uxn_opcodes_h_l2260_c7_7eb9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond;
     t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue;
     t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output := t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2275_c7_4781_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_4781_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2270_c7_1733_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2285_c7_cf08_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2278_c7_27a3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2275_c7_4781] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_return_output;

     -- t16_MUX[uxn_opcodes_h_l2255_c7_4675] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2255_c7_4675_cond <= VAR_t16_MUX_uxn_opcodes_h_l2255_c7_4675_cond;
     t16_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue;
     t16_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output := t16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2278_c7_27a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2278_c7_27a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2270_c7_1733] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2275_c7_4781] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_return_output;

     -- n16_MUX[uxn_opcodes_h_l2270_c7_1733] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2270_c7_1733_cond <= VAR_n16_MUX_uxn_opcodes_h_l2270_c7_1733_cond;
     n16_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue;
     n16_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2270_c7_1733_return_output := n16_MUX_uxn_opcodes_h_l2270_c7_1733_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2275_c7_4781] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_cond;
     tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_return_output := tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2267_c7_1f15] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2270_c7_1733_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c7_1733_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_4781_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_4781_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_27a3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_4781_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2270_c7_1733] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_return_output;

     -- t16_MUX[uxn_opcodes_h_l2252_c7_cc7d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond;
     t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue;
     t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output := t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2263_c7_f296] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_return_output;

     -- n16_MUX[uxn_opcodes_h_l2267_c7_1f15] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2267_c7_1f15_cond <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1f15_cond;
     n16_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue;
     n16_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output := n16_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2267_c7_1f15] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2275_c7_4781] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2275_c7_4781] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_return_output := result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2270_c7_1733] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2275_c7_4781] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2270_c7_1733] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_cond;
     tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_return_output := tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_4781_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2263_c7_f296_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_4781_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c7_1733_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c7_1733_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_4781_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2270_c7_1733_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2267_c7_1f15] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2267_c7_1f15] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_cond;
     tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output := tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2270_c7_1733] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_return_output := result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_return_output;

     -- t16_MUX[uxn_opcodes_h_l2246_c2_841e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2246_c2_841e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2246_c2_841e_cond;
     t16_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue;
     t16_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output := t16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2260_c7_7eb9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2263_c7_f296] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2263_c7_f296_cond <= VAR_n16_MUX_uxn_opcodes_h_l2263_c7_f296_cond;
     n16_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue;
     n16_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output := n16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2263_c7_f296] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2270_c7_1733] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2270_c7_1733] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2267_c7_1f15] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c7_1733_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2263_c7_f296_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c7_1733_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c7_1733_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2267_c7_1f15] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2263_c7_f296] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_cond;
     tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output := tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2255_c7_4675] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2263_c7_f296] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2260_c7_7eb9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2267_c7_1f15] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output;

     -- n16_MUX[uxn_opcodes_h_l2260_c7_7eb9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond;
     n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue;
     n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output := n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2267_c7_1f15] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output := result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2263_c7_f296] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2255_c7_4675_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2263_c7_f296_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2263_c7_f296_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2267_c7_1f15_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2263_c7_f296_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2260_c7_7eb9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond;
     tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output := tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2255_c7_4675] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2255_c7_4675_cond <= VAR_n16_MUX_uxn_opcodes_h_l2255_c7_4675_cond;
     n16_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue;
     n16_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output := n16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2260_c7_7eb9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2263_c7_f296] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2252_c7_cc7d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2260_c7_7eb9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2263_c7_f296] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2255_c7_4675] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2263_c7_f296] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_return_output := result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2263_c7_f296_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2255_c7_4675_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2263_c7_f296_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2263_c7_f296_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2252_c7_cc7d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2260_c7_7eb9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2255_c7_4675] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_return_output;

     -- n16_MUX[uxn_opcodes_h_l2252_c7_cc7d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond;
     n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue;
     n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output := n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2255_c7_4675] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2260_c7_7eb9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2246_c2_841e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2260_c7_7eb9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2255_c7_4675] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_cond;
     tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output := tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2255_c7_4675_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2255_c7_4675_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2260_c7_7eb9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2255_c7_4675_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2252_c7_cc7d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2255_c7_4675] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2255_c7_4675] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_return_output := result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2255_c7_4675] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2252_c7_cc7d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond;
     tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output := tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2252_c7_cc7d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2246_c2_841e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2246_c2_841e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2246_c2_841e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2246_c2_841e_cond;
     n16_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue;
     n16_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output := n16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2255_c7_4675_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2255_c7_4675_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2255_c7_4675_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2246_c2_841e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2246_c2_841e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2252_c7_cc7d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2252_c7_cc7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2252_c7_cc7d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2246_c2_841e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_cond;
     tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output := tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2252_c7_cc7d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2246_c2_841e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2246_c2_841e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2246_c2_841e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2246_c2_841e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2300_l2242_DUPLICATE_5fd4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2300_l2242_DUPLICATE_5fd4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2246_c2_841e_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2246_c2_841e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2246_c2_841e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2246_c2_841e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2246_c2_841e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2246_c2_841e_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2246_c2_841e_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2300_l2242_DUPLICATE_5fd4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2300_l2242_DUPLICATE_5fd4_return_output;
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
