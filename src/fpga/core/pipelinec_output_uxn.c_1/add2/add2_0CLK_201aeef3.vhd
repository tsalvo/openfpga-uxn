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
entity add2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_201aeef3;
architecture arch of add2_0CLK_201aeef3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l971_c6_7b7a]
signal BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l971_c1_d188]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l971_c2_2590]
signal n16_MUX_uxn_opcodes_h_l971_c2_2590_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l971_c2_2590_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l971_c2_2590_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l971_c2_2590_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l971_c2_2590]
signal t16_MUX_uxn_opcodes_h_l971_c2_2590_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l971_c2_2590_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l971_c2_2590_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l971_c2_2590_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l971_c2_2590]
signal tmp16_MUX_uxn_opcodes_h_l971_c2_2590_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l971_c2_2590_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l971_c2_2590_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l971_c2_2590_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l971_c2_2590]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l971_c2_2590]
signal result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l971_c2_2590]
signal result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l971_c2_2590]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l971_c2_2590]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l971_c2_2590]
signal result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l971_c2_2590]
signal result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l972_c3_3855[uxn_opcodes_h_l972_c3_3855]
signal printf_uxn_opcodes_h_l972_c3_3855_uxn_opcodes_h_l972_c3_3855_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l977_c11_a192]
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l977_c7_5fb6]
signal n16_MUX_uxn_opcodes_h_l977_c7_5fb6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l977_c7_5fb6]
signal t16_MUX_uxn_opcodes_h_l977_c7_5fb6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l977_c7_5fb6]
signal tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l977_c7_5fb6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l977_c7_5fb6]
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l977_c7_5fb6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_5fb6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_5fb6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_5fb6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l977_c7_5fb6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l980_c11_89e4]
signal BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l980_c7_ea65]
signal n16_MUX_uxn_opcodes_h_l980_c7_ea65_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l980_c7_ea65]
signal t16_MUX_uxn_opcodes_h_l980_c7_ea65_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l980_c7_ea65]
signal tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l980_c7_ea65]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l980_c7_ea65]
signal result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l980_c7_ea65]
signal result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l980_c7_ea65]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l980_c7_ea65]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l980_c7_ea65]
signal result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l980_c7_ea65]
signal result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l985_c11_6d48]
signal BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l985_c7_b4b6]
signal n16_MUX_uxn_opcodes_h_l985_c7_b4b6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l985_c7_b4b6]
signal t16_MUX_uxn_opcodes_h_l985_c7_b4b6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l985_c7_b4b6]
signal tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l985_c7_b4b6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l985_c7_b4b6]
signal result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l985_c7_b4b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l985_c7_b4b6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l985_c7_b4b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l985_c7_b4b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l985_c7_b4b6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l988_c11_6c16]
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l988_c7_ba5b]
signal n16_MUX_uxn_opcodes_h_l988_c7_ba5b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l988_c7_ba5b]
signal t16_MUX_uxn_opcodes_h_l988_c7_ba5b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l988_c7_ba5b]
signal tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l988_c7_ba5b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l988_c7_ba5b]
signal result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l988_c7_ba5b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l988_c7_ba5b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l988_c7_ba5b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l988_c7_ba5b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l988_c7_ba5b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l989_c3_c109]
signal BIN_OP_OR_uxn_opcodes_h_l989_c3_c109_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l989_c3_c109_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l989_c3_c109_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l992_c11_7db3]
signal BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l992_c7_50fd]
signal n16_MUX_uxn_opcodes_h_l992_c7_50fd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l992_c7_50fd_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l992_c7_50fd]
signal tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l992_c7_50fd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l992_c7_50fd]
signal result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l992_c7_50fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l992_c7_50fd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l992_c7_50fd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l992_c7_50fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l992_c7_50fd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l995_c11_fb89]
signal BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l995_c7_6bc8]
signal n16_MUX_uxn_opcodes_h_l995_c7_6bc8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l995_c7_6bc8]
signal tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l995_c7_6bc8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l995_c7_6bc8]
signal result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l995_c7_6bc8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l995_c7_6bc8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l995_c7_6bc8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l995_c7_6bc8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l995_c7_6bc8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1000_c11_b18b]
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1000_c7_6526]
signal n16_MUX_uxn_opcodes_h_l1000_c7_6526_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1000_c7_6526_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1000_c7_6526]
signal tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1000_c7_6526]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1000_c7_6526]
signal result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1000_c7_6526]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1000_c7_6526]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1000_c7_6526]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1000_c7_6526]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1000_c7_6526]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_fe35]
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1003_c7_d7cf]
signal n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1003_c7_d7cf]
signal tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1003_c7_d7cf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1003_c7_d7cf]
signal result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1003_c7_d7cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1003_c7_d7cf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1003_c7_d7cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1003_c7_d7cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1003_c7_d7cf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1004_c3_2db1]
signal BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1005_c11_928c]
signal BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1008_c32_44cf]
signal BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1008_c32_223b]
signal BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1008_c32_9afb]
signal MUX_uxn_opcodes_h_l1008_c32_9afb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1008_c32_9afb_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1008_c32_9afb_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1008_c32_9afb_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_ebea]
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1010_c7_36a5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1010_c7_36a5]
signal result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1010_c7_36a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1010_c7_36a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1010_c7_36a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_cd19]
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1016_c7_da11]
signal result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1016_c7_da11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1016_c7_da11]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1016_c7_da11]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1018_c34_8c9a]
signal CONST_SR_8_uxn_opcodes_h_l1018_c34_8c9a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1018_c34_8c9a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_44b0]
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1020_c7_662a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1020_c7_662a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l982_l997_DUPLICATE_7212
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l982_l997_DUPLICATE_7212_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l982_l997_DUPLICATE_7212_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a
BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_left,
BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_right,
BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_return_output);

