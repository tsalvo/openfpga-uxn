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
-- Submodules: 116
entity div2_0CLK_392dd546 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_392dd546;
architecture arch of div2_0CLK_392dd546 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2274_c6_da9b]
signal BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2274_c1_48e7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2274_c2_a4a3]
signal tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2274_c2_a4a3]
signal t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2274_c2_a4a3]
signal n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2274_c2_a4a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2274_c2_a4a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2274_c2_a4a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2274_c2_a4a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2274_c2_a4a3]
signal result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2274_c2_a4a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2275_c3_ebbc[uxn_opcodes_h_l2275_c3_ebbc]
signal printf_uxn_opcodes_h_l2275_c3_ebbc_uxn_opcodes_h_l2275_c3_ebbc_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2279_c11_87de]
signal BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2279_c7_7de8]
signal tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2279_c7_7de8]
signal t16_MUX_uxn_opcodes_h_l2279_c7_7de8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2279_c7_7de8]
signal n16_MUX_uxn_opcodes_h_l2279_c7_7de8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2279_c7_7de8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2279_c7_7de8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2279_c7_7de8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2279_c7_7de8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2279_c7_7de8]
signal result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2279_c7_7de8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2282_c11_02f8]
signal BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2282_c7_c1f1]
signal tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2282_c7_c1f1]
signal t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2282_c7_c1f1]
signal n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2282_c7_c1f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2282_c7_c1f1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2282_c7_c1f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2282_c7_c1f1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2282_c7_c1f1]
signal result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2282_c7_c1f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2287_c11_8860]
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2287_c7_ee8a]
signal tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2287_c7_ee8a]
signal t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2287_c7_ee8a]
signal n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2287_c7_ee8a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2287_c7_ee8a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2287_c7_ee8a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2287_c7_ee8a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2287_c7_ee8a]
signal result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2287_c7_ee8a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2290_c11_5d98]
signal BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2290_c7_1cab]
signal tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2290_c7_1cab]
signal t16_MUX_uxn_opcodes_h_l2290_c7_1cab_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2290_c7_1cab]
signal n16_MUX_uxn_opcodes_h_l2290_c7_1cab_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2290_c7_1cab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2290_c7_1cab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2290_c7_1cab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2290_c7_1cab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2290_c7_1cab]
signal result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2290_c7_1cab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2291_c3_8f98]
signal BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2294_c11_cfcd]
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2294_c7_9c46]
signal tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2294_c7_9c46]
signal n16_MUX_uxn_opcodes_h_l2294_c7_9c46_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2294_c7_9c46]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2294_c7_9c46]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2294_c7_9c46]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2294_c7_9c46]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2294_c7_9c46]
signal result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2294_c7_9c46]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2297_c11_0186]
signal BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2297_c7_3bbb]
signal tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2297_c7_3bbb]
signal n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2297_c7_3bbb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2297_c7_3bbb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2297_c7_3bbb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2297_c7_3bbb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2297_c7_3bbb]
signal result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2297_c7_3bbb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2302_c11_80e2]
signal BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2302_c7_400c]
signal tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2302_c7_400c]
signal n16_MUX_uxn_opcodes_h_l2302_c7_400c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2302_c7_400c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2302_c7_400c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2302_c7_400c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2302_c7_400c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2302_c7_400c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2302_c7_400c]
signal result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2302_c7_400c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2305_c11_8c08]
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2305_c7_f92b]
signal tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2305_c7_f92b]
signal n16_MUX_uxn_opcodes_h_l2305_c7_f92b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2305_c7_f92b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2305_c7_f92b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2305_c7_f92b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2305_c7_f92b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2305_c7_f92b]
signal result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2305_c7_f92b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2306_c3_3246]
signal BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2307_c11_6d17]
signal BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2307_c26_4988]
signal BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2307_c11_5d46]
signal MUX_uxn_opcodes_h_l2307_c11_5d46_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2307_c11_5d46_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2307_c11_5d46_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2307_c11_5d46_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2309_c32_ab08]
signal BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2309_c32_28fd]
signal BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2309_c32_608a]
signal MUX_uxn_opcodes_h_l2309_c32_608a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2309_c32_608a_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2309_c32_608a_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2309_c32_608a_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2311_c11_dec8]
signal BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2311_c7_0046]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2311_c7_0046]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2311_c7_0046]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2311_c7_0046]
signal result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2311_c7_0046]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2317_c11_a567]
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2317_c7_d69a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2317_c7_d69a]
signal result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2317_c7_d69a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2317_c7_d69a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2319_c34_1c68]
signal CONST_SR_8_uxn_opcodes_h_l2319_c34_1c68_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2319_c34_1c68_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2321_c11_ebc3]
signal BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2321_c7_b95b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2321_c7_b95b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_fea5
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_fea5_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_fea5_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b
BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_left,
BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_right,
BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3
tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond,
tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue,
tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse,
tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output);

