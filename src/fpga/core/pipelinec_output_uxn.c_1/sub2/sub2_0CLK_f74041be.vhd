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
-- Submodules: 79
entity sub2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_f74041be;
architecture arch of sub2_0CLK_f74041be is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2359_c6_c78c]
signal BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2359_c1_ec9e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2359_c2_b539]
signal n16_MUX_uxn_opcodes_h_l2359_c2_b539_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2359_c2_b539]
signal tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2359_c2_b539]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2359_c2_b539]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2359_c2_b539]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2359_c2_b539]
signal result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2359_c2_b539]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2359_c2_b539]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2359_c2_b539]
signal t16_MUX_uxn_opcodes_h_l2359_c2_b539_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2360_c3_929e[uxn_opcodes_h_l2360_c3_929e]
signal printf_uxn_opcodes_h_l2360_c3_929e_uxn_opcodes_h_l2360_c3_929e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_348c]
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2364_c7_30e0]
signal n16_MUX_uxn_opcodes_h_l2364_c7_30e0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2364_c7_30e0]
signal tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2364_c7_30e0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2364_c7_30e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_30e0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2364_c7_30e0]
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_30e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2364_c7_30e0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2364_c7_30e0]
signal t16_MUX_uxn_opcodes_h_l2364_c7_30e0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2367_c11_3d69]
signal BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2367_c7_d8d1]
signal n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2367_c7_d8d1]
signal tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2367_c7_d8d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2367_c7_d8d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2367_c7_d8d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2367_c7_d8d1]
signal result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2367_c7_d8d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2367_c7_d8d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2367_c7_d8d1]
signal t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_d39a]
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2372_c7_186c]
signal n16_MUX_uxn_opcodes_h_l2372_c7_186c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2372_c7_186c]
signal tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2372_c7_186c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2372_c7_186c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_186c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2372_c7_186c]
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_186c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2372_c7_186c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2372_c7_186c]
signal t16_MUX_uxn_opcodes_h_l2372_c7_186c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2373_c3_3a0b]
signal BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2376_c11_4d37]
signal BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2376_c7_b21a]
signal n16_MUX_uxn_opcodes_h_l2376_c7_b21a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2376_c7_b21a]
signal tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2376_c7_b21a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2376_c7_b21a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2376_c7_b21a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2376_c7_b21a]
signal result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2376_c7_b21a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2376_c7_b21a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2380_c11_7f25]
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2380_c7_d247]
signal n16_MUX_uxn_opcodes_h_l2380_c7_d247_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2380_c7_d247_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2380_c7_d247]
signal tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2380_c7_d247]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2380_c7_d247]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2380_c7_d247]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2380_c7_d247]
signal result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2380_c7_d247]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2380_c7_d247]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2381_c3_16f4]
signal BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2382_c11_552e]
signal BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2384_c30_9384]
signal sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2389_c11_c78f]
signal BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2389_c7_4d5f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2389_c7_4d5f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2389_c7_4d5f]
signal result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2389_c7_4d5f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2389_c7_4d5f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2392_c31_83cd]
signal CONST_SR_8_uxn_opcodes_h_l2392_c31_83cd_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2392_c31_83cd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2394_c11_d902]
signal BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2394_c7_944e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2394_c7_944e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2378_l2369_DUPLICATE_ce2a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2378_l2369_DUPLICATE_ce2a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2378_l2369_DUPLICATE_ce2a_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c551( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c
BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_left,
BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_right,
BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_return_output);

-- n16_MUX_uxn_opcodes_h_l2359_c2_b539
n16_MUX_uxn_opcodes_h_l2359_c2_b539 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2359_c2_b539_cond,
n16_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue,
n16_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse,
n16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2359_c2_b539
tmp16_MUX_uxn_opcodes_h_l2359_c2_b539 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_cond,
tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue,
tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse,
tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539
result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539
result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539
result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_cond,
result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539
result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539
result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_return_output);

-- t16_MUX_uxn_opcodes_h_l2359_c2_b539
t16_MUX_uxn_opcodes_h_l2359_c2_b539 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2359_c2_b539_cond,
t16_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue,
t16_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse,
t16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output);

-- printf_uxn_opcodes_h_l2360_c3_929e_uxn_opcodes_h_l2360_c3_929e
printf_uxn_opcodes_h_l2360_c3_929e_uxn_opcodes_h_l2360_c3_929e : entity work.printf_uxn_opcodes_h_l2360_c3_929e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2360_c3_929e_uxn_opcodes_h_l2360_c3_929e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_left,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_right,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_return_output);