-- n16_MUX_uxn_opcodes_h_l971_c2_2590
n16_MUX_uxn_opcodes_h_l971_c2_2590 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l971_c2_2590_cond,
n16_MUX_uxn_opcodes_h_l971_c2_2590_iftrue,
n16_MUX_uxn_opcodes_h_l971_c2_2590_iffalse,
n16_MUX_uxn_opcodes_h_l971_c2_2590_return_output);

-- t16_MUX_uxn_opcodes_h_l971_c2_2590
t16_MUX_uxn_opcodes_h_l971_c2_2590 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l971_c2_2590_cond,
t16_MUX_uxn_opcodes_h_l971_c2_2590_iftrue,
t16_MUX_uxn_opcodes_h_l971_c2_2590_iffalse,
t16_MUX_uxn_opcodes_h_l971_c2_2590_return_output);

-- tmp16_MUX_uxn_opcodes_h_l971_c2_2590
tmp16_MUX_uxn_opcodes_h_l971_c2_2590 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l971_c2_2590_cond,
tmp16_MUX_uxn_opcodes_h_l971_c2_2590_iftrue,
tmp16_MUX_uxn_opcodes_h_l971_c2_2590_iffalse,
tmp16_MUX_uxn_opcodes_h_l971_c2_2590_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590
result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590
result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_cond,
result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590
result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590
result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590
result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590
result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_return_output);

-- printf_uxn_opcodes_h_l972_c3_3855_uxn_opcodes_h_l972_c3_3855
printf_uxn_opcodes_h_l972_c3_3855_uxn_opcodes_h_l972_c3_3855 : entity work.printf_uxn_opcodes_h_l972_c3_3855_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l972_c3_3855_uxn_opcodes_h_l972_c3_3855_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192
BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_left,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_right,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_return_output);

-- n16_MUX_uxn_opcodes_h_l977_c7_5fb6
n16_MUX_uxn_opcodes_h_l977_c7_5fb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l977_c7_5fb6_cond,
n16_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue,
n16_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse,
n16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output);

-- t16_MUX_uxn_opcodes_h_l977_c7_5fb6
t16_MUX_uxn_opcodes_h_l977_c7_5fb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l977_c7_5fb6_cond,
t16_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue,
t16_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse,
t16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6
tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_cond,
tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue,
tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse,
tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6
result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_cond,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4
BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_left,
BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_right,
BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_return_output);

-- n16_MUX_uxn_opcodes_h_l980_c7_ea65
n16_MUX_uxn_opcodes_h_l980_c7_ea65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l980_c7_ea65_cond,
n16_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue,
n16_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse,
n16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output);

