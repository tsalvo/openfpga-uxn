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
-- Submodules: 66
entity div_0CLK_f6fa2c7d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div_0CLK_f6fa2c7d;
architecture arch of div_0CLK_f6fa2c7d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1914_c6_e32d]
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1914_c1_9fc6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1914_c2_e7c5]
signal n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1914_c2_e7c5]
signal t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1914_c2_e7c5]
signal result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1914_c2_e7c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1914_c2_e7c5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1914_c2_e7c5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1914_c2_e7c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1914_c2_e7c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1914_c2_e7c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1915_c3_7ec3[uxn_opcodes_h_l1915_c3_7ec3]
signal printf_uxn_opcodes_h_l1915_c3_7ec3_uxn_opcodes_h_l1915_c3_7ec3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1920_c11_2b56]
signal BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1920_c7_bd44]
signal n8_MUX_uxn_opcodes_h_l1920_c7_bd44_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1920_c7_bd44]
signal t8_MUX_uxn_opcodes_h_l1920_c7_bd44_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1920_c7_bd44]
signal result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1920_c7_bd44]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1920_c7_bd44]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1920_c7_bd44]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1920_c7_bd44]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1920_c7_bd44]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1920_c7_bd44]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1923_c11_6896]
signal BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1923_c7_49c1]
signal n8_MUX_uxn_opcodes_h_l1923_c7_49c1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1923_c7_49c1]
signal t8_MUX_uxn_opcodes_h_l1923_c7_49c1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1923_c7_49c1]
signal result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1923_c7_49c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1923_c7_49c1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1923_c7_49c1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1923_c7_49c1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1923_c7_49c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1923_c7_49c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1927_c11_5993]
signal BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1927_c7_b301]
signal n8_MUX_uxn_opcodes_h_l1927_c7_b301_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1927_c7_b301_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1927_c7_b301]
signal result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1927_c7_b301]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1927_c7_b301]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1927_c7_b301]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1927_c7_b301]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1927_c7_b301]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1927_c7_b301]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1930_c11_549d]
signal BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1930_c7_4d5a]
signal n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1930_c7_4d5a]
signal result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1930_c7_4d5a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1930_c7_4d5a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1930_c7_4d5a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1930_c7_4d5a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1930_c7_4d5a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1930_c7_4d5a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1934_c32_e604]
signal BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1934_c32_b29e]
signal BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1934_c32_881d]
signal MUX_uxn_opcodes_h_l1934_c32_881d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1934_c32_881d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1934_c32_881d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1934_c32_881d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1936_c11_545f]
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1936_c7_de35]
signal result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1936_c7_de35]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1936_c7_de35]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1936_c7_de35]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1936_c7_de35]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1940_c24_c7fb]
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l1940_c38_adbb]
signal BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb_left : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb_right : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l1940_c24_15a2]
signal MUX_uxn_opcodes_h_l1940_c24_15a2_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1940_c24_15a2_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1940_c24_15a2_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1940_c24_15a2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1942_c11_6204]
signal BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1942_c7_0d17]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1942_c7_0d17]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d
BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_left,
BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_right,
BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_return_output);

-- n8_MUX_uxn_opcodes_h_l1914_c2_e7c5
n8_MUX_uxn_opcodes_h_l1914_c2_e7c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond,
n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue,
n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse,
n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output);

-- t8_MUX_uxn_opcodes_h_l1914_c2_e7c5
t8_MUX_uxn_opcodes_h_l1914_c2_e7c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond,
t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue,
t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse,
t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5
result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5
result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output);

-- printf_uxn_opcodes_h_l1915_c3_7ec3_uxn_opcodes_h_l1915_c3_7ec3
printf_uxn_opcodes_h_l1915_c3_7ec3_uxn_opcodes_h_l1915_c3_7ec3 : entity work.printf_uxn_opcodes_h_l1915_c3_7ec3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1915_c3_7ec3_uxn_opcodes_h_l1915_c3_7ec3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56
BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_left,
BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_right,
BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_return_output);

-- n8_MUX_uxn_opcodes_h_l1920_c7_bd44
n8_MUX_uxn_opcodes_h_l1920_c7_bd44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1920_c7_bd44_cond,
n8_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue,
n8_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse,
n8_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output);

-- t8_MUX_uxn_opcodes_h_l1920_c7_bd44
t8_MUX_uxn_opcodes_h_l1920_c7_bd44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1920_c7_bd44_cond,
t8_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue,
t8_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse,
t8_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44
result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_cond,
result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44
result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44
result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44
result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44
result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44
result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896
BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_left,
BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_right,
BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_return_output);

-- n8_MUX_uxn_opcodes_h_l1923_c7_49c1
n8_MUX_uxn_opcodes_h_l1923_c7_49c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1923_c7_49c1_cond,
n8_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue,
n8_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse,
n8_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output);

