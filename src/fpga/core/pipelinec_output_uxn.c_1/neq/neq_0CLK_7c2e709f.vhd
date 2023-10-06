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
-- Submodules: 65
entity neq_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq_0CLK_7c2e709f;
architecture arch of neq_0CLK_7c2e709f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1431_c6_bf8c]
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1431_c1_b94a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1431_c2_088d]
signal t8_MUX_uxn_opcodes_h_l1431_c2_088d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1431_c2_088d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1431_c2_088d]
signal n8_MUX_uxn_opcodes_h_l1431_c2_088d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1431_c2_088d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1431_c2_088d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1431_c2_088d]
signal result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1431_c2_088d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1431_c2_088d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1431_c2_088d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1431_c2_088d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1431_c2_088d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1432_c3_7f87[uxn_opcodes_h_l1432_c3_7f87]
signal printf_uxn_opcodes_h_l1432_c3_7f87_uxn_opcodes_h_l1432_c3_7f87_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1437_c11_1f04]
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1437_c7_59d1]
signal t8_MUX_uxn_opcodes_h_l1437_c7_59d1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1437_c7_59d1]
signal n8_MUX_uxn_opcodes_h_l1437_c7_59d1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1437_c7_59d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1437_c7_59d1]
signal result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1437_c7_59d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1437_c7_59d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1437_c7_59d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1437_c7_59d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1437_c7_59d1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1440_c11_8e82]
signal BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1440_c7_4d1d]
signal t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1440_c7_4d1d]
signal n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1440_c7_4d1d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1440_c7_4d1d]
signal result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1440_c7_4d1d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1440_c7_4d1d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1440_c7_4d1d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1440_c7_4d1d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1440_c7_4d1d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1444_c11_395d]
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1444_c7_b637]
signal n8_MUX_uxn_opcodes_h_l1444_c7_b637_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1444_c7_b637_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1444_c7_b637]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1444_c7_b637]
signal result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1444_c7_b637]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1444_c7_b637]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1444_c7_b637]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1444_c7_b637]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1444_c7_b637]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1447_c11_7016]
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1447_c7_a064]
signal n8_MUX_uxn_opcodes_h_l1447_c7_a064_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1447_c7_a064_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1447_c7_a064]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1447_c7_a064]
signal result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1447_c7_a064]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1447_c7_a064]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1447_c7_a064]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1447_c7_a064]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1447_c7_a064]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1451_c32_807b]
signal BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1451_c32_8e2e]
signal BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1451_c32_164d]
signal MUX_uxn_opcodes_h_l1451_c32_164d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1451_c32_164d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1451_c32_164d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1451_c32_164d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1453_c11_ee28]
signal BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1453_c7_9bc2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1453_c7_9bc2]
signal result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1453_c7_9bc2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1453_c7_9bc2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1453_c7_9bc2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1457_c24_a454]
signal BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1457_c24_d84a]
signal MUX_uxn_opcodes_h_l1457_c24_d84a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1457_c24_d84a_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1457_c24_d84a_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1457_c24_d84a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1459_c11_91f8]
signal BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1459_c7_3340]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1459_c7_3340]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c
BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_left,
BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_right,
BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_return_output);

-- t8_MUX_uxn_opcodes_h_l1431_c2_088d
t8_MUX_uxn_opcodes_h_l1431_c2_088d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1431_c2_088d_cond,
t8_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue,
t8_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse,
t8_MUX_uxn_opcodes_h_l1431_c2_088d_return_output);

-- n8_MUX_uxn_opcodes_h_l1431_c2_088d
n8_MUX_uxn_opcodes_h_l1431_c2_088d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1431_c2_088d_cond,
n8_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue,
n8_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse,
n8_MUX_uxn_opcodes_h_l1431_c2_088d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d
result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_return_output);