-- t16_MUX_uxn_opcodes_h_l2274_c2_a4a3
t16_MUX_uxn_opcodes_h_l2274_c2_a4a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond,
t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue,
t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse,
t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output);

-- n16_MUX_uxn_opcodes_h_l2274_c2_a4a3
n16_MUX_uxn_opcodes_h_l2274_c2_a4a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond,
n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue,
n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse,
n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3
result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3
result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output);

-- printf_uxn_opcodes_h_l2275_c3_ebbc_uxn_opcodes_h_l2275_c3_ebbc
printf_uxn_opcodes_h_l2275_c3_ebbc_uxn_opcodes_h_l2275_c3_ebbc : entity work.printf_uxn_opcodes_h_l2275_c3_ebbc_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2275_c3_ebbc_uxn_opcodes_h_l2275_c3_ebbc_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de
BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_left,
BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_right,
BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8
tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_cond,
tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue,
tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse,
tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output);

-- t16_MUX_uxn_opcodes_h_l2279_c7_7de8
t16_MUX_uxn_opcodes_h_l2279_c7_7de8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2279_c7_7de8_cond,
t16_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue,
t16_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse,
t16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output);

-- n16_MUX_uxn_opcodes_h_l2279_c7_7de8
n16_MUX_uxn_opcodes_h_l2279_c7_7de8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2279_c7_7de8_cond,
n16_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue,
n16_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse,
n16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8
result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8
result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8
result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8
result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8
BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_left,
BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_right,
BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1
tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond,
tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output);

-- t16_MUX_uxn_opcodes_h_l2282_c7_c1f1
t16_MUX_uxn_opcodes_h_l2282_c7_c1f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond,
t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue,
t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse,
t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output);

-- n16_MUX_uxn_opcodes_h_l2282_c7_c1f1
n16_MUX_uxn_opcodes_h_l2282_c7_c1f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond,
n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue,
n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse,
n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1
result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1
result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1
result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1
result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_left,
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_right,
BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a
tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond,
tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output);

-- t16_MUX_uxn_opcodes_h_l2287_c7_ee8a
t16_MUX_uxn_opcodes_h_l2287_c7_ee8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond,
t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue,
t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse,
t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output);

-- n16_MUX_uxn_opcodes_h_l2287_c7_ee8a
n16_MUX_uxn_opcodes_h_l2287_c7_ee8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond,
n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue,
n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse,
n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a
result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a
result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_left,
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_right,
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab
tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_cond,
tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue,
tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse,
tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output);

-- t16_MUX_uxn_opcodes_h_l2290_c7_1cab
t16_MUX_uxn_opcodes_h_l2290_c7_1cab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2290_c7_1cab_cond,
t16_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue,
t16_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse,
t16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output);

-- n16_MUX_uxn_opcodes_h_l2290_c7_1cab
n16_MUX_uxn_opcodes_h_l2290_c7_1cab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2290_c7_1cab_cond,
n16_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue,
n16_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse,
n16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab
result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab
result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_cond,
result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98
BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98_left,
BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98_right,
BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_left,
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_right,
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46
tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_cond,
tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue,
tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse,
tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output);

-- n16_MUX_uxn_opcodes_h_l2294_c7_9c46
n16_MUX_uxn_opcodes_h_l2294_c7_9c46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2294_c7_9c46_cond,
n16_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue,
n16_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse,
n16_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46
result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_cond,
result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186
BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_left,
BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_right,
BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb
tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond,
tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue,
tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse,
tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output);

-- n16_MUX_uxn_opcodes_h_l2297_c7_3bbb
n16_MUX_uxn_opcodes_h_l2297_c7_3bbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond,
n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue,
n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse,
n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb
result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb
result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb
result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2
BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_left,
BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_right,
BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2302_c7_400c
tmp16_MUX_uxn_opcodes_h_l2302_c7_400c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_cond,
tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_return_output);

