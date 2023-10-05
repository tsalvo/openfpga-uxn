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
entity mul_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul_0CLK_fd2391e7;
architecture arch of mul_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1813_c6_a84b]
signal BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1813_c1_a36d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1813_c2_4148]
signal n8_MUX_uxn_opcodes_h_l1813_c2_4148_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1813_c2_4148_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1813_c2_4148]
signal t8_MUX_uxn_opcodes_h_l1813_c2_4148_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1813_c2_4148_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1813_c2_4148]
signal result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1813_c2_4148]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1813_c2_4148]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1813_c2_4148]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1813_c2_4148]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1813_c2_4148]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1813_c2_4148]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1814_c3_4dde[uxn_opcodes_h_l1814_c3_4dde]
signal printf_uxn_opcodes_h_l1814_c3_4dde_uxn_opcodes_h_l1814_c3_4dde_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1819_c11_75b5]
signal BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1819_c7_25bf]
signal n8_MUX_uxn_opcodes_h_l1819_c7_25bf_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1819_c7_25bf]
signal t8_MUX_uxn_opcodes_h_l1819_c7_25bf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1819_c7_25bf]
signal result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1819_c7_25bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1819_c7_25bf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1819_c7_25bf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1819_c7_25bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1819_c7_25bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1819_c7_25bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1822_c11_25bd]
signal BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1822_c7_6476]
signal n8_MUX_uxn_opcodes_h_l1822_c7_6476_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1822_c7_6476_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1822_c7_6476]
signal t8_MUX_uxn_opcodes_h_l1822_c7_6476_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1822_c7_6476_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1822_c7_6476]
signal result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1822_c7_6476]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1822_c7_6476]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1822_c7_6476]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1822_c7_6476]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1822_c7_6476]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1822_c7_6476]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1826_c11_a177]
signal BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1826_c7_6998]
signal n8_MUX_uxn_opcodes_h_l1826_c7_6998_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1826_c7_6998_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1826_c7_6998]
signal result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1826_c7_6998]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1826_c7_6998]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1826_c7_6998]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1826_c7_6998]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1826_c7_6998]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1826_c7_6998]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1829_c11_6244]
signal BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1829_c7_d212]
signal n8_MUX_uxn_opcodes_h_l1829_c7_d212_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1829_c7_d212_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1829_c7_d212]
signal result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1829_c7_d212]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1829_c7_d212]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1829_c7_d212]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1829_c7_d212]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1829_c7_d212]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1829_c7_d212]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1833_c32_bd3e]
signal BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1833_c32_f4b1]
signal BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1833_c32_8f0c]
signal MUX_uxn_opcodes_h_l1833_c32_8f0c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1833_c32_8f0c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1833_c32_8f0c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1833_c32_8f0c_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1835_c11_0795]
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1835_c7_2ba5]
signal result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1835_c7_2ba5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1835_c7_2ba5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1835_c7_2ba5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1835_c7_2ba5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output : unsigned(0 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1839_c24_7489]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489_left : unsigned(7 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489_right : unsigned(7 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1841_c11_d760]
signal BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1841_c7_a7ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1841_c7_a7ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b
BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_left,
BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_right,
BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_return_output);

-- n8_MUX_uxn_opcodes_h_l1813_c2_4148
n8_MUX_uxn_opcodes_h_l1813_c2_4148 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1813_c2_4148_cond,
n8_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue,
n8_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse,
n8_MUX_uxn_opcodes_h_l1813_c2_4148_return_output);

-- t8_MUX_uxn_opcodes_h_l1813_c2_4148
t8_MUX_uxn_opcodes_h_l1813_c2_4148 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1813_c2_4148_cond,
t8_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue,
t8_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse,
t8_MUX_uxn_opcodes_h_l1813_c2_4148_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148
result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_cond,
result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148
result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148
result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148
result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148
result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148
result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_return_output);