-- printf_uxn_opcodes_h_l1432_c3_7f87_uxn_opcodes_h_l1432_c3_7f87
printf_uxn_opcodes_h_l1432_c3_7f87_uxn_opcodes_h_l1432_c3_7f87 : entity work.printf_uxn_opcodes_h_l1432_c3_7f87_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1432_c3_7f87_uxn_opcodes_h_l1432_c3_7f87_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_left,
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_right,
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_return_output);

-- t8_MUX_uxn_opcodes_h_l1437_c7_59d1
t8_MUX_uxn_opcodes_h_l1437_c7_59d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1437_c7_59d1_cond,
t8_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue,
t8_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse,
t8_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output);

-- n8_MUX_uxn_opcodes_h_l1437_c7_59d1
n8_MUX_uxn_opcodes_h_l1437_c7_59d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1437_c7_59d1_cond,
n8_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue,
n8_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse,
n8_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1
result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1
result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1
result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_left,
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_right,
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_return_output);

-- t8_MUX_uxn_opcodes_h_l1440_c7_4d1d
t8_MUX_uxn_opcodes_h_l1440_c7_4d1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond,
t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue,
t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse,
t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output);

-- n8_MUX_uxn_opcodes_h_l1440_c7_4d1d
n8_MUX_uxn_opcodes_h_l1440_c7_4d1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond,
n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue,
n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse,
n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d
result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d
result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_left,
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_right,
BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_return_output);

-- n8_MUX_uxn_opcodes_h_l1444_c7_b637
n8_MUX_uxn_opcodes_h_l1444_c7_b637 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1444_c7_b637_cond,
n8_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue,
n8_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse,
n8_MUX_uxn_opcodes_h_l1444_c7_b637_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_cond,
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_left,
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_right,
BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_return_output);

-- n8_MUX_uxn_opcodes_h_l1447_c7_a064
n8_MUX_uxn_opcodes_h_l1447_c7_a064 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1447_c7_a064_cond,
n8_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue,
n8_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse,
n8_MUX_uxn_opcodes_h_l1447_c7_a064_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064
result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_cond,
result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064
result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b
BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b_left,
BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b_right,
BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e
BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e_left,
BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e_right,
BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e_return_output);

-- MUX_uxn_opcodes_h_l1451_c32_164d
MUX_uxn_opcodes_h_l1451_c32_164d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1451_c32_164d_cond,
MUX_uxn_opcodes_h_l1451_c32_164d_iftrue,
MUX_uxn_opcodes_h_l1451_c32_164d_iffalse,
MUX_uxn_opcodes_h_l1451_c32_164d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28
BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_left,
BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_right,
BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2
result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2
result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2
result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2
result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454
BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454_left,
BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454_right,
BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454_return_output);