-- n16_MUX_uxn_opcodes_h_l2302_c7_400c
n16_MUX_uxn_opcodes_h_l2302_c7_400c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2302_c7_400c_cond,
n16_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue,
n16_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse,
n16_MUX_uxn_opcodes_h_l2302_c7_400c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c
result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_left,
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_right,
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b
tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_cond,
tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output);

-- n16_MUX_uxn_opcodes_h_l2305_c7_f92b
n16_MUX_uxn_opcodes_h_l2305_c7_f92b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2305_c7_f92b_cond,
n16_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue,
n16_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse,
n16_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b
result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246
BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246_left,
BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246_right,
BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17
BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17_left,
BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17_right,
BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988
BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988_left,
BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988_right,
BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988_return_output);

-- MUX_uxn_opcodes_h_l2307_c11_5d46
MUX_uxn_opcodes_h_l2307_c11_5d46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2307_c11_5d46_cond,
MUX_uxn_opcodes_h_l2307_c11_5d46_iftrue,
MUX_uxn_opcodes_h_l2307_c11_5d46_iffalse,
MUX_uxn_opcodes_h_l2307_c11_5d46_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08
BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08_left,
BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08_right,
BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd
BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd_left,
BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd_right,
BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd_return_output);

-- MUX_uxn_opcodes_h_l2309_c32_608a
MUX_uxn_opcodes_h_l2309_c32_608a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2309_c32_608a_cond,
MUX_uxn_opcodes_h_l2309_c32_608a_iftrue,
MUX_uxn_opcodes_h_l2309_c32_608a_iffalse,
MUX_uxn_opcodes_h_l2309_c32_608a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8
BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_left,
BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_right,
BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046
result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046
result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046
result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_cond,
result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046
result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_left,
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_right,
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a
result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2319_c34_1c68
CONST_SR_8_uxn_opcodes_h_l2319_c34_1c68 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2319_c34_1c68_x,
CONST_SR_8_uxn_opcodes_h_l2319_c34_1c68_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3
BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3_left,
BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3_right,
BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b
result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b
result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_fea5
CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_fea5 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_fea5_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_fea5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_return_output,
 tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output,
 t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output,
 n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_return_output,
 tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output,
 t16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output,
 n16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output,
 t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output,
 n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_return_output,
 tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output,
 t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output,
 n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_return_output,
 tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output,
 t16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output,
 n16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_return_output,
 tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output,
 n16_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_return_output,
 tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output,
 n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_return_output,
 n16_MUX_uxn_opcodes_h_l2302_c7_400c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_return_output,
 tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output,
 n16_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988_return_output,
 MUX_uxn_opcodes_h_l2307_c11_5d46_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd_return_output,
 MUX_uxn_opcodes_h_l2309_c32_608a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output,
 CONST_SR_8_uxn_opcodes_h_l2319_c34_1c68_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_fea5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2276_c3_0482 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2275_c3_ebbc_uxn_opcodes_h_l2275_c3_ebbc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2279_c7_7de8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2279_c7_7de8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_31c0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_eda2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2288_c3_3baa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2290_c7_1cab_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2290_c7_1cab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2292_c3_80bb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2294_c7_9c46_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2295_c3_8f55 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2302_c7_400c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2300_c3_a6df : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2302_c7_400c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2303_c3_aabb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2305_c7_f92b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2307_c11_5d46_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2307_c11_5d46_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2307_c11_5d46_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2307_c11_5d46_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2309_c32_608a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2309_c32_608a_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2309_c32_608a_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2309_c32_608a_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_d98b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2315_c24_d773_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2318_c3_1269 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2319_c34_1c68_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2319_c34_1c68_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2319_c24_59b2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_0dd4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2290_l2287_l2311_l2282_l2279_l2302_l2274_l2297_l2294_DUPLICATE_7d49_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2290_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_d31d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_2e17_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2311_l2282_l2305_l2279_l2302_l2297_l2294_DUPLICATE_26ea_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2298_l2291_l2306_l2283_DUPLICATE_d2e5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_fea5_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_fea5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2305_l2317_DUPLICATE_77e3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2326_l2270_DUPLICATE_b4af_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2309_c32_608a_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2276_c3_0482 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2276_c3_0482;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_eda2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2285_c3_eda2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_d98b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_d98b;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_31c0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_31c0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2303_c3_aabb := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2303_c3_aabb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2318_c3_1269 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2318_c3_1269;
     VAR_MUX_uxn_opcodes_h_l2307_c11_5d46_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2288_c3_3baa := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2288_c3_3baa;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2295_c3_8f55 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2295_c3_8f55;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2292_c3_80bb := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2292_c3_80bb;
     VAR_MUX_uxn_opcodes_h_l2309_c32_608a_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2300_c3_a6df := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2300_c3_a6df;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2319_c34_1c68_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2305_l2317_DUPLICATE_77e3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2305_l2317_DUPLICATE_77e3_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2290_c11_5d98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_left;
     BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_return_output := BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2315_c24_d773] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2315_c24_d773_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2298_l2291_l2306_l2283_DUPLICATE_d2e5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2298_l2291_l2306_l2283_DUPLICATE_d2e5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2311_l2282_l2305_l2279_l2302_l2297_l2294_DUPLICATE_26ea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2311_l2282_l2305_l2279_l2302_l2297_l2294_DUPLICATE_26ea_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2321_c11_ebc3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2279_c11_87de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_left;
     BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_return_output := BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2309_c32_ab08] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08_left;
     BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08_return_output := BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2305_c11_8c08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_left;
     BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_return_output := BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_0dd4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_0dd4_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2302_c11_80e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2287_c11_8860] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_left;
     BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_return_output := BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2294_c11_cfcd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2317_c11_a567] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_left;
     BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_return_output := BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2319_c34_1c68] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2319_c34_1c68_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2319_c34_1c68_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2319_c34_1c68_return_output := CONST_SR_8_uxn_opcodes_h_l2319_c34_1c68_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2290_l2287_l2311_l2282_l2279_l2302_l2274_l2297_l2294_DUPLICATE_7d49 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2290_l2287_l2311_l2282_l2279_l2302_l2274_l2297_l2294_DUPLICATE_7d49_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2290_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_d31d LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2290_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_d31d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2297_c11_0186] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_left;
     BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_return_output := BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2307_c11_6d17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17_left;
     BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17_return_output := BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2282_c11_02f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2311_c11_dec8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_2e17 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_2e17_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2274_c6_da9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2309_c32_ab08_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2274_c6_da9b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2279_c7_7de8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2279_c7_7de8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2279_c11_87de_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2282_c11_02f8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2287_c11_8860_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2290_c7_1cab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2290_c7_1cab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_5d98_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2294_c7_9c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_cfcd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_0186_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2302_c7_400c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2302_c11_80e2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2305_c7_f92b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_8c08_return_output;
     VAR_MUX_uxn_opcodes_h_l2307_c11_5d46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_6d17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2311_c11_dec8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_a567_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2321_c11_ebc3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2298_l2291_l2306_l2283_DUPLICATE_d2e5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2298_l2291_l2306_l2283_DUPLICATE_d2e5_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_fea5_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2298_l2291_l2306_l2283_DUPLICATE_d2e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2315_c24_d773_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2290_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_d31d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2290_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_d31d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2290_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_d31d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2290_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_d31d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2290_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_d31d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2290_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_d31d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2290_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_d31d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2290_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_d31d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2290_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_d31d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2311_l2282_l2305_l2279_l2302_l2297_l2294_DUPLICATE_26ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2311_l2282_l2305_l2279_l2302_l2297_l2294_DUPLICATE_26ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2311_l2282_l2305_l2279_l2302_l2297_l2294_DUPLICATE_26ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2311_l2282_l2305_l2279_l2302_l2297_l2294_DUPLICATE_26ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2311_l2282_l2305_l2279_l2302_l2297_l2294_DUPLICATE_26ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2311_l2282_l2305_l2279_l2302_l2297_l2294_DUPLICATE_26ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2311_l2282_l2305_l2279_l2302_l2297_l2294_DUPLICATE_26ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2311_l2282_l2305_l2279_l2302_l2297_l2294_DUPLICATE_26ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2311_l2282_l2305_l2279_l2302_l2297_l2294_DUPLICATE_26ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2311_l2282_l2305_l2279_l2302_l2297_l2294_DUPLICATE_26ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2311_l2282_l2305_l2279_l2302_l2297_l2294_DUPLICATE_26ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2290_l2287_l2311_l2282_l2279_l2302_l2274_l2297_l2294_DUPLICATE_7d49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2290_l2287_l2311_l2282_l2279_l2302_l2274_l2297_l2294_DUPLICATE_7d49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2290_l2287_l2311_l2282_l2279_l2302_l2274_l2297_l2294_DUPLICATE_7d49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2290_l2287_l2311_l2282_l2279_l2302_l2274_l2297_l2294_DUPLICATE_7d49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2290_l2287_l2311_l2282_l2279_l2302_l2274_l2297_l2294_DUPLICATE_7d49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2290_l2287_l2311_l2282_l2279_l2302_l2274_l2297_l2294_DUPLICATE_7d49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2290_l2287_l2311_l2282_l2279_l2302_l2274_l2297_l2294_DUPLICATE_7d49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2290_l2287_l2311_l2282_l2279_l2302_l2274_l2297_l2294_DUPLICATE_7d49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2290_l2287_l2311_l2282_l2279_l2302_l2274_l2297_l2294_DUPLICATE_7d49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_0dd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_0dd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_0dd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_0dd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_0dd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_0dd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_0dd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_0dd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_0dd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_0dd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2321_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_0dd4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2305_l2317_DUPLICATE_77e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2305_l2317_DUPLICATE_77e3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_2e17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_2e17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_2e17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_2e17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_2e17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_2e17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_2e17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_2e17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_2e17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2290_l2317_l2287_l2282_l2305_l2279_l2302_l2274_l2297_l2294_DUPLICATE_2e17_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2306_c3_3246] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246_left;
     BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246_return_output := BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2311_c7_0046] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2317_c7_d69a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2321_c7_b95b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2274_c1_48e7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2321_c7_b95b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_fea5 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_fea5_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_fea5_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_fea5_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_fea5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2319_c24_59b2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2319_c24_59b2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2319_c34_1c68_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l2309_c32_28fd] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd_left;
     BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd_return_output := BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2291_c3_8f98] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98_left;
     BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98_return_output := BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2309_c32_608a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2309_c32_28fd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2291_c3_8f98_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2306_c3_3246_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2319_c24_59b2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_fea5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2284_l2299_DUPLICATE_fea5_return_output;
     VAR_printf_uxn_opcodes_h_l2275_c3_ebbc_uxn_opcodes_h_l2275_c3_ebbc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2274_c1_48e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2321_c7_b95b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2311_c7_0046_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2321_c7_b95b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2317_c7_d69a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2317_c7_d69a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output;

     -- printf_uxn_opcodes_h_l2275_c3_ebbc[uxn_opcodes_h_l2275_c3_ebbc] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2275_c3_ebbc_uxn_opcodes_h_l2275_c3_ebbc_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2275_c3_ebbc_uxn_opcodes_h_l2275_c3_ebbc_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2311_c7_0046] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_return_output;

     -- MUX[uxn_opcodes_h_l2309_c32_608a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2309_c32_608a_cond <= VAR_MUX_uxn_opcodes_h_l2309_c32_608a_cond;
     MUX_uxn_opcodes_h_l2309_c32_608a_iftrue <= VAR_MUX_uxn_opcodes_h_l2309_c32_608a_iftrue;
     MUX_uxn_opcodes_h_l2309_c32_608a_iffalse <= VAR_MUX_uxn_opcodes_h_l2309_c32_608a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2309_c32_608a_return_output := MUX_uxn_opcodes_h_l2309_c32_608a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2305_c7_f92b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2307_c26_4988] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988_left;
     BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988_return_output := BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2317_c7_d69a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2290_c7_1cab] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2290_c7_1cab_cond <= VAR_t16_MUX_uxn_opcodes_h_l2290_c7_1cab_cond;
     t16_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue;
     t16_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output := t16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output;

     -- n16_MUX[uxn_opcodes_h_l2305_c7_f92b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2305_c7_f92b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2305_c7_f92b_cond;
     n16_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue;
     n16_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output := n16_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2307_c11_5d46_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2307_c26_4988_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue := VAR_MUX_uxn_opcodes_h_l2309_c32_608a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2311_c7_0046_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2317_c7_d69a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2311_c7_0046] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_return_output;

     -- t16_MUX[uxn_opcodes_h_l2287_c7_ee8a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond;
     t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue;
     t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output := t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2305_c7_f92b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2302_c7_400c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2311_c7_0046] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_return_output := result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2305_c7_f92b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2311_c7_0046] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_return_output;

     -- MUX[uxn_opcodes_h_l2307_c11_5d46] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2307_c11_5d46_cond <= VAR_MUX_uxn_opcodes_h_l2307_c11_5d46_cond;
     MUX_uxn_opcodes_h_l2307_c11_5d46_iftrue <= VAR_MUX_uxn_opcodes_h_l2307_c11_5d46_iftrue;
     MUX_uxn_opcodes_h_l2307_c11_5d46_iffalse <= VAR_MUX_uxn_opcodes_h_l2307_c11_5d46_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2307_c11_5d46_return_output := MUX_uxn_opcodes_h_l2307_c11_5d46_return_output;

     -- n16_MUX[uxn_opcodes_h_l2302_c7_400c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2302_c7_400c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2302_c7_400c_cond;
     n16_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue;
     n16_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2302_c7_400c_return_output := n16_MUX_uxn_opcodes_h_l2302_c7_400c_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue := VAR_MUX_uxn_opcodes_h_l2307_c11_5d46_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2302_c7_400c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2311_c7_0046_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2302_c7_400c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2311_c7_0046_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2311_c7_0046_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2302_c7_400c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2297_c7_3bbb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2297_c7_3bbb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond;
     n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue;
     n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output := n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2305_c7_f92b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2305_c7_f92b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2305_c7_f92b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_cond;
     tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output := tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2305_c7_f92b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2302_c7_400c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2282_c7_c1f1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond;
     t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue;
     t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output := t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2302_c7_400c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2302_c7_400c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2305_c7_f92b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2294_c7_9c46] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2297_c7_3bbb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2302_c7_400c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2302_c7_400c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_cond;
     tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_return_output := tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2302_c7_400c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2302_c7_400c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2294_c7_9c46] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2294_c7_9c46_cond <= VAR_n16_MUX_uxn_opcodes_h_l2294_c7_9c46_cond;
     n16_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue;
     n16_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output := n16_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output;

     -- t16_MUX[uxn_opcodes_h_l2279_c7_7de8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2279_c7_7de8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2279_c7_7de8_cond;
     t16_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue;
     t16_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output := t16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2297_c7_3bbb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2302_c7_400c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2302_c7_400c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2302_c7_400c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2302_c7_400c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2297_c7_3bbb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond;
     tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output := tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2290_c7_1cab] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2290_c7_1cab_cond <= VAR_n16_MUX_uxn_opcodes_h_l2290_c7_1cab_cond;
     n16_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue;
     n16_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output := n16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2297_c7_3bbb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2290_c7_1cab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2294_c7_9c46] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2297_c7_3bbb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2294_c7_9c46] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output;

     -- t16_MUX[uxn_opcodes_h_l2274_c2_a4a3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond;
     t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue;
     t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output := t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2297_c7_3bbb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2297_c7_3bbb_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2287_c7_ee8a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2294_c7_9c46] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output;

     -- n16_MUX[uxn_opcodes_h_l2287_c7_ee8a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond;
     n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue;
     n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output := n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2294_c7_9c46] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output := result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2290_c7_1cab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2294_c7_9c46] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_cond;
     tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output := tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2290_c7_1cab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2294_c7_9c46] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2294_c7_9c46_return_output;
     -- n16_MUX[uxn_opcodes_h_l2282_c7_c1f1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond;
     n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue;
     n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output := n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2290_c7_1cab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2290_c7_1cab] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output := result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2290_c7_1cab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2282_c7_c1f1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2287_c7_ee8a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2287_c7_ee8a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2290_c7_1cab] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_cond;
     tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output := tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_1cab_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2279_c7_7de8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2282_c7_c1f1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2287_c7_ee8a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2287_c7_ee8a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond;
     tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output := tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2287_c7_ee8a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2282_c7_c1f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2287_c7_ee8a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2279_c7_7de8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2279_c7_7de8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2279_c7_7de8_cond;
     n16_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue;
     n16_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output := n16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2287_c7_ee8a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2282_c7_c1f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2279_c7_7de8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2274_c2_a4a3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond;
     n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue;
     n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output := n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2274_c2_a4a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2282_c7_c1f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2282_c7_c1f1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond;
     tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output := tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2279_c7_7de8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2282_c7_c1f1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2282_c7_c1f1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2274_c2_a4a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2279_c7_7de8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_cond;
     tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output := tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2274_c2_a4a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2279_c7_7de8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2279_c7_7de8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2279_c7_7de8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2279_c7_7de8_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2274_c2_a4a3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond;
     tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output := tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2274_c2_a4a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2274_c2_a4a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2274_c2_a4a3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output;

     -- Submodule level 13
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2326_l2270_DUPLICATE_b4af LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2326_l2270_DUPLICATE_b4af_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2274_c2_a4a3_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2326_l2270_DUPLICATE_b4af_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2326_l2270_DUPLICATE_b4af_return_output;
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
