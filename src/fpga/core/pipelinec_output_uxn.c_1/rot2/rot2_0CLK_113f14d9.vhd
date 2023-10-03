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
-- Submodules: 186
entity rot2_0CLK_113f14d9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_113f14d9;
architecture arch of rot2_0CLK_113f14d9 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal l16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_l16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1817_c6_9e15]
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1817_c1_e123]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1817_c2_5e84]
signal n16_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l1817_c2_5e84]
signal l16_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1817_c2_5e84]
signal t16_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1817_c2_5e84]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1817_c2_5e84]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1817_c2_5e84]
signal result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1817_c2_5e84]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1817_c2_5e84]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1817_c2_5e84]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1817_c2_5e84]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1817_c2_5e84]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1818_c3_a79f[uxn_opcodes_h_l1818_c3_a79f]
signal printf_uxn_opcodes_h_l1818_c3_a79f_uxn_opcodes_h_l1818_c3_a79f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1825_c11_8c2f]
signal BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1825_c7_7dd6]
signal n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l1825_c7_7dd6]
signal l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1825_c7_7dd6]
signal t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1825_c7_7dd6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1825_c7_7dd6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1825_c7_7dd6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1825_c7_7dd6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1825_c7_7dd6]
signal result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1825_c7_7dd6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1825_c7_7dd6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1829_c11_8abd]
signal BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1829_c7_e0a7]
signal n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l1829_c7_e0a7]
signal l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1829_c7_e0a7]
signal t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1829_c7_e0a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1829_c7_e0a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1829_c7_e0a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1829_c7_e0a7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1829_c7_e0a7]
signal result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1829_c7_e0a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1829_c7_e0a7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1835_c11_03e1]
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1835_c7_b0cd]
signal n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l1835_c7_b0cd]
signal l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1835_c7_b0cd]
signal t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1835_c7_b0cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1835_c7_b0cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1835_c7_b0cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1835_c7_b0cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1835_c7_b0cd]
signal result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1835_c7_b0cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1835_c7_b0cd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1839_c11_cdc4]
signal BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1839_c7_7cf5]
signal n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l1839_c7_7cf5]
signal l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1839_c7_7cf5]
signal t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1839_c7_7cf5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1839_c7_7cf5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1839_c7_7cf5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1839_c7_7cf5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1839_c7_7cf5]
signal result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1839_c7_7cf5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1839_c7_7cf5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1840_c3_24d3]
signal BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1844_c11_7fc4]
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1844_c7_9398]
signal n16_MUX_uxn_opcodes_h_l1844_c7_9398_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c7_9398_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l1844_c7_9398]
signal l16_MUX_uxn_opcodes_h_l1844_c7_9398_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1844_c7_9398_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1844_c7_9398]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1844_c7_9398]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1844_c7_9398]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1844_c7_9398]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1844_c7_9398]
signal result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1844_c7_9398]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1844_c7_9398]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1848_c11_b30e]
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1848_c7_4c1d]
signal n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l1848_c7_4c1d]
signal l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1848_c7_4c1d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1848_c7_4c1d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1848_c7_4c1d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1848_c7_4c1d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1848_c7_4c1d]
signal result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1848_c7_4c1d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1848_c7_4c1d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1854_c11_2aa9]
signal BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1854_c7_f9ff]
signal n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l1854_c7_f9ff]
signal l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1854_c7_f9ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1854_c7_f9ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1854_c7_f9ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1854_c7_f9ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1854_c7_f9ff]
signal result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1854_c7_f9ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1854_c7_f9ff]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1858_c11_daf7]
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1858_c7_ab3f]
signal n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l1858_c7_ab3f]
signal l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1858_c7_ab3f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1858_c7_ab3f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1858_c7_ab3f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1858_c7_ab3f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1858_c7_ab3f]
signal result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1858_c7_ab3f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1858_c7_ab3f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1859_c3_4a55]
signal BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1863_c11_dc34]
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1863_c7_e630]
signal l16_MUX_uxn_opcodes_h_l1863_c7_e630_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1863_c7_e630_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1863_c7_e630]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1863_c7_e630]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1863_c7_e630]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1863_c7_e630]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1863_c7_e630]
signal result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1863_c7_e630]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1863_c7_e630]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1867_c11_a2dd]
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1867_c7_e3fb]
signal l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1867_c7_e3fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1867_c7_e3fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1867_c7_e3fb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1867_c7_e3fb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1867_c7_e3fb]
signal result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1867_c7_e3fb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1867_c7_e3fb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_a647]
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1873_c7_00cd]
signal l16_MUX_uxn_opcodes_h_l1873_c7_00cd_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_00cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_00cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_00cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1873_c7_00cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1873_c7_00cd]
signal result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_00cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1873_c7_00cd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1877_c11_7cc7]
signal BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1877_c7_cd09]
signal l16_MUX_uxn_opcodes_h_l1877_c7_cd09_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1877_c7_cd09]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1877_c7_cd09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1877_c7_cd09]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1877_c7_cd09]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1877_c7_cd09]
signal result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1877_c7_cd09]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1877_c7_cd09]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1878_c3_456e]
signal BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1881_c32_91af]
signal BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1881_c32_326d]
signal BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1881_c32_c344]
signal MUX_uxn_opcodes_h_l1881_c32_c344_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1881_c32_c344_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1881_c32_c344_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1881_c32_c344_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1883_c11_786c]
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1883_c7_85c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1883_c7_85c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1883_c7_85c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1883_c7_85c2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1883_c7_85c2]
signal result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1889_c11_7bc1]
signal BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1889_c7_fece]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1889_c7_fece]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1889_c7_fece]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1889_c7_fece]
signal result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1892_c34_d77c]
signal CONST_SR_8_uxn_opcodes_h_l1892_c34_d77c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1892_c34_d77c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1894_c11_ea97]
signal BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1894_c7_6c53]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1894_c7_6c53]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1894_c7_6c53]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1894_c7_6c53]
signal result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1899_c11_6e62]
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1899_c7_a4c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1899_c7_a4c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1899_c7_a4c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1899_c7_a4c9]
signal result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1902_c34_4f60]
signal CONST_SR_8_uxn_opcodes_h_l1902_c34_4f60_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1902_c34_4f60_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1904_c11_30ee]
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1904_c7_2a02]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1904_c7_2a02]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1904_c7_2a02]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1904_c7_2a02]
signal result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1909_c11_3a0b]
signal BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1909_c7_5e19]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1909_c7_5e19]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1909_c7_5e19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1909_c7_5e19]
signal result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1912_c34_ee87]
signal CONST_SR_8_uxn_opcodes_h_l1912_c34_ee87_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1912_c34_ee87_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1914_c11_e7e8]
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1914_c7_a203]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1914_c7_a203]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1850_l1831_l1869_DUPLICATE_edd3
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1850_l1831_l1869_DUPLICATE_edd3_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1850_l1831_l1869_DUPLICATE_edd3_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_49dd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_read := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_sp_shift := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15
BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_left,
BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_right,
BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_return_output);