-- t16_MUX_uxn_opcodes_h_l980_c7_ea65
t16_MUX_uxn_opcodes_h_l980_c7_ea65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l980_c7_ea65_cond,
t16_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue,
t16_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse,
t16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output);

-- tmp16_MUX_uxn_opcodes_h_l980_c7_ea65
tmp16_MUX_uxn_opcodes_h_l980_c7_ea65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_cond,
tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue,
tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse,
tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65
result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65
result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_cond,
result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65
result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65
result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65
result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65
result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48
BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_left,
BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_right,
BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_return_output);

-- n16_MUX_uxn_opcodes_h_l985_c7_b4b6
n16_MUX_uxn_opcodes_h_l985_c7_b4b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l985_c7_b4b6_cond,
n16_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue,
n16_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse,
n16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output);

-- t16_MUX_uxn_opcodes_h_l985_c7_b4b6
t16_MUX_uxn_opcodes_h_l985_c7_b4b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l985_c7_b4b6_cond,
t16_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue,
t16_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse,
t16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6
tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_cond,
tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue,
tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse,
tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6
result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6
result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_cond,
result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6
result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6
result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6
result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6
result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16
BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_left,
BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_right,
BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_return_output);

-- n16_MUX_uxn_opcodes_h_l988_c7_ba5b
n16_MUX_uxn_opcodes_h_l988_c7_ba5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l988_c7_ba5b_cond,
n16_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue,
n16_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse,
n16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output);

-- t16_MUX_uxn_opcodes_h_l988_c7_ba5b
t16_MUX_uxn_opcodes_h_l988_c7_ba5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l988_c7_ba5b_cond,
t16_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue,
t16_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse,
t16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b
tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_cond,
tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue,
tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse,
tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b
result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_cond,
result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b
result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l989_c3_c109
BIN_OP_OR_uxn_opcodes_h_l989_c3_c109 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l989_c3_c109_left,
BIN_OP_OR_uxn_opcodes_h_l989_c3_c109_right,
BIN_OP_OR_uxn_opcodes_h_l989_c3_c109_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3
BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_left,
BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_right,
BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_return_output);

-- n16_MUX_uxn_opcodes_h_l992_c7_50fd
n16_MUX_uxn_opcodes_h_l992_c7_50fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l992_c7_50fd_cond,
n16_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue,
n16_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse,
n16_MUX_uxn_opcodes_h_l992_c7_50fd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l992_c7_50fd
tmp16_MUX_uxn_opcodes_h_l992_c7_50fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_cond,
tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue,
tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse,
tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd
result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd
result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_cond,
result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd
result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd
result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd
result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd
result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89
BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_left,
BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_right,
BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_return_output);

-- n16_MUX_uxn_opcodes_h_l995_c7_6bc8
n16_MUX_uxn_opcodes_h_l995_c7_6bc8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l995_c7_6bc8_cond,
n16_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue,
n16_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse,
n16_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8
tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_cond,
tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue,
tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse,
tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8
result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8
result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_cond,
result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8
result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8
result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8
result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8
result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b
BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_left,
BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_right,
BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_return_output);

-- n16_MUX_uxn_opcodes_h_l1000_c7_6526
n16_MUX_uxn_opcodes_h_l1000_c7_6526 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1000_c7_6526_cond,
n16_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue,
n16_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse,
n16_MUX_uxn_opcodes_h_l1000_c7_6526_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1000_c7_6526
tmp16_MUX_uxn_opcodes_h_l1000_c7_6526 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_cond,
tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue,
tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse,
tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526
result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_cond,
result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526
result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_left,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_right,
BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_return_output);

-- n16_MUX_uxn_opcodes_h_l1003_c7_d7cf
n16_MUX_uxn_opcodes_h_l1003_c7_d7cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond,
n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue,
n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse,
n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf
tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond,
tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue,
tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse,
tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf
result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond,
result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf
result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1
BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1_left,
BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1_right,
BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c
BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c_left,
BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c_right,
BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf
BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf_left,
BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf_right,
BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b
BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b_left,
BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b_right,
BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b_return_output);