-- printf_uxn_opcodes_h_l1814_c3_4dde_uxn_opcodes_h_l1814_c3_4dde
printf_uxn_opcodes_h_l1814_c3_4dde_uxn_opcodes_h_l1814_c3_4dde : entity work.printf_uxn_opcodes_h_l1814_c3_4dde_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1814_c3_4dde_uxn_opcodes_h_l1814_c3_4dde_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5
BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_left,
BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_right,
BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_return_output);

-- n8_MUX_uxn_opcodes_h_l1819_c7_25bf
n8_MUX_uxn_opcodes_h_l1819_c7_25bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1819_c7_25bf_cond,
n8_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue,
n8_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse,
n8_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output);

-- t8_MUX_uxn_opcodes_h_l1819_c7_25bf
t8_MUX_uxn_opcodes_h_l1819_c7_25bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1819_c7_25bf_cond,
t8_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue,
t8_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse,
t8_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf
result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_cond,
result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf
result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf
result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf
result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf
result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd
BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_left,
BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_right,
BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_return_output);

-- n8_MUX_uxn_opcodes_h_l1822_c7_6476
n8_MUX_uxn_opcodes_h_l1822_c7_6476 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1822_c7_6476_cond,
n8_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue,
n8_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse,
n8_MUX_uxn_opcodes_h_l1822_c7_6476_return_output);

-- t8_MUX_uxn_opcodes_h_l1822_c7_6476
t8_MUX_uxn_opcodes_h_l1822_c7_6476 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1822_c7_6476_cond,
t8_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue,
t8_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse,
t8_MUX_uxn_opcodes_h_l1822_c7_6476_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476
result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_cond,
result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476
result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476
result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476
result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476
result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476
result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177
BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_left,
BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_right,
BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_return_output);

-- n8_MUX_uxn_opcodes_h_l1826_c7_6998
n8_MUX_uxn_opcodes_h_l1826_c7_6998 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1826_c7_6998_cond,
n8_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue,
n8_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse,
n8_MUX_uxn_opcodes_h_l1826_c7_6998_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998
result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_cond,
result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998
result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998
result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998
result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998
result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998
result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_left,
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_right,
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_return_output);

-- n8_MUX_uxn_opcodes_h_l1829_c7_d212
n8_MUX_uxn_opcodes_h_l1829_c7_d212 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1829_c7_d212_cond,
n8_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue,
n8_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse,
n8_MUX_uxn_opcodes_h_l1829_c7_d212_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212
result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_cond,
result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212
result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e
BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e_left,
BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e_right,
BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1
BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1_left,
BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1_right,
BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1_return_output);