-- n16_MUX_uxn_opcodes_h_l1817_c2_5e84
n16_MUX_uxn_opcodes_h_l1817_c2_5e84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1817_c2_5e84_cond,
n16_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue,
n16_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse,
n16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output);

-- l16_MUX_uxn_opcodes_h_l1817_c2_5e84
l16_MUX_uxn_opcodes_h_l1817_c2_5e84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1817_c2_5e84_cond,
l16_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue,
l16_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse,
l16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output);

-- t16_MUX_uxn_opcodes_h_l1817_c2_5e84
t16_MUX_uxn_opcodes_h_l1817_c2_5e84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1817_c2_5e84_cond,
t16_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue,
t16_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse,
t16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84
result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84
result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_cond,
result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84
result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output);

-- printf_uxn_opcodes_h_l1818_c3_a79f_uxn_opcodes_h_l1818_c3_a79f
printf_uxn_opcodes_h_l1818_c3_a79f_uxn_opcodes_h_l1818_c3_a79f : entity work.printf_uxn_opcodes_h_l1818_c3_a79f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1818_c3_a79f_uxn_opcodes_h_l1818_c3_a79f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_left,
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_right,
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_return_output);

-- n16_MUX_uxn_opcodes_h_l1825_c7_7dd6
n16_MUX_uxn_opcodes_h_l1825_c7_7dd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond,
n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue,
n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse,
n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output);

-- l16_MUX_uxn_opcodes_h_l1825_c7_7dd6
l16_MUX_uxn_opcodes_h_l1825_c7_7dd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond,
l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue,
l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse,
l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output);

-- t16_MUX_uxn_opcodes_h_l1825_c7_7dd6
t16_MUX_uxn_opcodes_h_l1825_c7_7dd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond,
t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue,
t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse,
t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6
result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6
result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6
result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_left,
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_right,
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_return_output);

-- n16_MUX_uxn_opcodes_h_l1829_c7_e0a7
n16_MUX_uxn_opcodes_h_l1829_c7_e0a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond,
n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue,
n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse,
n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output);