-- MUX_uxn_opcodes_h_l1008_c32_9afb
MUX_uxn_opcodes_h_l1008_c32_9afb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1008_c32_9afb_cond,
MUX_uxn_opcodes_h_l1008_c32_9afb_iftrue,
MUX_uxn_opcodes_h_l1008_c32_9afb_iffalse,
MUX_uxn_opcodes_h_l1008_c32_9afb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_left,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_right,
BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5
result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5
result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5
result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5
result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_left,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_right,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_cond,
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1018_c34_8c9a
CONST_SR_8_uxn_opcodes_h_l1018_c34_8c9a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1018_c34_8c9a_x,
CONST_SR_8_uxn_opcodes_h_l1018_c34_8c9a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0_left,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0_right,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a
result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a
result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l982_l997_DUPLICATE_7212
CONST_SL_8_uint16_t_uxn_opcodes_h_l982_l997_DUPLICATE_7212 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l982_l997_DUPLICATE_7212_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l982_l997_DUPLICATE_7212_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_return_output,
 n16_MUX_uxn_opcodes_h_l971_c2_2590_return_output,
 t16_MUX_uxn_opcodes_h_l971_c2_2590_return_output,
 tmp16_MUX_uxn_opcodes_h_l971_c2_2590_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_return_output,
 n16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output,
 t16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output,
 tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_return_output,
 n16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output,
 t16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output,
 tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_return_output,
 n16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output,
 t16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output,
 tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_return_output,
 n16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output,
 t16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output,
 tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l989_c3_c109_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_return_output,
 n16_MUX_uxn_opcodes_h_l992_c7_50fd_return_output,
 tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_return_output,
 n16_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output,
 tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_return_output,
 n16_MUX_uxn_opcodes_h_l1000_c7_6526_return_output,
 tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_return_output,
 n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output,
 tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b_return_output,
 MUX_uxn_opcodes_h_l1008_c32_9afb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_return_output,
 CONST_SR_8_uxn_opcodes_h_l1018_c34_8c9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l982_l997_DUPLICATE_7212_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l971_c2_2590_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l971_c2_2590_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l971_c2_2590_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l971_c2_2590_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l971_c2_2590_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l971_c2_2590_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l971_c2_2590_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l971_c2_2590_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l971_c2_2590_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l971_c2_2590_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l971_c2_2590_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l971_c2_2590_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l974_c3_c63d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l972_c3_3855_uxn_opcodes_h_l972_c3_3855_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l977_c7_5fb6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l977_c7_5fb6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_95b2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l980_c7_ea65_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l980_c7_ea65_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l983_c3_d358 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l985_c7_b4b6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l985_c7_b4b6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l986_c3_df1e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l992_c7_50fd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c7_ba5b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c7_ba5b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_2ebe : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l989_c3_c109_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l989_c3_c109_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l989_c3_c109_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l992_c7_50fd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l993_c3_48d1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1000_c7_6526_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l995_c7_6bc8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l998_c3_0a46 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1000_c7_6526_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_58b9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1005_c3_ac67 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1008_c32_9afb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1008_c32_9afb_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1008_c32_9afb_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1008_c32_9afb_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1013_c3_17be : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1014_c24_d4eb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1017_c3_f3fa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1018_c34_8c9a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1018_c34_8c9a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1018_c24_7554_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l1010_l980_l977_l1000_DUPLICATE_e631_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l971_l992_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_5f78_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l971_l992_l1020_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_8a06_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_735a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l992_l1020_l988_l1016_l985_l1010_l980_l1003_l977_l1000_DUPLICATE_7350_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_9b73_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l981_l1004_l989_l996_DUPLICATE_1632_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l982_l997_DUPLICATE_7212_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l982_l997_DUPLICATE_7212_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1003_l1016_DUPLICATE_b283_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l967_l1025_DUPLICATE_8e81_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l986_c3_df1e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l986_c3_df1e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l993_c3_48d1 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l993_c3_48d1;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1017_c3_f3fa := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1017_c3_f3fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0_right := to_unsigned(11, 4);
     VAR_MUX_uxn_opcodes_h_l1008_c32_9afb_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1013_c3_17be := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1013_c3_17be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l998_c3_0a46 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l998_c3_0a46;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_58b9 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1001_c3_58b9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_2ebe := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_2ebe;
     VAR_MUX_uxn_opcodes_h_l1008_c32_9afb_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l974_c3_c63d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l974_c3_c63d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l983_c3_d358 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l983_c3_d358;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_95b2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_95b2;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse := n16;
     VAR_n16_MUX_uxn_opcodes_h_l971_c2_2590_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l989_c3_c109_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l971_c2_2590_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1018_c34_8c9a_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l971_c2_2590_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l971_c6_7b7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l992_c11_7db3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_left;
     BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_return_output := BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_9b73 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_9b73_return_output := result.is_stack_read;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l981_l1004_l989_l996_DUPLICATE_1632 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l981_l1004_l989_l996_DUPLICATE_1632_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1000_c11_b18b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l971_l992_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_5f78 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l971_l992_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_5f78_return_output := result.stack_value;

     -- CONST_SR_8[uxn_opcodes_h_l1018_c34_8c9a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1018_c34_8c9a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1018_c34_8c9a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1018_c34_8c9a_return_output := CONST_SR_8_uxn_opcodes_h_l1018_c34_8c9a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1014_c24_d4eb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1014_c24_d4eb_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l977_c11_a192] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_left;
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_return_output := BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1003_l1016_DUPLICATE_b283 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1003_l1016_DUPLICATE_b283_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l988_c11_6c16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_left;
     BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_return_output := BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l995_c11_fb89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_left;
     BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_return_output := BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_735a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_735a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l980_c11_89e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l1010_l980_l977_l1000_DUPLICATE_e631 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l1010_l980_l977_l1000_DUPLICATE_e631_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1003_c11_fe35] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_left;
     BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_return_output := BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l992_l1020_l988_l1016_l985_l1010_l980_l1003_l977_l1000_DUPLICATE_7350 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l992_l1020_l988_l1016_l985_l1010_l980_l1003_l977_l1000_DUPLICATE_7350_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l1008_c32_44cf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf_left;
     BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf_return_output := BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l985_c11_6d48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_left;
     BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_return_output := BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l971_l992_l1020_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_8a06 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l971_l992_l1020_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_8a06_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_cd19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_left;
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_return_output := BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_44b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1010_c11_ebea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_left;
     BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_return_output := BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1008_c32_44cf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1000_c7_6526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c11_b18b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1003_c11_fe35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1010_c11_ebea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_cd19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_44b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l971_c2_2590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l971_c2_2590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l971_c2_2590_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l971_c6_7b7a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_5fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l977_c7_5fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_a192_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l980_c7_ea65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l980_c7_ea65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l980_c11_89e4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l985_c7_b4b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l985_c7_b4b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l985_c11_6d48_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l988_c7_ba5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c7_ba5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_6c16_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l992_c7_50fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l992_c11_7db3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l995_c7_6bc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_fb89_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l981_l1004_l989_l996_DUPLICATE_1632_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l989_c3_c109_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l981_l1004_l989_l996_DUPLICATE_1632_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l982_l997_DUPLICATE_7212_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l981_l1004_l989_l996_DUPLICATE_1632_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1014_c24_d4eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_735a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_735a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_735a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_735a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_735a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_735a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_735a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_735a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_735a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l992_l1020_l988_l1016_l985_l1010_l980_l1003_l977_l1000_DUPLICATE_7350_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l992_l1020_l988_l1016_l985_l1010_l980_l1003_l977_l1000_DUPLICATE_7350_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l992_l1020_l988_l1016_l985_l1010_l980_l1003_l977_l1000_DUPLICATE_7350_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l992_l1020_l988_l1016_l985_l1010_l980_l1003_l977_l1000_DUPLICATE_7350_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l992_l1020_l988_l1016_l985_l1010_l980_l1003_l977_l1000_DUPLICATE_7350_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l992_l1020_l988_l1016_l985_l1010_l980_l1003_l977_l1000_DUPLICATE_7350_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l992_l1020_l988_l1016_l985_l1010_l980_l1003_l977_l1000_DUPLICATE_7350_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l992_l1020_l988_l1016_l985_l1010_l980_l1003_l977_l1000_DUPLICATE_7350_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l992_l1020_l988_l1016_l985_l1010_l980_l1003_l977_l1000_DUPLICATE_7350_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l992_l1020_l988_l1016_l985_l1010_l980_l1003_l977_l1000_DUPLICATE_7350_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l995_l992_l1020_l988_l1016_l985_l1010_l980_l1003_l977_l1000_DUPLICATE_7350_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l1010_l980_l977_l1000_DUPLICATE_e631_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l1010_l980_l977_l1000_DUPLICATE_e631_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l1010_l980_l977_l1000_DUPLICATE_e631_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l1010_l980_l977_l1000_DUPLICATE_e631_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l1010_l980_l977_l1000_DUPLICATE_e631_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l1010_l980_l977_l1000_DUPLICATE_e631_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l1010_l980_l977_l1000_DUPLICATE_e631_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l1010_l980_l977_l1000_DUPLICATE_e631_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l995_l971_l992_l988_l985_l1010_l980_l977_l1000_DUPLICATE_e631_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_9b73_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_9b73_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_9b73_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_9b73_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_9b73_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_9b73_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_9b73_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l995_l992_l988_l985_l980_l1003_l977_l1000_DUPLICATE_9b73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l971_l992_l1020_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_8a06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l971_l992_l1020_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_8a06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l971_l992_l1020_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_8a06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l971_l992_l1020_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_8a06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l971_l992_l1020_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_8a06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l971_l992_l1020_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_8a06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l971_l992_l1020_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_8a06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l971_l992_l1020_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_8a06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l971_l992_l1020_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_8a06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l971_l992_l1020_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_8a06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l995_l971_l992_l1020_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_8a06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1003_l1016_DUPLICATE_b283_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1003_l1016_DUPLICATE_b283_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l971_l992_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_5f78_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l971_l992_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_5f78_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l971_l992_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_5f78_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l971_l992_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_5f78_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l971_l992_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_5f78_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l971_l992_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_5f78_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l971_l992_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_5f78_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l971_l992_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_5f78_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l971_l992_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_5f78_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l995_l971_l992_l988_l1016_l985_l980_l1003_l977_l1000_DUPLICATE_5f78_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l982_l997_DUPLICATE_7212 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l982_l997_DUPLICATE_7212_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l982_l997_DUPLICATE_7212_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l982_l997_DUPLICATE_7212_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l982_l997_DUPLICATE_7212_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1020_c7_662a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1003_c7_d7cf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1018_c24_7554] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1018_c24_7554_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1018_c34_8c9a_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1020_c7_662a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1004_c3_2db1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1_left;
     BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1_return_output := BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1008_c32_223b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b_left;
     BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b_return_output := BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1010_c7_36a5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l971_c1_d188] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l989_c3_c109] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l989_c3_c109_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l989_c3_c109_left;
     BIN_OP_OR_uxn_opcodes_h_l989_c3_c109_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l989_c3_c109_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l989_c3_c109_return_output := BIN_OP_OR_uxn_opcodes_h_l989_c3_c109_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1016_c7_da11] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1008_c32_9afb_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1008_c32_223b_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1004_c3_2db1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l989_c3_c109_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1018_c24_7554_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l982_l997_DUPLICATE_7212_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l982_l997_DUPLICATE_7212_return_output;
     VAR_printf_uxn_opcodes_h_l972_c3_3855_uxn_opcodes_h_l972_c3_3855_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l971_c1_d188_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_662a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_662a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_da11_return_output;
     -- n16_MUX[uxn_opcodes_h_l1003_c7_d7cf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond <= VAR_n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond;
     n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue;
     n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output := n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output;

     -- t16_MUX[uxn_opcodes_h_l988_c7_ba5b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l988_c7_ba5b_cond <= VAR_t16_MUX_uxn_opcodes_h_l988_c7_ba5b_cond;
     t16_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue;
     t16_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output := t16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1010_c7_36a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1005_c11_928c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c_return_output;

     -- printf_uxn_opcodes_h_l972_c3_3855[uxn_opcodes_h_l972_c3_3855] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l972_c3_3855_uxn_opcodes_h_l972_c3_3855_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l972_c3_3855_uxn_opcodes_h_l972_c3_3855_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l1016_c7_da11] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_return_output := result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_return_output;

     -- MUX[uxn_opcodes_h_l1008_c32_9afb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1008_c32_9afb_cond <= VAR_MUX_uxn_opcodes_h_l1008_c32_9afb_cond;
     MUX_uxn_opcodes_h_l1008_c32_9afb_iftrue <= VAR_MUX_uxn_opcodes_h_l1008_c32_9afb_iftrue;
     MUX_uxn_opcodes_h_l1008_c32_9afb_iffalse <= VAR_MUX_uxn_opcodes_h_l1008_c32_9afb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1008_c32_9afb_return_output := MUX_uxn_opcodes_h_l1008_c32_9afb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1016_c7_da11] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1016_c7_da11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1003_c7_d7cf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1000_c7_6526] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1005_c3_ac67 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1005_c11_928c_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue := VAR_MUX_uxn_opcodes_h_l1008_c32_9afb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_da11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1000_c7_6526_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_da11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_da11_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue := VAR_tmp16_uxn_opcodes_h_l1005_c3_ac67;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l995_c7_6bc8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1000_c7_6526] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1000_c7_6526_cond <= VAR_n16_MUX_uxn_opcodes_h_l1000_c7_6526_cond;
     n16_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue;
     n16_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1000_c7_6526_return_output := n16_MUX_uxn_opcodes_h_l1000_c7_6526_return_output;

     -- t16_MUX[uxn_opcodes_h_l985_c7_b4b6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l985_c7_b4b6_cond <= VAR_t16_MUX_uxn_opcodes_h_l985_c7_b4b6_cond;
     t16_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue;
     t16_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output := t16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1003_c7_d7cf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond;
     tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output := tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1010_c7_36a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1000_c7_6526] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1010_c7_36a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1003_c7_d7cf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1003_c7_d7cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1010_c7_36a5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1000_c7_6526_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c7_6526_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1010_c7_36a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse := VAR_t16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l995_c7_6bc8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1003_c7_d7cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output;

     -- n16_MUX[uxn_opcodes_h_l995_c7_6bc8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l995_c7_6bc8_cond <= VAR_n16_MUX_uxn_opcodes_h_l995_c7_6bc8_cond;
     n16_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue;
     n16_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output := n16_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1003_c7_d7cf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output := result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1000_c7_6526] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_cond;
     tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_return_output := tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_return_output;

     -- t16_MUX[uxn_opcodes_h_l980_c7_ea65] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l980_c7_ea65_cond <= VAR_t16_MUX_uxn_opcodes_h_l980_c7_ea65_cond;
     t16_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue;
     t16_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output := t16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1003_c7_d7cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1000_c7_6526] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1000_c7_6526] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l992_c7_50fd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l992_c7_50fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c7_6526_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c7_6526_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1003_c7_d7cf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1000_c7_6526_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l995_c7_6bc8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_cond;
     tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output := tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l988_c7_ba5b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l992_c7_50fd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_return_output;

     -- t16_MUX[uxn_opcodes_h_l977_c7_5fb6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l977_c7_5fb6_cond <= VAR_t16_MUX_uxn_opcodes_h_l977_c7_5fb6_cond;
     t16_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue;
     t16_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output := t16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l995_c7_6bc8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l995_c7_6bc8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output;

     -- n16_MUX[uxn_opcodes_h_l992_c7_50fd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l992_c7_50fd_cond <= VAR_n16_MUX_uxn_opcodes_h_l992_c7_50fd_cond;
     n16_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue;
     n16_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l992_c7_50fd_return_output := n16_MUX_uxn_opcodes_h_l992_c7_50fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1000_c7_6526] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1000_c7_6526] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1000_c7_6526] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_return_output := result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l992_c7_50fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c7_6526_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l992_c7_50fd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c7_6526_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c7_6526_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l971_c2_2590_iffalse := VAR_t16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l988_c7_ba5b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l992_c7_50fd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l995_c7_6bc8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output := result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output;

     -- n16_MUX[uxn_opcodes_h_l988_c7_ba5b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l988_c7_ba5b_cond <= VAR_n16_MUX_uxn_opcodes_h_l988_c7_ba5b_cond;
     n16_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue;
     n16_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output := n16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l995_c7_6bc8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l995_c7_6bc8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l992_c7_50fd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_cond;
     tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_return_output := tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_return_output;

     -- t16_MUX[uxn_opcodes_h_l971_c2_2590] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l971_c2_2590_cond <= VAR_t16_MUX_uxn_opcodes_h_l971_c2_2590_cond;
     t16_MUX_uxn_opcodes_h_l971_c2_2590_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l971_c2_2590_iftrue;
     t16_MUX_uxn_opcodes_h_l971_c2_2590_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l971_c2_2590_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l971_c2_2590_return_output := t16_MUX_uxn_opcodes_h_l971_c2_2590_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l992_c7_50fd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l985_c7_b4b6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l992_c7_50fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l992_c7_50fd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l995_c7_6bc8_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l971_c2_2590_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l992_c7_50fd_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l988_c7_ba5b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_cond;
     tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output := tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l988_c7_ba5b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l985_c7_b4b6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l992_c7_50fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l980_c7_ea65] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l992_c7_50fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l988_c7_ba5b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output;

     -- n16_MUX[uxn_opcodes_h_l985_c7_b4b6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l985_c7_b4b6_cond <= VAR_n16_MUX_uxn_opcodes_h_l985_c7_b4b6_cond;
     n16_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue;
     n16_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output := n16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l992_c7_50fd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_return_output := result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse := VAR_n16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l992_c7_50fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l980_c7_ea65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l992_c7_50fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l992_c7_50fd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l985_c7_b4b6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_cond;
     tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output := tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l977_c7_5fb6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output;

     -- n16_MUX[uxn_opcodes_h_l980_c7_ea65] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l980_c7_ea65_cond <= VAR_n16_MUX_uxn_opcodes_h_l980_c7_ea65_cond;
     n16_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue;
     n16_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output := n16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l980_c7_ea65] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l988_c7_ba5b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l988_c7_ba5b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l985_c7_b4b6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l985_c7_b4b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l988_c7_ba5b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output := result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l980_c7_ea65_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l988_c7_ba5b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l985_c7_b4b6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output := result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l985_c7_b4b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output;

     -- n16_MUX[uxn_opcodes_h_l977_c7_5fb6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l977_c7_5fb6_cond <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_5fb6_cond;
     n16_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue;
     n16_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output := n16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l985_c7_b4b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l980_c7_ea65] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_cond;
     tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue;
     tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output := tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l980_c7_ea65] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l971_c2_2590] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l980_c7_ea65] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l977_c7_5fb6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l971_c2_2590_iffalse := VAR_n16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l980_c7_ea65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l980_c7_ea65_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l985_c7_b4b6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l980_c7_ea65_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l980_c7_ea65] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_return_output;

     -- n16_MUX[uxn_opcodes_h_l971_c2_2590] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l971_c2_2590_cond <= VAR_n16_MUX_uxn_opcodes_h_l971_c2_2590_cond;
     n16_MUX_uxn_opcodes_h_l971_c2_2590_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l971_c2_2590_iftrue;
     n16_MUX_uxn_opcodes_h_l971_c2_2590_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l971_c2_2590_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l971_c2_2590_return_output := n16_MUX_uxn_opcodes_h_l971_c2_2590_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_5fb6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l971_c2_2590] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l980_c7_ea65] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l977_c7_5fb6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_cond;
     tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output := tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_5fb6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l980_c7_ea65] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_cond;
     result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_return_output := result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l971_c2_2590_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l980_c7_ea65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l980_c7_ea65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l980_c7_ea65_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l971_c2_2590_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l971_c2_2590] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l977_c7_5fb6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output := result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_5fb6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l971_c2_2590] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l971_c2_2590] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l971_c2_2590_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l971_c2_2590_cond;
     tmp16_MUX_uxn_opcodes_h_l971_c2_2590_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l971_c2_2590_iftrue;
     tmp16_MUX_uxn_opcodes_h_l971_c2_2590_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l971_c2_2590_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l971_c2_2590_return_output := tmp16_MUX_uxn_opcodes_h_l971_c2_2590_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l977_c7_5fb6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5fb6_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l971_c2_2590_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l971_c2_2590] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l971_c2_2590] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l971_c2_2590] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_cond;
     result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_return_output := result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l967_l1025_DUPLICATE_8e81 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l967_l1025_DUPLICATE_8e81_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l971_c2_2590_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l971_c2_2590_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l971_c2_2590_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l971_c2_2590_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l971_c2_2590_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l971_c2_2590_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l971_c2_2590_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l967_l1025_DUPLICATE_8e81_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l967_l1025_DUPLICATE_8e81_return_output;
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