-- n16_MUX_uxn_opcodes_h_l2364_c7_30e0
n16_MUX_uxn_opcodes_h_l2364_c7_30e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2364_c7_30e0_cond,
n16_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue,
n16_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse,
n16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0
tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_cond,
tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output);

-- t16_MUX_uxn_opcodes_h_l2364_c7_30e0
t16_MUX_uxn_opcodes_h_l2364_c7_30e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2364_c7_30e0_cond,
t16_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue,
t16_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse,
t16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69
BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_left,
BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_right,
BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_return_output);

-- n16_MUX_uxn_opcodes_h_l2367_c7_d8d1
n16_MUX_uxn_opcodes_h_l2367_c7_d8d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond,
n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue,
n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse,
n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1
tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond,
tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1
result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output);

-- t16_MUX_uxn_opcodes_h_l2367_c7_d8d1
t16_MUX_uxn_opcodes_h_l2367_c7_d8d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond,
t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue,
t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse,
t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_left,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_right,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_return_output);

-- n16_MUX_uxn_opcodes_h_l2372_c7_186c
n16_MUX_uxn_opcodes_h_l2372_c7_186c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2372_c7_186c_cond,
n16_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue,
n16_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse,
n16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2372_c7_186c
tmp16_MUX_uxn_opcodes_h_l2372_c7_186c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_cond,
tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_return_output);

-- t16_MUX_uxn_opcodes_h_l2372_c7_186c
t16_MUX_uxn_opcodes_h_l2372_c7_186c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2372_c7_186c_cond,
t16_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue,
t16_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse,
t16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b
BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b_left,
BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b_right,
BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37
BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_left,
BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_right,
BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_return_output);

-- n16_MUX_uxn_opcodes_h_l2376_c7_b21a
n16_MUX_uxn_opcodes_h_l2376_c7_b21a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2376_c7_b21a_cond,
n16_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue,
n16_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse,
n16_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a
tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_cond,
tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a
result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a
result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_left,
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_right,
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_return_output);