-- l16_MUX_uxn_opcodes_h_l1829_c7_e0a7
l16_MUX_uxn_opcodes_h_l1829_c7_e0a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond,
l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue,
l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse,
l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output);

-- t16_MUX_uxn_opcodes_h_l1829_c7_e0a7
t16_MUX_uxn_opcodes_h_l1829_c7_e0a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond,
t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue,
t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse,
t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7
result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7
result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_left,
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_right,
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_return_output);

-- n16_MUX_uxn_opcodes_h_l1835_c7_b0cd
n16_MUX_uxn_opcodes_h_l1835_c7_b0cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond,
n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue,
n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse,
n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output);

-- l16_MUX_uxn_opcodes_h_l1835_c7_b0cd
l16_MUX_uxn_opcodes_h_l1835_c7_b0cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond,
l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue,
l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse,
l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output);

-- t16_MUX_uxn_opcodes_h_l1835_c7_b0cd
t16_MUX_uxn_opcodes_h_l1835_c7_b0cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond,
t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue,
t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse,
t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd
result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd
result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd
result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4
BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_left,
BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_right,
BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_return_output);

-- n16_MUX_uxn_opcodes_h_l1839_c7_7cf5
n16_MUX_uxn_opcodes_h_l1839_c7_7cf5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond,
n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue,
n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse,
n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output);

-- l16_MUX_uxn_opcodes_h_l1839_c7_7cf5
l16_MUX_uxn_opcodes_h_l1839_c7_7cf5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond,
l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue,
l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse,
l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output);

-- t16_MUX_uxn_opcodes_h_l1839_c7_7cf5
t16_MUX_uxn_opcodes_h_l1839_c7_7cf5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond,
t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue,
t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse,
t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5
result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5
result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5
result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5
result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5
result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3
BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3_left,
BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3_right,
BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4
BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_left,
BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_right,
BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_return_output);

-- n16_MUX_uxn_opcodes_h_l1844_c7_9398
n16_MUX_uxn_opcodes_h_l1844_c7_9398 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1844_c7_9398_cond,
n16_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue,
n16_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse,
n16_MUX_uxn_opcodes_h_l1844_c7_9398_return_output);

-- l16_MUX_uxn_opcodes_h_l1844_c7_9398
l16_MUX_uxn_opcodes_h_l1844_c7_9398 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1844_c7_9398_cond,
l16_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue,
l16_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse,
l16_MUX_uxn_opcodes_h_l1844_c7_9398_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398
result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398
result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_cond,
result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398
result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_left,
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_right,
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_return_output);

-- n16_MUX_uxn_opcodes_h_l1848_c7_4c1d
n16_MUX_uxn_opcodes_h_l1848_c7_4c1d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond,
n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue,
n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse,
n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output);

-- l16_MUX_uxn_opcodes_h_l1848_c7_4c1d
l16_MUX_uxn_opcodes_h_l1848_c7_4c1d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond,
l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue,
l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse,
l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d
result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d
result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d
result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9
BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_left,
BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_right,
BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_return_output);

-- n16_MUX_uxn_opcodes_h_l1854_c7_f9ff
n16_MUX_uxn_opcodes_h_l1854_c7_f9ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond,
n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue,
n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse,
n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output);

-- l16_MUX_uxn_opcodes_h_l1854_c7_f9ff
l16_MUX_uxn_opcodes_h_l1854_c7_f9ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond,
l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue,
l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse,
l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff
result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff
result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff
result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff
result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond,
result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff
result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_left,
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_right,
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_return_output);

-- n16_MUX_uxn_opcodes_h_l1858_c7_ab3f
n16_MUX_uxn_opcodes_h_l1858_c7_ab3f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond,
n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue,
n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse,
n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output);

-- l16_MUX_uxn_opcodes_h_l1858_c7_ab3f
l16_MUX_uxn_opcodes_h_l1858_c7_ab3f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond,
l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue,
l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse,
l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f
result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f
result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f
result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55
BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55_left,
BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55_right,
BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_left,
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_right,
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_return_output);

-- l16_MUX_uxn_opcodes_h_l1863_c7_e630
l16_MUX_uxn_opcodes_h_l1863_c7_e630 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1863_c7_e630_cond,
l16_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue,
l16_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse,
l16_MUX_uxn_opcodes_h_l1863_c7_e630_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630
result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_cond,
result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630
result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_left,
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_right,
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_return_output);

-- l16_MUX_uxn_opcodes_h_l1867_c7_e3fb
l16_MUX_uxn_opcodes_h_l1867_c7_e3fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond,
l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue,
l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse,
l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb
result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb
result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_left,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_right,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_return_output);