-- t8_MUX_uxn_opcodes_h_l1923_c7_49c1
t8_MUX_uxn_opcodes_h_l1923_c7_49c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1923_c7_49c1_cond,
t8_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue,
t8_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse,
t8_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1
result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1
result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_left,
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_right,
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_return_output);

-- n8_MUX_uxn_opcodes_h_l1927_c7_b301
n8_MUX_uxn_opcodes_h_l1927_c7_b301 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1927_c7_b301_cond,
n8_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue,
n8_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse,
n8_MUX_uxn_opcodes_h_l1927_c7_b301_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301
result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_cond,
result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301
result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d
BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_left,
BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_right,
BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_return_output);

-- n8_MUX_uxn_opcodes_h_l1930_c7_4d5a
n8_MUX_uxn_opcodes_h_l1930_c7_4d5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond,
n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue,
n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse,
n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a
result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a
result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a
result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a
result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604
BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604_left,
BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604_right,
BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e
BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e_left,
BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e_right,
BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e_return_output);

-- MUX_uxn_opcodes_h_l1934_c32_881d
MUX_uxn_opcodes_h_l1934_c32_881d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1934_c32_881d_cond,
MUX_uxn_opcodes_h_l1934_c32_881d_iftrue,
MUX_uxn_opcodes_h_l1934_c32_881d_iffalse,
MUX_uxn_opcodes_h_l1934_c32_881d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_left,
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_right,
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35
result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_cond,
result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb
BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb_left,
BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb_right,
BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb
BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb : entity work.BIN_OP_DIV_uint8_t_uint8_t_0CLK_a148083c port map (
BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb_left,
BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb_right,
BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb_return_output);