-- n16_MUX_uxn_opcodes_h_l2380_c7_d247
n16_MUX_uxn_opcodes_h_l2380_c7_d247 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2380_c7_d247_cond,
n16_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue,
n16_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse,
n16_MUX_uxn_opcodes_h_l2380_c7_d247_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2380_c7_d247
tmp16_MUX_uxn_opcodes_h_l2380_c7_d247 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_cond,
tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue,
tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse,
tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247
result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_cond,
result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4
BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4_left,
BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4_right,
BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e
BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e_left,
BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e_right,
BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2384_c30_9384
sp_relative_shift_uxn_opcodes_h_l2384_c30_9384 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_ins,
sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_x,
sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_y,
sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f
BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_left,
BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_right,
BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f
result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f
result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f
result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f
result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2392_c31_83cd
CONST_SR_8_uxn_opcodes_h_l2392_c31_83cd : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2392_c31_83cd_x,
CONST_SR_8_uxn_opcodes_h_l2392_c31_83cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902
BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902_left,
BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902_right,
BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e
result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e
result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2378_l2369_DUPLICATE_ce2a
CONST_SL_8_uint16_t_uxn_opcodes_h_l2378_l2369_DUPLICATE_ce2a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2378_l2369_DUPLICATE_ce2a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2378_l2369_DUPLICATE_ce2a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_return_output,
 n16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output,
 tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_return_output,
 t16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_return_output,
 n16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output,
 t16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_return_output,
 n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output,
 t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_return_output,
 n16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_return_output,
 t16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_return_output,
 n16_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_return_output,
 n16_MUX_uxn_opcodes_h_l2380_c7_d247_return_output,
 tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e_return_output,
 sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output,
 CONST_SR_8_uxn_opcodes_h_l2392_c31_83cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2378_l2369_DUPLICATE_ce2a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2359_c2_b539_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2361_c3_ad53 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2359_c2_b539_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2360_c3_929e_uxn_opcodes_h_l2360_c3_929e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2364_c7_30e0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2365_c3_e916 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2364_c7_30e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_718a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2372_c7_186c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2374_c3_c180 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_186c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2380_c7_d247_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2376_c7_b21a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2380_c7_d247_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2386_c3_6f86 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2387_c21_2fa7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2391_c3_c7d4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2392_c31_83cd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2392_c31_83cd_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2392_c21_dbc3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2394_l2359_l2389_l2376_DUPLICATE_5b09_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2380_l2376_DUPLICATE_a0f3_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2389_l2376_DUPLICATE_251c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2389_l2376_DUPLICATE_516e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2394_l2389_l2380_l2376_DUPLICATE_beeb_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2377_l2381_l2368_DUPLICATE_9394_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2378_l2369_DUPLICATE_ce2a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2378_l2369_DUPLICATE_ce2a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2389_l2376_DUPLICATE_d545_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2355_l2399_DUPLICATE_7eff_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_718a := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_718a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2361_c3_ad53 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2361_c3_ad53;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2386_c3_6f86 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2386_c3_6f86;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2374_c3_c180 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2374_c3_c180;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2365_c3_e916 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2365_c3_e916;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2391_c3_c7d4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2391_c3_c7d4;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2392_c31_83cd_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2389_l2376_DUPLICATE_251c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2389_l2376_DUPLICATE_251c_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2389_l2376_DUPLICATE_516e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2389_l2376_DUPLICATE_516e_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2394_l2389_l2380_l2376_DUPLICATE_beeb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2394_l2389_l2380_l2376_DUPLICATE_beeb_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2377_l2381_l2368_DUPLICATE_9394 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2377_l2381_l2368_DUPLICATE_9394_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_348c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_d39a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2359_c6_c78c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2376_c11_4d37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_left;
     BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_return_output := BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2392_c31_83cd] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2392_c31_83cd_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2392_c31_83cd_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2392_c31_83cd_return_output := CONST_SR_8_uxn_opcodes_h_l2392_c31_83cd_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2380_l2376_DUPLICATE_a0f3 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2380_l2376_DUPLICATE_a0f3_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l2384_c30_9384] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_ins;
     sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_x;
     sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_return_output := sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2394_c11_d902] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902_left;
     BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902_return_output := BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2367_c11_3d69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_left;
     BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_return_output := BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2394_l2359_l2389_l2376_DUPLICATE_5b09 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2394_l2359_l2389_l2376_DUPLICATE_5b09_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2389_c11_c78f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2389_l2376_DUPLICATE_d545 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2389_l2376_DUPLICATE_d545_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2380_c11_7f25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_left;
     BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_return_output := BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2359_c2_b539_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2359_c2_b539_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c6_c78c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2364_c7_30e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2364_c7_30e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_348c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_3d69_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2372_c7_186c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_186c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_d39a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2376_c7_b21a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_4d37_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2380_c7_d247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_7f25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_c78f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_d902_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2377_l2381_l2368_DUPLICATE_9394_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2377_l2381_l2368_DUPLICATE_9394_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2378_l2369_DUPLICATE_ce2a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2377_l2381_l2368_DUPLICATE_9394_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2380_l2376_DUPLICATE_a0f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2380_l2376_DUPLICATE_a0f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2380_l2376_DUPLICATE_a0f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2380_l2376_DUPLICATE_a0f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2380_l2376_DUPLICATE_a0f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2380_l2376_DUPLICATE_a0f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2394_l2389_l2380_l2376_DUPLICATE_beeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2394_l2389_l2380_l2376_DUPLICATE_beeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2394_l2389_l2380_l2376_DUPLICATE_beeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2394_l2389_l2380_l2376_DUPLICATE_beeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2394_l2389_l2380_l2376_DUPLICATE_beeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2394_l2389_l2380_l2376_DUPLICATE_beeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2394_l2389_l2380_l2376_DUPLICATE_beeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2389_l2376_DUPLICATE_516e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2389_l2376_DUPLICATE_516e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2389_l2376_DUPLICATE_516e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2389_l2376_DUPLICATE_516e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2389_l2376_DUPLICATE_516e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2389_l2376_DUPLICATE_516e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2394_l2359_l2389_l2376_DUPLICATE_5b09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2394_l2359_l2389_l2376_DUPLICATE_5b09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2394_l2359_l2389_l2376_DUPLICATE_5b09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2394_l2359_l2389_l2376_DUPLICATE_5b09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2394_l2359_l2389_l2376_DUPLICATE_5b09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2394_l2359_l2389_l2376_DUPLICATE_5b09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2394_l2359_l2389_l2376_DUPLICATE_5b09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2389_l2376_DUPLICATE_d545_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2389_l2376_DUPLICATE_d545_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2389_l2376_DUPLICATE_251c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2389_l2376_DUPLICATE_251c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2389_l2376_DUPLICATE_251c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2389_l2376_DUPLICATE_251c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2389_l2376_DUPLICATE_251c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2372_l2367_l2364_l2359_l2389_l2376_DUPLICATE_251c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9384_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2394_c7_944e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2394_c7_944e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2359_c1_ec9e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2381_c3_16f4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4_left;
     BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4_return_output := BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2380_c7_d247] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2373_c3_3a0b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b_left;
     BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b_return_output := BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2392_c21_dbc3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2392_c21_dbc3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2392_c31_83cd_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2389_c7_4d5f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2389_c7_4d5f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2378_l2369_DUPLICATE_ce2a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2378_l2369_DUPLICATE_ce2a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2378_l2369_DUPLICATE_ce2a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2378_l2369_DUPLICATE_ce2a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2378_l2369_DUPLICATE_ce2a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2373_c3_3a0b_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_16f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2392_c21_dbc3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2378_l2369_DUPLICATE_ce2a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2378_l2369_DUPLICATE_ce2a_return_output;
     VAR_printf_uxn_opcodes_h_l2360_c3_929e_uxn_opcodes_h_l2360_c3_929e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2359_c1_ec9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_944e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_944e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_d247_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2380_c7_d247] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2389_c7_4d5f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2389_c7_4d5f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2376_c7_b21a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2389_c7_4d5f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2372_c7_186c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2372_c7_186c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_186c_cond;
     t16_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue;
     t16_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output := t16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2382_c11_552e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2380_c7_d247] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2380_c7_d247_cond <= VAR_n16_MUX_uxn_opcodes_h_l2380_c7_d247_cond;
     n16_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue;
     n16_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2380_c7_d247_return_output := n16_MUX_uxn_opcodes_h_l2380_c7_d247_return_output;

     -- printf_uxn_opcodes_h_l2360_c3_929e[uxn_opcodes_h_l2360_c3_929e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2360_c3_929e_uxn_opcodes_h_l2360_c3_929e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2360_c3_929e_uxn_opcodes_h_l2360_c3_929e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2380_c7_d247] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2380_c7_d247_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_d247_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_d247_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_4d5f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output;
     -- n16_MUX[uxn_opcodes_h_l2376_c7_b21a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2376_c7_b21a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2376_c7_b21a_cond;
     n16_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue;
     n16_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output := n16_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2380_c7_d247] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_return_output;

     -- t16_MUX[uxn_opcodes_h_l2367_c7_d8d1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond;
     t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue;
     t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output := t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2376_c7_b21a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2380_c7_d247] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_cond;
     tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_return_output := tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2380_c7_d247] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_186c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2387_c21_2fa7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2387_c21_2fa7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2382_c11_552e_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2376_c7_b21a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2387_c21_2fa7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_d247_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_d247_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_186c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2380_c7_d247_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2380_c7_d247] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_return_output := result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2372_c7_186c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2372_c7_186c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2372_c7_186c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2372_c7_186c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2372_c7_186c_cond;
     n16_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue;
     n16_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output := n16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2376_c7_b21a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2367_c7_d8d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2376_c7_b21a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_cond;
     tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output := tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2376_c7_b21a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2364_c7_30e0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2364_c7_30e0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2364_c7_30e0_cond;
     t16_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue;
     t16_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output := t16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_186c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_186c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2380_c7_d247_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2367_c7_d8d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_30e0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2376_c7_b21a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2372_c7_186c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2359_c2_b539] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2359_c2_b539_cond <= VAR_t16_MUX_uxn_opcodes_h_l2359_c2_b539_cond;
     t16_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue;
     t16_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output := t16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_186c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2367_c7_d8d1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond;
     n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue;
     n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output := n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2367_c7_d8d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2372_c7_186c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_cond;
     tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output := tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_186c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_186c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2376_c7_b21a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2372_c7_186c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2364_c7_30e0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2367_c7_d8d1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond;
     tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output := tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2367_c7_d8d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2359_c2_b539] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2364_c7_30e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2364_c7_30e0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2364_c7_30e0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2364_c7_30e0_cond;
     n16_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue;
     n16_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output := n16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2372_c7_186c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2367_c7_d8d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2372_c7_186c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2359_c2_b539] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2364_c7_30e0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_30e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2359_c2_b539] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2359_c2_b539_cond <= VAR_n16_MUX_uxn_opcodes_h_l2359_c2_b539_cond;
     n16_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue;
     n16_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output := n16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2367_c7_d8d1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2364_c7_30e0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_cond;
     tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output := tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2359_c2_b539] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2367_c7_d8d1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2359_c2_b539] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_cond;
     tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output := tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2359_c2_b539] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2364_c7_30e0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2359_c2_b539] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_30e0_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2359_c2_b539_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2359_c2_b539] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_return_output := result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2355_l2399_DUPLICATE_7eff LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2355_l2399_DUPLICATE_7eff_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c551(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c2_b539_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c2_b539_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c2_b539_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c2_b539_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c2_b539_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c2_b539_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2355_l2399_DUPLICATE_7eff_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2355_l2399_DUPLICATE_7eff_return_output;
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