-- MUX_uxn_opcodes_h_l1457_c24_d84a
MUX_uxn_opcodes_h_l1457_c24_d84a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1457_c24_d84a_cond,
MUX_uxn_opcodes_h_l1457_c24_d84a_iftrue,
MUX_uxn_opcodes_h_l1457_c24_d84a_iffalse,
MUX_uxn_opcodes_h_l1457_c24_d84a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8
BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8_left,
BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8_right,
BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340
result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340
result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_return_output,
 t8_MUX_uxn_opcodes_h_l1431_c2_088d_return_output,
 n8_MUX_uxn_opcodes_h_l1431_c2_088d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_return_output,
 t8_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output,
 n8_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_return_output,
 t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output,
 n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_return_output,
 n8_MUX_uxn_opcodes_h_l1444_c7_b637_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_return_output,
 n8_MUX_uxn_opcodes_h_l1447_c7_a064_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e_return_output,
 MUX_uxn_opcodes_h_l1451_c32_164d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454_return_output,
 MUX_uxn_opcodes_h_l1457_c24_d84a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1431_c2_088d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1431_c2_088d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1431_c2_088d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1431_c2_088d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1434_c3_d12c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1432_c3_7f87_uxn_opcodes_h_l1432_c3_7f87_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1437_c7_59d1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1437_c7_59d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1438_c3_aa9e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1444_c7_b637_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_832a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1447_c7_a064_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1444_c7_b637_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1445_c3_912a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1447_c7_a064_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1451_c32_164d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1451_c32_164d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1451_c32_164d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1451_c32_164d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1456_c3_bca3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1457_c24_d84a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1457_c24_d84a_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1457_c24_d84a_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1457_c24_d84a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1431_l1453_l1444_l1440_l1437_DUPLICATE_0b27_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1431_l1453_l1447_l1444_l1440_l1437_DUPLICATE_499d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1459_l1447_l1444_l1440_l1437_DUPLICATE_b899_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1431_l1447_l1444_l1440_l1437_DUPLICATE_11ae_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1459_l1453_l1447_l1444_l1440_l1437_DUPLICATE_134b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1444_l1437_l1447_l1440_DUPLICATE_5a4e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1447_l1453_DUPLICATE_7abd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1464_l1427_DUPLICATE_d851_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1434_c3_d12c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1434_c3_d12c;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l1457_c24_d84a_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1438_c3_aa9e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1438_c3_aa9e;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1445_c3_912a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1445_c3_912a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_832a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1442_c3_832a;
     VAR_MUX_uxn_opcodes_h_l1451_c32_164d_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_right := to_unsigned(5, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l1457_c24_d84a_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1456_c3_bca3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1456_c3_bca3;
     VAR_MUX_uxn_opcodes_h_l1451_c32_164d_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1431_l1453_l1444_l1440_l1437_DUPLICATE_0b27 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1431_l1453_l1444_l1440_l1437_DUPLICATE_0b27_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1444_l1437_l1447_l1440_DUPLICATE_5a4e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1444_l1437_l1447_l1440_DUPLICATE_5a4e_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1447_l1453_DUPLICATE_7abd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1447_l1453_DUPLICATE_7abd_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1437_c11_1f04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_left;
     BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_return_output := BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1459_l1447_l1444_l1440_l1437_DUPLICATE_b899 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1459_l1447_l1444_l1440_l1437_DUPLICATE_b899_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1444_c11_395d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1440_c11_8e82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_left;
     BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_return_output := BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1431_l1447_l1444_l1440_l1437_DUPLICATE_11ae LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1431_l1447_l1444_l1440_l1437_DUPLICATE_11ae_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1447_c11_7016] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_left;
     BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_return_output := BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1459_l1453_l1447_l1444_l1440_l1437_DUPLICATE_134b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1459_l1453_l1447_l1444_l1440_l1437_DUPLICATE_134b_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1453_c11_ee28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_left;
     BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_return_output := BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1431_l1453_l1447_l1444_l1440_l1437_DUPLICATE_499d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1431_l1453_l1447_l1444_l1440_l1437_DUPLICATE_499d_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1457_c24_a454] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454_left;
     BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454_return_output := BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1431_c6_bf8c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1459_c11_91f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1451_c32_807b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b_left;
     BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b_return_output := BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1451_c32_807b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1431_c2_088d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1431_c2_088d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c6_bf8c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1437_c7_59d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1437_c7_59d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_1f04_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8e82_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1444_c7_b637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1444_c11_395d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1447_c7_a064_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c11_7016_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_ee28_return_output;
     VAR_MUX_uxn_opcodes_h_l1457_c24_d84a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c24_a454_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1459_c11_91f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1431_l1447_l1444_l1440_l1437_DUPLICATE_11ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1431_l1447_l1444_l1440_l1437_DUPLICATE_11ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1431_l1447_l1444_l1440_l1437_DUPLICATE_11ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1431_l1447_l1444_l1440_l1437_DUPLICATE_11ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1431_l1447_l1444_l1440_l1437_DUPLICATE_11ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1459_l1453_l1447_l1444_l1440_l1437_DUPLICATE_134b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1459_l1453_l1447_l1444_l1440_l1437_DUPLICATE_134b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1459_l1453_l1447_l1444_l1440_l1437_DUPLICATE_134b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1459_l1453_l1447_l1444_l1440_l1437_DUPLICATE_134b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1459_l1453_l1447_l1444_l1440_l1437_DUPLICATE_134b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1459_l1453_l1447_l1444_l1440_l1437_DUPLICATE_134b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1431_l1453_l1444_l1440_l1437_DUPLICATE_0b27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1431_l1453_l1444_l1440_l1437_DUPLICATE_0b27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1431_l1453_l1444_l1440_l1437_DUPLICATE_0b27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1431_l1453_l1444_l1440_l1437_DUPLICATE_0b27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1431_l1453_l1444_l1440_l1437_DUPLICATE_0b27_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1444_l1437_l1447_l1440_DUPLICATE_5a4e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1444_l1437_l1447_l1440_DUPLICATE_5a4e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1444_l1437_l1447_l1440_DUPLICATE_5a4e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1444_l1437_l1447_l1440_DUPLICATE_5a4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1459_l1447_l1444_l1440_l1437_DUPLICATE_b899_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1459_l1447_l1444_l1440_l1437_DUPLICATE_b899_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1459_l1447_l1444_l1440_l1437_DUPLICATE_b899_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1459_l1447_l1444_l1440_l1437_DUPLICATE_b899_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1459_l1447_l1444_l1440_l1437_DUPLICATE_b899_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1431_l1459_l1447_l1444_l1440_l1437_DUPLICATE_b899_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1447_l1453_DUPLICATE_7abd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1447_l1453_DUPLICATE_7abd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1431_l1453_l1447_l1444_l1440_l1437_DUPLICATE_499d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1431_l1453_l1447_l1444_l1440_l1437_DUPLICATE_499d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1431_l1453_l1447_l1444_l1440_l1437_DUPLICATE_499d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1431_l1453_l1447_l1444_l1440_l1437_DUPLICATE_499d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1431_l1453_l1447_l1444_l1440_l1437_DUPLICATE_499d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1431_l1453_l1447_l1444_l1440_l1437_DUPLICATE_499d_return_output;
     -- n8_MUX[uxn_opcodes_h_l1447_c7_a064] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1447_c7_a064_cond <= VAR_n8_MUX_uxn_opcodes_h_l1447_c7_a064_cond;
     n8_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue;
     n8_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1447_c7_a064_return_output := n8_MUX_uxn_opcodes_h_l1447_c7_a064_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1459_c7_3340] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1453_c7_9bc2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1451_c32_8e2e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e_left;
     BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e_return_output := BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1431_c1_b94a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1453_c7_9bc2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output;

     -- MUX[uxn_opcodes_h_l1457_c24_d84a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1457_c24_d84a_cond <= VAR_MUX_uxn_opcodes_h_l1457_c24_d84a_cond;
     MUX_uxn_opcodes_h_l1457_c24_d84a_iftrue <= VAR_MUX_uxn_opcodes_h_l1457_c24_d84a_iftrue;
     MUX_uxn_opcodes_h_l1457_c24_d84a_iffalse <= VAR_MUX_uxn_opcodes_h_l1457_c24_d84a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1457_c24_d84a_return_output := MUX_uxn_opcodes_h_l1457_c24_d84a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1447_c7_a064] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1459_c7_3340] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_return_output;

     -- t8_MUX[uxn_opcodes_h_l1440_c7_4d1d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond;
     t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue;
     t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output := t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1451_c32_164d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1451_c32_8e2e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue := VAR_MUX_uxn_opcodes_h_l1457_c24_d84a_return_output;
     VAR_printf_uxn_opcodes_h_l1432_c3_7f87_uxn_opcodes_h_l1432_c3_7f87_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1431_c1_b94a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1447_c7_a064_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1459_c7_3340_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1447_c7_a064_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1459_c7_3340_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output;
     -- n8_MUX[uxn_opcodes_h_l1444_c7_b637] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1444_c7_b637_cond <= VAR_n8_MUX_uxn_opcodes_h_l1444_c7_b637_cond;
     n8_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue;
     n8_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1444_c7_b637_return_output := n8_MUX_uxn_opcodes_h_l1444_c7_b637_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1447_c7_a064] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_return_output;

     -- t8_MUX[uxn_opcodes_h_l1437_c7_59d1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1437_c7_59d1_cond <= VAR_t8_MUX_uxn_opcodes_h_l1437_c7_59d1_cond;
     t8_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue;
     t8_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output := t8_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1444_c7_b637] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1453_c7_9bc2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1453_c7_9bc2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output;

     -- printf_uxn_opcodes_h_l1432_c3_7f87[uxn_opcodes_h_l1432_c3_7f87] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1432_c3_7f87_uxn_opcodes_h_l1432_c3_7f87_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1432_c3_7f87_uxn_opcodes_h_l1432_c3_7f87_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1447_c7_a064] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1453_c7_9bc2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output;

     -- MUX[uxn_opcodes_h_l1451_c32_164d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1451_c32_164d_cond <= VAR_MUX_uxn_opcodes_h_l1451_c32_164d_cond;
     MUX_uxn_opcodes_h_l1451_c32_164d_iftrue <= VAR_MUX_uxn_opcodes_h_l1451_c32_164d_iftrue;
     MUX_uxn_opcodes_h_l1451_c32_164d_iffalse <= VAR_MUX_uxn_opcodes_h_l1451_c32_164d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1451_c32_164d_return_output := MUX_uxn_opcodes_h_l1451_c32_164d_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue := VAR_MUX_uxn_opcodes_h_l1451_c32_164d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1444_c7_b637_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1447_c7_a064_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1444_c7_b637_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c7_a064_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_9bc2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output;
     -- n8_MUX[uxn_opcodes_h_l1440_c7_4d1d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond;
     n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue;
     n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output := n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1440_c7_4d1d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1447_c7_a064] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1444_c7_b637] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1447_c7_a064] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1447_c7_a064] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_return_output := result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1444_c7_b637] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_return_output;

     -- t8_MUX[uxn_opcodes_h_l1431_c2_088d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1431_c2_088d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1431_c2_088d_cond;
     t8_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue;
     t8_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1431_c2_088d_return_output := t8_MUX_uxn_opcodes_h_l1431_c2_088d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1447_c7_a064] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c7_a064_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1444_c7_b637_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c7_a064_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c7_a064_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1444_c7_b637_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1447_c7_a064_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1431_c2_088d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1440_c7_4d1d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1437_c7_59d1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1444_c7_b637] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_return_output := result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_return_output;

     -- n8_MUX[uxn_opcodes_h_l1437_c7_59d1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1437_c7_59d1_cond <= VAR_n8_MUX_uxn_opcodes_h_l1437_c7_59d1_cond;
     n8_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue;
     n8_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output := n8_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1440_c7_4d1d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1444_c7_b637] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1444_c7_b637] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1444_c7_b637] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1444_c7_b637_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1444_c7_b637_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1444_c7_b637_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1444_c7_b637_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1440_c7_4d1d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1431_c2_088d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1437_c7_59d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1440_c7_4d1d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1437_c7_59d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1440_c7_4d1d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output;

     -- n8_MUX[uxn_opcodes_h_l1431_c2_088d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1431_c2_088d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1431_c2_088d_cond;
     n8_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue;
     n8_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1431_c2_088d_return_output := n8_MUX_uxn_opcodes_h_l1431_c2_088d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1440_c7_4d1d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1431_c2_088d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1440_c7_4d1d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1437_c7_59d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1431_c2_088d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1431_c2_088d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1437_c7_59d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1437_c7_59d1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1437_c7_59d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_59d1_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1431_c2_088d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1431_c2_088d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1431_c2_088d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1431_c2_088d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1464_l1427_DUPLICATE_d851 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1464_l1427_DUPLICATE_d851_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c2_088d_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c2_088d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c2_088d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c2_088d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c2_088d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c2_088d_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c2_088d_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1464_l1427_DUPLICATE_d851_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1464_l1427_DUPLICATE_d851_return_output;
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