-- MUX_uxn_opcodes_h_l1833_c32_8f0c
MUX_uxn_opcodes_h_l1833_c32_8f0c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1833_c32_8f0c_cond,
MUX_uxn_opcodes_h_l1833_c32_8f0c_iftrue,
MUX_uxn_opcodes_h_l1833_c32_8f0c_iffalse,
MUX_uxn_opcodes_h_l1833_c32_8f0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_left,
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_right,
BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5
result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5
result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489 : entity work.BIN_OP_INFERRED_MULT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760
BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760_left,
BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760_right,
BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef
result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef
result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_return_output,
 n8_MUX_uxn_opcodes_h_l1813_c2_4148_return_output,
 t8_MUX_uxn_opcodes_h_l1813_c2_4148_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_return_output,
 n8_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output,
 t8_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_return_output,
 n8_MUX_uxn_opcodes_h_l1822_c7_6476_return_output,
 t8_MUX_uxn_opcodes_h_l1822_c7_6476_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_return_output,
 n8_MUX_uxn_opcodes_h_l1826_c7_6998_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_return_output,
 n8_MUX_uxn_opcodes_h_l1829_c7_d212_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1_return_output,
 MUX_uxn_opcodes_h_l1833_c32_8f0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1813_c2_4148_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1813_c2_4148_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1813_c2_4148_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1813_c2_4148_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1816_c3_4fb8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1814_c3_4dde_uxn_opcodes_h_l1814_c3_4dde_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1822_c7_6476_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1819_c7_25bf_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1822_c7_6476_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1819_c7_25bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1820_c3_b837 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1826_c7_6998_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1822_c7_6476_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1822_c7_6476_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1824_c3_812a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1829_c7_d212_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1826_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1827_c3_9ded : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1829_c7_d212_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1833_c32_8f0c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1833_c32_8f0c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1833_c32_8f0c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1833_c32_8f0c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l1839_c3_c437 : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1838_c3_ae59 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1813_l1835_l1829_l1826_l1822_l1819_DUPLICATE_e5a7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1813_l1835_l1826_l1822_l1819_DUPLICATE_d8bd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1813_l1829_l1826_l1822_l1819_DUPLICATE_92e8_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1813_l1841_l1829_l1826_l1822_l1819_DUPLICATE_e499_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1822_l1826_l1819_l1829_DUPLICATE_c85f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1841_l1835_l1829_l1826_l1822_l1819_DUPLICATE_0ba0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1835_l1829_DUPLICATE_7991_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1846_l1809_DUPLICATE_7c56_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1838_c3_ae59 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1838_c3_ae59;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l1833_c32_8f0c_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1824_c3_812a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1824_c3_812a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1816_c3_4fb8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1816_c3_4fb8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1827_c3_9ded := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1827_c3_9ded;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1820_c3_b837 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1820_c3_b837;
     VAR_MUX_uxn_opcodes_h_l1833_c32_8f0c_iffalse := resize(to_signed(-1, 2), 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e_left := VAR_ins;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1813_l1835_l1826_l1822_l1819_DUPLICATE_d8bd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1813_l1835_l1826_l1822_l1819_DUPLICATE_d8bd_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1813_l1841_l1829_l1826_l1822_l1819_DUPLICATE_e499 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1813_l1841_l1829_l1826_l1822_l1819_DUPLICATE_e499_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1841_l1835_l1829_l1826_l1822_l1819_DUPLICATE_0ba0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1841_l1835_l1829_l1826_l1822_l1819_DUPLICATE_0ba0_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1826_c11_a177] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_left;
     BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_return_output := BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1833_c32_bd3e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e_left;
     BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e_return_output := BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1841_c11_d760] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760_left;
     BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760_return_output := BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1813_l1835_l1829_l1826_l1822_l1819_DUPLICATE_e5a7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1813_l1835_l1829_l1826_l1822_l1819_DUPLICATE_e5a7_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1822_c11_25bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1819_c11_75b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1822_l1826_l1819_l1829_DUPLICATE_c85f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1822_l1826_l1819_l1829_DUPLICATE_c85f_return_output := result.is_stack_read;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1839_c24_7489] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1813_c6_a84b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1813_l1829_l1826_l1822_l1819_DUPLICATE_92e8 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1813_l1829_l1826_l1822_l1819_DUPLICATE_92e8_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1829_c11_6244] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_left;
     BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_return_output := BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1835_c11_0795] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_left;
     BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_return_output := BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1835_l1829_DUPLICATE_7991 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1835_l1829_DUPLICATE_7991_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1833_c32_bd3e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1813_c2_4148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1813_c2_4148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_a84b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1819_c7_25bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1819_c7_25bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1819_c11_75b5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1822_c7_6476_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1822_c7_6476_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1822_c11_25bd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1826_c7_6998_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_a177_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1829_c7_d212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_6244_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1835_c11_0795_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_d760_return_output;
     VAR_result_stack_value_uxn_opcodes_h_l1839_c3_c437 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1839_c24_7489_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1813_l1829_l1826_l1822_l1819_DUPLICATE_92e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1813_l1829_l1826_l1822_l1819_DUPLICATE_92e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1813_l1829_l1826_l1822_l1819_DUPLICATE_92e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1813_l1829_l1826_l1822_l1819_DUPLICATE_92e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1813_l1829_l1826_l1822_l1819_DUPLICATE_92e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1841_l1835_l1829_l1826_l1822_l1819_DUPLICATE_0ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1841_l1835_l1829_l1826_l1822_l1819_DUPLICATE_0ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1841_l1835_l1829_l1826_l1822_l1819_DUPLICATE_0ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1841_l1835_l1829_l1826_l1822_l1819_DUPLICATE_0ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1841_l1835_l1829_l1826_l1822_l1819_DUPLICATE_0ba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1841_l1835_l1829_l1826_l1822_l1819_DUPLICATE_0ba0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1813_l1835_l1826_l1822_l1819_DUPLICATE_d8bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1813_l1835_l1826_l1822_l1819_DUPLICATE_d8bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1813_l1835_l1826_l1822_l1819_DUPLICATE_d8bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1813_l1835_l1826_l1822_l1819_DUPLICATE_d8bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1813_l1835_l1826_l1822_l1819_DUPLICATE_d8bd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1822_l1826_l1819_l1829_DUPLICATE_c85f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1822_l1826_l1819_l1829_DUPLICATE_c85f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1822_l1826_l1819_l1829_DUPLICATE_c85f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1822_l1826_l1819_l1829_DUPLICATE_c85f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1813_l1841_l1829_l1826_l1822_l1819_DUPLICATE_e499_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1813_l1841_l1829_l1826_l1822_l1819_DUPLICATE_e499_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1813_l1841_l1829_l1826_l1822_l1819_DUPLICATE_e499_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1813_l1841_l1829_l1826_l1822_l1819_DUPLICATE_e499_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1813_l1841_l1829_l1826_l1822_l1819_DUPLICATE_e499_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1813_l1841_l1829_l1826_l1822_l1819_DUPLICATE_e499_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1835_l1829_DUPLICATE_7991_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1835_l1829_DUPLICATE_7991_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1813_l1835_l1829_l1826_l1822_l1819_DUPLICATE_e5a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1813_l1835_l1829_l1826_l1822_l1819_DUPLICATE_e5a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1813_l1835_l1829_l1826_l1822_l1819_DUPLICATE_e5a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1813_l1835_l1829_l1826_l1822_l1819_DUPLICATE_e5a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1813_l1835_l1829_l1826_l1822_l1819_DUPLICATE_e5a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1813_l1835_l1829_l1826_l1822_l1819_DUPLICATE_e5a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue := VAR_result_stack_value_uxn_opcodes_h_l1839_c3_c437;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1841_c7_a7ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1829_c7_d212] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1835_c7_2ba5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1835_c7_2ba5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output;

     -- t8_MUX[uxn_opcodes_h_l1822_c7_6476] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1822_c7_6476_cond <= VAR_t8_MUX_uxn_opcodes_h_l1822_c7_6476_cond;
     t8_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue;
     t8_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1822_c7_6476_return_output := t8_MUX_uxn_opcodes_h_l1822_c7_6476_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1833_c32_f4b1] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1_left;
     BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1_return_output := BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1813_c1_a36d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1841_c7_a7ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1835_c7_2ba5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output;

     -- n8_MUX[uxn_opcodes_h_l1829_c7_d212] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1829_c7_d212_cond <= VAR_n8_MUX_uxn_opcodes_h_l1829_c7_d212_cond;
     n8_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue;
     n8_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1829_c7_d212_return_output := n8_MUX_uxn_opcodes_h_l1829_c7_d212_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1833_c32_8f0c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1833_c32_f4b1_return_output;
     VAR_printf_uxn_opcodes_h_l1814_c3_4dde_uxn_opcodes_h_l1814_c3_4dde_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_a36d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1829_c7_d212_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_a7ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1829_c7_d212_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_a7ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1822_c7_6476_return_output;
     -- n8_MUX[uxn_opcodes_h_l1826_c7_6998] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1826_c7_6998_cond <= VAR_n8_MUX_uxn_opcodes_h_l1826_c7_6998_cond;
     n8_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue;
     n8_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1826_c7_6998_return_output := n8_MUX_uxn_opcodes_h_l1826_c7_6998_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1826_c7_6998] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1829_c7_d212] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1829_c7_d212] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1829_c7_d212] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_return_output := result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_return_output;

     -- printf_uxn_opcodes_h_l1814_c3_4dde[uxn_opcodes_h_l1814_c3_4dde] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1814_c3_4dde_uxn_opcodes_h_l1814_c3_4dde_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1814_c3_4dde_uxn_opcodes_h_l1814_c3_4dde_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1835_c7_2ba5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output;

     -- MUX[uxn_opcodes_h_l1833_c32_8f0c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1833_c32_8f0c_cond <= VAR_MUX_uxn_opcodes_h_l1833_c32_8f0c_cond;
     MUX_uxn_opcodes_h_l1833_c32_8f0c_iftrue <= VAR_MUX_uxn_opcodes_h_l1833_c32_8f0c_iftrue;
     MUX_uxn_opcodes_h_l1833_c32_8f0c_iffalse <= VAR_MUX_uxn_opcodes_h_l1833_c32_8f0c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1833_c32_8f0c_return_output := MUX_uxn_opcodes_h_l1833_c32_8f0c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1819_c7_25bf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1819_c7_25bf_cond <= VAR_t8_MUX_uxn_opcodes_h_l1819_c7_25bf_cond;
     t8_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue;
     t8_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output := t8_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1835_c7_2ba5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue := VAR_MUX_uxn_opcodes_h_l1833_c32_8f0c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1826_c7_6998_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_d212_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_6998_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1835_c7_2ba5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_d212_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_d212_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output;
     -- t8_MUX[uxn_opcodes_h_l1813_c2_4148] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1813_c2_4148_cond <= VAR_t8_MUX_uxn_opcodes_h_l1813_c2_4148_cond;
     t8_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue;
     t8_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1813_c2_4148_return_output := t8_MUX_uxn_opcodes_h_l1813_c2_4148_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1826_c7_6998] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1829_c7_d212] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1829_c7_d212] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_return_output;

     -- n8_MUX[uxn_opcodes_h_l1822_c7_6476] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1822_c7_6476_cond <= VAR_n8_MUX_uxn_opcodes_h_l1822_c7_6476_cond;
     n8_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue;
     n8_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1822_c7_6476_return_output := n8_MUX_uxn_opcodes_h_l1822_c7_6476_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1826_c7_6998] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_return_output := result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1822_c7_6476] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1826_c7_6998] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1829_c7_d212] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1822_c7_6476_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_d212_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_6998_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1822_c7_6476_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_d212_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1829_c7_d212_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_6998_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_6998_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1813_c2_4148_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1822_c7_6476] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1819_c7_25bf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1822_c7_6476] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1826_c7_6998] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1822_c7_6476] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_return_output := result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_return_output;

     -- n8_MUX[uxn_opcodes_h_l1819_c7_25bf] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1819_c7_25bf_cond <= VAR_n8_MUX_uxn_opcodes_h_l1819_c7_25bf_cond;
     n8_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue;
     n8_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output := n8_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1826_c7_6998] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1826_c7_6998] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_6998_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1822_c7_6476_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_6998_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_6998_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1822_c7_6476_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1822_c7_6476_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1822_c7_6476] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1813_c2_4148] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1819_c7_25bf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1819_c7_25bf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output := result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1822_c7_6476] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_return_output;

     -- n8_MUX[uxn_opcodes_h_l1813_c2_4148] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1813_c2_4148_cond <= VAR_n8_MUX_uxn_opcodes_h_l1813_c2_4148_cond;
     n8_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue;
     n8_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1813_c2_4148_return_output := n8_MUX_uxn_opcodes_h_l1813_c2_4148_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1822_c7_6476] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1819_c7_25bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1813_c2_4148_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1822_c7_6476_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1822_c7_6476_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1822_c7_6476_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1813_c2_4148] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1819_c7_25bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1819_c7_25bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1813_c2_4148] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1813_c2_4148] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_return_output := result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1819_c7_25bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1819_c7_25bf_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1813_c2_4148] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1813_c2_4148] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1813_c2_4148] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1846_l1809_DUPLICATE_7c56 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1846_l1809_DUPLICATE_7c56_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1813_c2_4148_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_4148_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_4148_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1813_c2_4148_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_4148_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1813_c2_4148_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_4148_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1846_l1809_DUPLICATE_7c56_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1846_l1809_DUPLICATE_7c56_return_output;
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