-- l16_MUX_uxn_opcodes_h_l1873_c7_00cd
l16_MUX_uxn_opcodes_h_l1873_c7_00cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1873_c7_00cd_cond,
l16_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue,
l16_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse,
l16_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd
result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd
result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_left,
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_right,
BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_return_output);

-- l16_MUX_uxn_opcodes_h_l1877_c7_cd09
l16_MUX_uxn_opcodes_h_l1877_c7_cd09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1877_c7_cd09_cond,
l16_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue,
l16_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse,
l16_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09
result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09
result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_cond,
result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09
result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e
BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e_left,
BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e_right,
BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af
BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af_left,
BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af_right,
BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d
BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d_left,
BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d_right,
BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d_return_output);

-- MUX_uxn_opcodes_h_l1881_c32_c344
MUX_uxn_opcodes_h_l1881_c32_c344 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1881_c32_c344_cond,
MUX_uxn_opcodes_h_l1881_c32_c344_iftrue,
MUX_uxn_opcodes_h_l1881_c32_c344_iffalse,
MUX_uxn_opcodes_h_l1881_c32_c344_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_left,
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_right,
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2
result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2
result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_left,
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_right,
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece
result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece
result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_cond,
result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1892_c34_d77c
CONST_SR_8_uxn_opcodes_h_l1892_c34_d77c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1892_c34_d77c_x,
CONST_SR_8_uxn_opcodes_h_l1892_c34_d77c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_left,
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_right,
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53
result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_cond,
result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_left,
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_right,
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9
result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1902_c34_4f60
CONST_SR_8_uxn_opcodes_h_l1902_c34_4f60 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1902_c34_4f60_x,
CONST_SR_8_uxn_opcodes_h_l1902_c34_4f60_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_left,
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_right,
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02
result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_cond,
result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b
BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_left,
BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_right,
BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19
result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19
result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19
result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_cond,
result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1912_c34_ee87
CONST_SR_8_uxn_opcodes_h_l1912_c34_ee87 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1912_c34_ee87_x,
CONST_SR_8_uxn_opcodes_h_l1912_c34_ee87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8_left,
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8_right,
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1850_l1831_l1869_DUPLICATE_edd3
CONST_SL_8_uint16_t_uxn_opcodes_h_l1850_l1831_l1869_DUPLICATE_edd3 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1850_l1831_l1869_DUPLICATE_edd3_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1850_l1831_l1869_DUPLICATE_edd3_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 l16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_return_output,
 n16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output,
 l16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output,
 t16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_return_output,
 n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output,
 l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output,
 t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_return_output,
 n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output,
 l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output,
 t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_return_output,
 n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output,
 l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output,
 t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_return_output,
 n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output,
 l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output,
 t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_return_output,
 n16_MUX_uxn_opcodes_h_l1844_c7_9398_return_output,
 l16_MUX_uxn_opcodes_h_l1844_c7_9398_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_return_output,
 n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output,
 l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_return_output,
 n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output,
 l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_return_output,
 n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output,
 l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_return_output,
 l16_MUX_uxn_opcodes_h_l1863_c7_e630_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_return_output,
 l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_return_output,
 l16_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_return_output,
 l16_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d_return_output,
 MUX_uxn_opcodes_h_l1881_c32_c344_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_return_output,
 CONST_SR_8_uxn_opcodes_h_l1892_c34_d77c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output,
 CONST_SR_8_uxn_opcodes_h_l1902_c34_4f60_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output,
 CONST_SR_8_uxn_opcodes_h_l1912_c34_ee87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1850_l1831_l1869_DUPLICATE_edd3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1821_c3_4344 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1818_c3_a79f_uxn_opcodes_h_l1818_c3_a79f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1827_c3_3354 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1833_c3_88ad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1837_c3_0724 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c7_9398_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1844_c7_9398_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1842_c3_ca31 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c7_9398_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1844_c7_9398_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1846_c3_8877 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1852_c3_ddb4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1856_c3_3cbc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1863_c7_e630_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1861_c3_66d8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1863_c7_e630_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1865_c3_318e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_677c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1875_c3_911e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1877_c7_cd09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1877_c7_cd09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1881_c32_c344_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1881_c32_c344_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1881_c32_c344_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1881_c32_c344_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_c5c8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1887_c24_6e20_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1891_c3_15c5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1892_c34_d77c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1892_c34_d77c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1892_c24_3c51_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1896_c3_7d2b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1897_c24_676c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_107d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1902_c34_4f60_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1902_c34_4f60_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1902_c24_aca2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1906_c3_2bbb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1907_c24_8321_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1911_c3_e693 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1912_c34_ee87_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1912_c34_ee87_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1912_c24_7082_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_ec87_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_36b8_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_4df9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_8ec6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1840_l1859_l1830_l1868_l1878_l1849_DUPLICATE_4f8e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1850_l1831_l1869_DUPLICATE_edd3_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1850_l1831_l1869_DUPLICATE_edd3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1877_l1909_DUPLICATE_8bf1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1919_l1813_DUPLICATE_79e9_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_l16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_l16 := l16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_677c := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_677c;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1833_c3_88ad := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1833_c3_88ad;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_c5c8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_c5c8;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_right := to_unsigned(15, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1842_c3_ca31 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1842_c3_ca31;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1837_c3_0724 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1837_c3_0724;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1865_c3_318e := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1865_c3_318e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1891_c3_15c5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1891_c3_15c5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1911_c3_e693 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1911_c3_e693;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_right := to_unsigned(17, 5);
     VAR_MUX_uxn_opcodes_h_l1881_c32_c344_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1875_c3_911e := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1875_c3_911e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_right := to_unsigned(11, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1852_c3_ddb4 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1852_c3_ddb4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8_right := to_unsigned(19, 5);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1821_c3_4344 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1821_c3_4344;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1861_c3_66d8 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1861_c3_66d8;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1827_c3_3354 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1827_c3_3354;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_107d := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_107d;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1906_c3_2bbb := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1906_c3_2bbb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_right := to_unsigned(14, 4);
     VAR_MUX_uxn_opcodes_h_l1881_c32_c344_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_right := to_unsigned(16, 5);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1846_c3_8877 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1846_c3_8877;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1856_c3_3cbc := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1856_c3_3cbc;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1896_c3_7d2b := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1896_c3_7d2b;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_right := to_unsigned(3, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1892_c34_d77c_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1912_c34_ee87_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1902_c34_4f60_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1854_c11_2aa9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_4df9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_4df9_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1839_c11_cdc4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1835_c11_03e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1914_c11_e7e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1877_c11_7cc7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1840_l1859_l1830_l1868_l1878_l1849_DUPLICATE_4f8e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1840_l1859_l1830_l1868_l1878_l1849_DUPLICATE_4f8e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1848_c11_b30e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1892_c34_d77c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1892_c34_d77c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1892_c34_d77c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1892_c34_d77c_return_output := CONST_SR_8_uxn_opcodes_h_l1892_c34_d77c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1877_l1909_DUPLICATE_8bf1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1877_l1909_DUPLICATE_8bf1_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1883_c11_786c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_ec87 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_ec87_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1817_c6_9e15] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_left;
     BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_return_output := BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1889_c11_7bc1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1887_c24_6e20] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1887_c24_6e20_return_output := CAST_TO_uint8_t_uint16_t(
     l16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1899_c11_6e62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_left;
     BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_return_output := BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1897_c24_676c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1897_c24_676c_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_SR_8[uxn_opcodes_h_l1902_c34_4f60] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1902_c34_4f60_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1902_c34_4f60_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1902_c34_4f60_return_output := CONST_SR_8_uxn_opcodes_h_l1902_c34_4f60_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1904_c11_30ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_36b8 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_36b8_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1844_c11_7fc4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_a647] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_left;
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_return_output := BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1912_c34_ee87] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1912_c34_ee87_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1912_c34_ee87_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1912_c34_ee87_return_output := CONST_SR_8_uxn_opcodes_h_l1912_c34_ee87_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1907_c24_8321] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1907_c24_8321_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1877_c7_cd09] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1877_c7_cd09_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1858_c11_daf7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1881_c32_91af] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af_left;
     BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af_return_output := BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1817_c2_5e84] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1817_c2_5e84_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1825_c11_8c2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1909_c11_3a0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1894_c11_ea97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_left;
     BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_return_output := BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1863_c11_dc34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_left;
     BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_return_output := BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1867_c11_a2dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1829_c11_8abd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_8ec6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_8ec6_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1881_c32_91af_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1817_c2_5e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1817_c2_5e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1817_c2_5e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c6_9e15_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_8c2f_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_8abd_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_03e1_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1839_c11_cdc4_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1844_c7_9398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1844_c7_9398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c11_7fc4_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_b30e_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_2aa9_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_daf7_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1863_c7_e630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_dc34_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_a2dd_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_a647_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1877_c7_cd09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1877_c11_7cc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_786c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_7bc1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_ea97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_6e62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_30ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_3a0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_e7e8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1840_l1859_l1830_l1868_l1878_l1849_DUPLICATE_4f8e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1840_l1859_l1830_l1868_l1878_l1849_DUPLICATE_4f8e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1840_l1859_l1830_l1868_l1878_l1849_DUPLICATE_4f8e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1850_l1831_l1869_DUPLICATE_edd3_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1840_l1859_l1830_l1868_l1878_l1849_DUPLICATE_4f8e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1887_c24_6e20_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1897_c24_676c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1907_c24_8321_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_36b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_36b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_36b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_36b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_36b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_36b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_36b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_36b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_36b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_36b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_36b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_36b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_36b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1825_l1914_l1909_l1904_l1899_l1894_l1889_l1883_l1877_l1873_l1867_l1863_l1858_l1854_l1848_l1844_l1839_l1835_l1829_DUPLICATE_29c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_4df9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_4df9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_4df9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_4df9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_4df9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_4df9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_4df9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_4df9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_4df9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_4df9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_4df9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_4df9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1854_l1825_l1883_l1848_l1817_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_4df9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_8ec6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_8ec6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_8ec6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_8ec6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_8ec6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_8ec6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_8ec6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_8ec6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_8ec6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_8ec6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_8ec6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_8ec6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1854_l1825_l1914_l1848_l1877_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_8ec6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1877_l1909_DUPLICATE_8bf1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1877_l1909_DUPLICATE_8bf1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_ec87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_ec87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_ec87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_ec87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_ec87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_ec87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_ec87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_ec87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_ec87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_ec87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_ec87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_ec87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_ec87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1854_l1825_l1848_l1817_l1877_l1909_l1844_l1873_l1839_l1867_l1835_l1863_l1829_l1858_DUPLICATE_ec87_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1817_c2_5e84_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1877_c7_cd09_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l1881_c32_326d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d_left;
     BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d_return_output := BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1850_l1831_l1869_DUPLICATE_edd3 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1850_l1831_l1869_DUPLICATE_edd3_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1850_l1831_l1869_DUPLICATE_edd3_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1850_l1831_l1869_DUPLICATE_edd3_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1850_l1831_l1869_DUPLICATE_edd3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1817_c1_e123] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1877_c7_cd09] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1909_c7_5e19] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1840_c3_24d3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3_left;
     BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3_return_output := BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1902_c24_aca2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1902_c24_aca2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1902_c34_4f60_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1914_c7_a203] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1912_c24_7082] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1912_c24_7082_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1912_c34_ee87_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1859_c3_4a55] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55_left;
     BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55_return_output := BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1883_c7_85c2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1817_c2_5e84] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1914_c7_a203] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1892_c24_3c51] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1892_c24_3c51_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1892_c34_d77c_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1878_c3_456e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e_left;
     BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e_return_output := BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1881_c32_c344_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1881_c32_326d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1840_c3_24d3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1859_c3_4a55_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1878_c3_456e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1892_c24_3c51_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1902_c24_aca2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1912_c24_7082_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1850_l1831_l1869_DUPLICATE_edd3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1850_l1831_l1869_DUPLICATE_edd3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1850_l1831_l1869_DUPLICATE_edd3_return_output;
     VAR_printf_uxn_opcodes_h_l1818_c3_a79f_uxn_opcodes_h_l1818_c3_a79f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1817_c1_e123_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_a203_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_a203_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1909_c7_5e19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1909_c7_5e19] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output := result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output;

     -- n16_MUX[uxn_opcodes_h_l1858_c7_ab3f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond;
     n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue;
     n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output := n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output;

     -- MUX[uxn_opcodes_h_l1881_c32_c344] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1881_c32_c344_cond <= VAR_MUX_uxn_opcodes_h_l1881_c32_c344_cond;
     MUX_uxn_opcodes_h_l1881_c32_c344_iftrue <= VAR_MUX_uxn_opcodes_h_l1881_c32_c344_iftrue;
     MUX_uxn_opcodes_h_l1881_c32_c344_iffalse <= VAR_MUX_uxn_opcodes_h_l1881_c32_c344_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1881_c32_c344_return_output := MUX_uxn_opcodes_h_l1881_c32_c344_return_output;

     -- l16_MUX[uxn_opcodes_h_l1877_c7_cd09] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1877_c7_cd09_cond <= VAR_l16_MUX_uxn_opcodes_h_l1877_c7_cd09_cond;
     l16_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue;
     l16_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output := l16_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output;

     -- t16_MUX[uxn_opcodes_h_l1839_c7_7cf5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond;
     t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue;
     t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output := t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output;

     -- printf_uxn_opcodes_h_l1818_c3_a79f[uxn_opcodes_h_l1818_c3_a79f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1818_c3_a79f_uxn_opcodes_h_l1818_c3_a79f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1818_c3_a79f_uxn_opcodes_h_l1818_c3_a79f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1909_c7_5e19] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1873_c7_00cd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1877_c7_cd09] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1904_c7_2a02] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue := VAR_MUX_uxn_opcodes_h_l1881_c32_c344_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1909_c7_5e19_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output;
     -- n16_MUX[uxn_opcodes_h_l1854_c7_f9ff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond <= VAR_n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond;
     n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue;
     n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output := n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1904_c7_2a02] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1873_c7_00cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output;

     -- t16_MUX[uxn_opcodes_h_l1835_c7_b0cd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond;
     t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue;
     t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output := t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1904_c7_2a02] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output := result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1899_c7_a4c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output;

     -- l16_MUX[uxn_opcodes_h_l1873_c7_00cd] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1873_c7_00cd_cond <= VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00cd_cond;
     l16_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue;
     l16_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output := l16_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1867_c7_e3fb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1877_c7_cd09] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1904_c7_2a02] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1904_c7_2a02_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1899_c7_a4c9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output;

     -- l16_MUX[uxn_opcodes_h_l1867_c7_e3fb] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond <= VAR_l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond;
     l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue;
     l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output := l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1867_c7_e3fb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1863_c7_e630] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1899_c7_a4c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_00cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1894_c7_6c53] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output;

     -- t16_MUX[uxn_opcodes_h_l1829_c7_e0a7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond;
     t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue;
     t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output := t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1899_c7_a4c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1848_c7_4c1d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond;
     n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue;
     n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output := n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1863_c7_e630_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_a4c9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output;
     -- n16_MUX[uxn_opcodes_h_l1844_c7_9398] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1844_c7_9398_cond <= VAR_n16_MUX_uxn_opcodes_h_l1844_c7_9398_cond;
     n16_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue;
     n16_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1844_c7_9398_return_output := n16_MUX_uxn_opcodes_h_l1844_c7_9398_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1889_c7_fece] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1894_c7_6c53] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output := result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1894_c7_6c53] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1863_c7_e630] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_return_output;

     -- t16_MUX[uxn_opcodes_h_l1825_c7_7dd6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond;
     t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue;
     t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output := t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1867_c7_e3fb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output;

     -- l16_MUX[uxn_opcodes_h_l1863_c7_e630] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1863_c7_e630_cond <= VAR_l16_MUX_uxn_opcodes_h_l1863_c7_e630_cond;
     l16_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue;
     l16_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1863_c7_e630_return_output := l16_MUX_uxn_opcodes_h_l1863_c7_e630_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1858_c7_ab3f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1894_c7_6c53] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1863_c7_e630_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1844_c7_9398_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_e630_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_fece_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1894_c7_6c53_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1883_c7_85c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1817_c2_5e84] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1817_c2_5e84_cond <= VAR_t16_MUX_uxn_opcodes_h_l1817_c2_5e84_cond;
     t16_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue;
     t16_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output := t16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1863_c7_e630] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_return_output;

     -- l16_MUX[uxn_opcodes_h_l1858_c7_ab3f] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond <= VAR_l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond;
     l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue;
     l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output := l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1854_c7_f9ff] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1889_c7_fece] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_return_output := result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1889_c7_fece] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_return_output;

     -- n16_MUX[uxn_opcodes_h_l1839_c7_7cf5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond;
     n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue;
     n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output := n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1858_c7_ab3f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1889_c7_fece] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_fece_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_fece_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_e630_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_fece_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1883_c7_85c2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1858_c7_ab3f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1877_c7_cd09] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1883_c7_85c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1883_c7_85c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1835_c7_b0cd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond;
     n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue;
     n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output := n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1854_c7_f9ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1848_c7_4c1d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output;

     -- l16_MUX[uxn_opcodes_h_l1854_c7_f9ff] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond <= VAR_l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond;
     l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue;
     l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output := l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1883_c7_85c2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_00cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1844_c7_9398] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1848_c7_4c1d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output;

     -- l16_MUX[uxn_opcodes_h_l1848_c7_4c1d] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond <= VAR_l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond;
     l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue;
     l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output := l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1829_c7_e0a7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond;
     n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue;
     n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output := n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1877_c7_cd09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1877_c7_cd09] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output := result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1854_c7_f9ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1877_c7_cd09] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1844_c7_9398_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1877_c7_cd09_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1839_c7_7cf5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_00cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1848_c7_4c1d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1844_c7_9398] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1873_c7_00cd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1825_c7_7dd6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond;
     n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue;
     n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output := n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output;

     -- l16_MUX[uxn_opcodes_h_l1844_c7_9398] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1844_c7_9398_cond <= VAR_l16_MUX_uxn_opcodes_h_l1844_c7_9398_cond;
     l16_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue;
     l16_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1844_c7_9398_return_output := l16_MUX_uxn_opcodes_h_l1844_c7_9398_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_00cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1867_c7_e3fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output;

     -- Submodule level 10
     VAR_l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1844_c7_9398_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1844_c7_9398_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00cd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1844_c7_9398] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1867_c7_e3fb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1835_c7_b0cd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output;

     -- l16_MUX[uxn_opcodes_h_l1839_c7_7cf5] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond <= VAR_l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond;
     l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue;
     l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output := l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1863_c7_e630] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_return_output;

     -- n16_MUX[uxn_opcodes_h_l1817_c2_5e84] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1817_c2_5e84_cond <= VAR_n16_MUX_uxn_opcodes_h_l1817_c2_5e84_cond;
     n16_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue;
     n16_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output := n16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1839_c7_7cf5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1867_c7_e3fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1867_c7_e3fb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output;

     -- Submodule level 11
     VAR_l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c7_9398_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_e630_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c7_e3fb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1839_c7_7cf5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1835_c7_b0cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1829_c7_e0a7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1863_c7_e630] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_return_output := result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_return_output;

     -- l16_MUX[uxn_opcodes_h_l1835_c7_b0cd] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond <= VAR_l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond;
     l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue;
     l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output := l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1863_c7_e630] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1858_c7_ab3f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1863_c7_e630] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_return_output;

     -- Submodule level 12
     VAR_l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_e630_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_e630_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_e630_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1858_c7_ab3f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1858_c7_ab3f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1858_c7_ab3f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1835_c7_b0cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1829_c7_e0a7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1854_c7_f9ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1825_c7_7dd6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output;

     -- l16_MUX[uxn_opcodes_h_l1829_c7_e0a7] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond <= VAR_l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond;
     l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue;
     l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output := l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output;

     -- Submodule level 13
     VAR_l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1858_c7_ab3f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1854_c7_f9ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1854_c7_f9ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1848_c7_4c1d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output;

     -- l16_MUX[uxn_opcodes_h_l1825_c7_7dd6] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond <= VAR_l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond;
     l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue;
     l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output := l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1825_c7_7dd6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1854_c7_f9ff] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output := result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1817_c2_5e84] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1829_c7_e0a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output;

     -- Submodule level 14
     VAR_l16_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_f9ff_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1848_c7_4c1d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1844_c7_9398] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1817_c2_5e84] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output;

     -- l16_MUX[uxn_opcodes_h_l1817_c2_5e84] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1817_c2_5e84_cond <= VAR_l16_MUX_uxn_opcodes_h_l1817_c2_5e84_cond;
     l16_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue;
     l16_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output := l16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1825_c7_7dd6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1848_c7_4c1d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1848_c7_4c1d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output;

     -- Submodule level 15
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c7_9398_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_4c1d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1844_c7_9398] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_return_output := result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1844_c7_9398] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1839_c7_7cf5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1817_c2_5e84] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1844_c7_9398] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c7_9398_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c7_9398_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1844_c7_9398_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1839_c7_7cf5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1835_c7_b0cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1839_c7_7cf5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1839_c7_7cf5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output;

     -- Submodule level 17
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1839_c7_7cf5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1835_c7_b0cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1835_c7_b0cd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1829_c7_e0a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1835_c7_b0cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output;

     -- Submodule level 18
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_b0cd_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1829_c7_e0a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1825_c7_7dd6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1829_c7_e0a7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1829_c7_e0a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output;

     -- Submodule level 19
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_e0a7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1825_c7_7dd6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1825_c7_7dd6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1825_c7_7dd6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1817_c2_5e84] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output;

     -- Submodule level 20
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1825_c7_7dd6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1817_c2_5e84] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output := result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1817_c2_5e84] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1817_c2_5e84] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output;

     -- Submodule level 21
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1919_l1813_DUPLICATE_79e9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1919_l1813_DUPLICATE_79e9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_49dd(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c2_5e84_return_output);

     -- Submodule level 22
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1919_l1813_DUPLICATE_79e9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1919_l1813_DUPLICATE_79e9_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_l16 <= REG_VAR_l16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     l16 <= REG_COMB_l16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