-- MUX_uxn_opcodes_h_l1940_c24_15a2
MUX_uxn_opcodes_h_l1940_c24_15a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1940_c24_15a2_cond,
MUX_uxn_opcodes_h_l1940_c24_15a2_iftrue,
MUX_uxn_opcodes_h_l1940_c24_15a2_iffalse,
MUX_uxn_opcodes_h_l1940_c24_15a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204
BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204_left,
BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204_right,
BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17
result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17
result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_return_output,
 n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output,
 t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_return_output,
 n8_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output,
 t8_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_return_output,
 n8_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output,
 t8_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_return_output,
 n8_MUX_uxn_opcodes_h_l1927_c7_b301_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_return_output,
 n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e_return_output,
 MUX_uxn_opcodes_h_l1934_c32_881d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb_return_output,
 MUX_uxn_opcodes_h_l1940_c24_15a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1917_c3_c00b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1915_c3_7ec3_uxn_opcodes_h_l1915_c3_7ec3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1920_c7_bd44_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1920_c7_bd44_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1921_c3_e541 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1927_c7_b301_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1923_c7_49c1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1923_c7_49c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1925_c3_3868 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1927_c7_b301_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1928_c3_784e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1934_c32_881d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1934_c32_881d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1934_c32_881d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1934_c32_881d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1939_c3_294c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1940_c24_15a2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1940_c24_15a2_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1940_c24_15a2_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1940_c24_15a2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1936_l1930_l1927_l1923_l1920_l1914_DUPLICATE_3c84_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1936_l1927_l1923_l1920_l1914_DUPLICATE_c0dd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1930_l1927_l1923_l1920_l1914_DUPLICATE_af08_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1942_l1930_l1927_l1923_l1920_l1914_DUPLICATE_553d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1920_l1930_l1923_l1927_DUPLICATE_1678_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1942_l1936_l1930_l1927_l1923_l1920_DUPLICATE_79f0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1930_l1936_DUPLICATE_3c46_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1947_l1910_DUPLICATE_0251_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1917_c3_c00b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1917_c3_c00b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1939_c3_294c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1939_c3_294c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1934_c32_881d_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1925_c3_3868 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1925_c3_3868;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1928_c3_784e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1928_c3_784e;
     VAR_MUX_uxn_opcodes_h_l1934_c32_881d_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1921_c3_e541 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1921_c3_e541;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l1940_c24_15a2_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604_left := VAR_ins;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb_right := t8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1920_l1930_l1923_l1927_DUPLICATE_1678 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1920_l1930_l1923_l1927_DUPLICATE_1678_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1936_c11_545f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1914_c6_e32d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1942_l1930_l1927_l1923_l1920_l1914_DUPLICATE_553d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1942_l1930_l1927_l1923_l1920_l1914_DUPLICATE_553d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1940_c24_c7fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1942_l1936_l1930_l1927_l1923_l1920_DUPLICATE_79f0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1942_l1936_l1930_l1927_l1923_l1920_DUPLICATE_79f0_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l1934_c32_e604] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604_left;
     BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604_return_output := BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1927_c11_5993] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_left;
     BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_return_output := BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1930_l1936_DUPLICATE_3c46 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1930_l1936_DUPLICATE_3c46_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1936_l1927_l1923_l1920_l1914_DUPLICATE_c0dd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1936_l1927_l1923_l1920_l1914_DUPLICATE_c0dd_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1923_c11_6896] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_left;
     BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_return_output := BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1920_c11_2b56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_left;
     BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_return_output := BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1942_c11_6204] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204_left;
     BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204_return_output := BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1930_l1927_l1923_l1920_l1914_DUPLICATE_af08 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1930_l1927_l1923_l1920_l1914_DUPLICATE_af08_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1930_c11_549d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1936_l1930_l1927_l1923_l1920_l1914_DUPLICATE_3c84 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1936_l1930_l1927_l1923_l1920_l1914_DUPLICATE_3c84_return_output := result.stack_value;

     -- BIN_OP_DIV[uxn_opcodes_h_l1940_c38_adbb] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb_left;
     BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb_return_output := BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1934_c32_e604_return_output;
     VAR_MUX_uxn_opcodes_h_l1940_c24_15a2_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l1940_c38_adbb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c6_e32d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1920_c7_bd44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1920_c7_bd44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_2b56_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1923_c7_49c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1923_c7_49c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_6896_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1927_c7_b301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_5993_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_549d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_545f_return_output;
     VAR_MUX_uxn_opcodes_h_l1940_c24_15a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c24_c7fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_6204_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1930_l1927_l1923_l1920_l1914_DUPLICATE_af08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1930_l1927_l1923_l1920_l1914_DUPLICATE_af08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1930_l1927_l1923_l1920_l1914_DUPLICATE_af08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1930_l1927_l1923_l1920_l1914_DUPLICATE_af08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1930_l1927_l1923_l1920_l1914_DUPLICATE_af08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1942_l1936_l1930_l1927_l1923_l1920_DUPLICATE_79f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1942_l1936_l1930_l1927_l1923_l1920_DUPLICATE_79f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1942_l1936_l1930_l1927_l1923_l1920_DUPLICATE_79f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1942_l1936_l1930_l1927_l1923_l1920_DUPLICATE_79f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1942_l1936_l1930_l1927_l1923_l1920_DUPLICATE_79f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1942_l1936_l1930_l1927_l1923_l1920_DUPLICATE_79f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1936_l1927_l1923_l1920_l1914_DUPLICATE_c0dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1936_l1927_l1923_l1920_l1914_DUPLICATE_c0dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1936_l1927_l1923_l1920_l1914_DUPLICATE_c0dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1936_l1927_l1923_l1920_l1914_DUPLICATE_c0dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1936_l1927_l1923_l1920_l1914_DUPLICATE_c0dd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1920_l1930_l1923_l1927_DUPLICATE_1678_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1920_l1930_l1923_l1927_DUPLICATE_1678_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1920_l1930_l1923_l1927_DUPLICATE_1678_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1920_l1930_l1923_l1927_DUPLICATE_1678_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1942_l1930_l1927_l1923_l1920_l1914_DUPLICATE_553d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1942_l1930_l1927_l1923_l1920_l1914_DUPLICATE_553d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1942_l1930_l1927_l1923_l1920_l1914_DUPLICATE_553d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1942_l1930_l1927_l1923_l1920_l1914_DUPLICATE_553d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1942_l1930_l1927_l1923_l1920_l1914_DUPLICATE_553d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1942_l1930_l1927_l1923_l1920_l1914_DUPLICATE_553d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1930_l1936_DUPLICATE_3c46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1930_l1936_DUPLICATE_3c46_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1936_l1930_l1927_l1923_l1920_l1914_DUPLICATE_3c84_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1936_l1930_l1927_l1923_l1920_l1914_DUPLICATE_3c84_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1936_l1930_l1927_l1923_l1920_l1914_DUPLICATE_3c84_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1936_l1930_l1927_l1923_l1920_l1914_DUPLICATE_3c84_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1936_l1930_l1927_l1923_l1920_l1914_DUPLICATE_3c84_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1936_l1930_l1927_l1923_l1920_l1914_DUPLICATE_3c84_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1942_c7_0d17] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1934_c32_b29e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e_left;
     BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e_return_output := BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1923_c7_49c1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1923_c7_49c1_cond <= VAR_t8_MUX_uxn_opcodes_h_l1923_c7_49c1_cond;
     t8_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue;
     t8_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output := t8_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1936_c7_de35] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1930_c7_4d5a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output;

     -- MUX[uxn_opcodes_h_l1940_c24_15a2] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1940_c24_15a2_cond <= VAR_MUX_uxn_opcodes_h_l1940_c24_15a2_cond;
     MUX_uxn_opcodes_h_l1940_c24_15a2_iftrue <= VAR_MUX_uxn_opcodes_h_l1940_c24_15a2_iftrue;
     MUX_uxn_opcodes_h_l1940_c24_15a2_iffalse <= VAR_MUX_uxn_opcodes_h_l1940_c24_15a2_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1940_c24_15a2_return_output := MUX_uxn_opcodes_h_l1940_c24_15a2_return_output;

     -- n8_MUX[uxn_opcodes_h_l1930_c7_4d5a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond <= VAR_n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond;
     n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue;
     n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output := n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1914_c1_9fc6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1942_c7_0d17] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1936_c7_de35] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1934_c32_881d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1934_c32_b29e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue := VAR_MUX_uxn_opcodes_h_l1940_c24_15a2_return_output;
     VAR_printf_uxn_opcodes_h_l1915_c3_7ec3_uxn_opcodes_h_l1915_c3_7ec3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1914_c1_9fc6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_0d17_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_de35_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_0d17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_de35_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output;
     -- t8_MUX[uxn_opcodes_h_l1920_c7_bd44] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1920_c7_bd44_cond <= VAR_t8_MUX_uxn_opcodes_h_l1920_c7_bd44_cond;
     t8_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue;
     t8_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output := t8_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1927_c7_b301] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_return_output;

     -- MUX[uxn_opcodes_h_l1934_c32_881d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1934_c32_881d_cond <= VAR_MUX_uxn_opcodes_h_l1934_c32_881d_cond;
     MUX_uxn_opcodes_h_l1934_c32_881d_iftrue <= VAR_MUX_uxn_opcodes_h_l1934_c32_881d_iftrue;
     MUX_uxn_opcodes_h_l1934_c32_881d_iffalse <= VAR_MUX_uxn_opcodes_h_l1934_c32_881d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1934_c32_881d_return_output := MUX_uxn_opcodes_h_l1934_c32_881d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1936_c7_de35] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1936_c7_de35] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_return_output := result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1930_c7_4d5a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1930_c7_4d5a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output;

     -- printf_uxn_opcodes_h_l1915_c3_7ec3[uxn_opcodes_h_l1915_c3_7ec3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1915_c3_7ec3_uxn_opcodes_h_l1915_c3_7ec3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1915_c3_7ec3_uxn_opcodes_h_l1915_c3_7ec3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1936_c7_de35] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_return_output;

     -- n8_MUX[uxn_opcodes_h_l1927_c7_b301] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1927_c7_b301_cond <= VAR_n8_MUX_uxn_opcodes_h_l1927_c7_b301_cond;
     n8_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue;
     n8_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1927_c7_b301_return_output := n8_MUX_uxn_opcodes_h_l1927_c7_b301_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue := VAR_MUX_uxn_opcodes_h_l1934_c32_881d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1927_c7_b301_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_de35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1927_c7_b301_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_de35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1936_c7_de35_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output;
     -- t8_MUX[uxn_opcodes_h_l1914_c2_e7c5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond <= VAR_t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond;
     t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue;
     t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output := t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1927_c7_b301] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1927_c7_b301] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_return_output;

     -- n8_MUX[uxn_opcodes_h_l1923_c7_49c1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1923_c7_49c1_cond <= VAR_n8_MUX_uxn_opcodes_h_l1923_c7_49c1_cond;
     n8_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue;
     n8_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output := n8_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1930_c7_4d5a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1930_c7_4d5a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1923_c7_49c1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1930_c7_4d5a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1930_c7_4d5a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_b301_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_b301_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_4d5a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1923_c7_49c1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1927_c7_b301] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_return_output := result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1927_c7_b301] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1920_c7_bd44] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1927_c7_b301] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_return_output;

     -- n8_MUX[uxn_opcodes_h_l1920_c7_bd44] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1920_c7_bd44_cond <= VAR_n8_MUX_uxn_opcodes_h_l1920_c7_bd44_cond;
     n8_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue;
     n8_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output := n8_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1923_c7_49c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1927_c7_b301] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_b301_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_b301_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_b301_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1927_c7_b301_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1920_c7_bd44] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1920_c7_bd44] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1923_c7_49c1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1923_c7_49c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1914_c2_e7c5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1923_c7_49c1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1923_c7_49c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output;

     -- n8_MUX[uxn_opcodes_h_l1914_c2_e7c5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond <= VAR_n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond;
     n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue;
     n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output := n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1923_c7_49c1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1914_c2_e7c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1914_c2_e7c5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1920_c7_bd44] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output := result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1920_c7_bd44] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1920_c7_bd44] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1920_c7_bd44] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_bd44_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1914_c2_e7c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1914_c2_e7c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1914_c2_e7c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1914_c2_e7c5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1947_l1910_DUPLICATE_0251 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1947_l1910_DUPLICATE_0251_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c2_e7c5_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1947_l1910_DUPLICATE_0251_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1947_l1910_DUPLICATE_0251_return_output;
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
