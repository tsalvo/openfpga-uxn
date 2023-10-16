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
-- Submodules: 89
entity sft2_0CLK_4392568d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_4392568d;
architecture arch of sft2_0CLK_4392568d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2387_c6_5580]
signal BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2387_c1_2cea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2387_c2_f861]
signal n16_MUX_uxn_opcodes_h_l2387_c2_f861_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2387_c2_f861_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2387_c2_f861]
signal tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2387_c2_f861]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2387_c2_f861]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2387_c2_f861]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2387_c2_f861]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2387_c2_f861]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2387_c2_f861]
signal result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2387_c2_f861]
signal t8_MUX_uxn_opcodes_h_l2387_c2_f861_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2387_c2_f861_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2388_c3_c571[uxn_opcodes_h_l2388_c3_c571]
signal printf_uxn_opcodes_h_l2388_c3_c571_uxn_opcodes_h_l2388_c3_c571_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2392_c11_9f26]
signal BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2392_c7_473a]
signal n16_MUX_uxn_opcodes_h_l2392_c7_473a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2392_c7_473a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2392_c7_473a]
signal tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2392_c7_473a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2392_c7_473a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2392_c7_473a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2392_c7_473a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2392_c7_473a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2392_c7_473a]
signal result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2392_c7_473a]
signal t8_MUX_uxn_opcodes_h_l2392_c7_473a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2392_c7_473a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2395_c11_54f7]
signal BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2395_c7_58db]
signal n16_MUX_uxn_opcodes_h_l2395_c7_58db_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2395_c7_58db_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2395_c7_58db]
signal tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2395_c7_58db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2395_c7_58db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2395_c7_58db]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2395_c7_58db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2395_c7_58db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2395_c7_58db]
signal result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2395_c7_58db]
signal t8_MUX_uxn_opcodes_h_l2395_c7_58db_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2395_c7_58db_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2399_c11_aeb2]
signal BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2399_c7_d9e9]
signal n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2399_c7_d9e9]
signal tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2399_c7_d9e9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2399_c7_d9e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2399_c7_d9e9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2399_c7_d9e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2399_c7_d9e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2399_c7_d9e9]
signal result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2402_c11_b858]
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2402_c7_d9ae]
signal n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2402_c7_d9ae]
signal tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2402_c7_d9ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2402_c7_d9ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2402_c7_d9ae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2402_c7_d9ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2402_c7_d9ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2402_c7_d9ae]
signal result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2404_c3_c480]
signal CONST_SL_8_uxn_opcodes_h_l2404_c3_c480_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2404_c3_c480_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2407_c11_d11a]
signal BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2407_c7_8701]
signal n16_MUX_uxn_opcodes_h_l2407_c7_8701_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2407_c7_8701_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2407_c7_8701]
signal tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2407_c7_8701]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2407_c7_8701]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2407_c7_8701]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2407_c7_8701]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2407_c7_8701]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2407_c7_8701]
signal result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2410_c11_757f]
signal BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2410_c7_f4a6]
signal n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2410_c7_f4a6]
signal tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2410_c7_f4a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2410_c7_f4a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2410_c7_f4a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2410_c7_f4a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2410_c7_f4a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2410_c7_f4a6]
signal result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2411_c3_6db6]
signal BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2413_c30_bdfb]
signal sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2414_c20_58dc]
signal BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2414_c12_b440]
signal BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2414_c36_c02b]
signal CONST_SR_4_uxn_opcodes_h_l2414_c36_c02b_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2414_c36_c02b_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2414_c12_5a8f]
signal BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2419_c11_d83f]
signal BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2419_c7_99f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2419_c7_99f0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2419_c7_99f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2419_c7_99f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2419_c7_99f0]
signal result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2422_c31_ff5f]
signal CONST_SR_8_uxn_opcodes_h_l2422_c31_ff5f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2422_c31_ff5f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2424_c11_b23b]
signal BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2424_c7_5bec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2424_c7_5bec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8cda( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580
BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_left,
BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_right,
BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_return_output);

-- n16_MUX_uxn_opcodes_h_l2387_c2_f861
n16_MUX_uxn_opcodes_h_l2387_c2_f861 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2387_c2_f861_cond,
n16_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue,
n16_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse,
n16_MUX_uxn_opcodes_h_l2387_c2_f861_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2387_c2_f861
tmp16_MUX_uxn_opcodes_h_l2387_c2_f861 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_cond,
tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue,
tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse,
tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861
result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861
result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861
result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_cond,
result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_return_output);

-- t8_MUX_uxn_opcodes_h_l2387_c2_f861
t8_MUX_uxn_opcodes_h_l2387_c2_f861 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2387_c2_f861_cond,
t8_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue,
t8_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse,
t8_MUX_uxn_opcodes_h_l2387_c2_f861_return_output);

-- printf_uxn_opcodes_h_l2388_c3_c571_uxn_opcodes_h_l2388_c3_c571
printf_uxn_opcodes_h_l2388_c3_c571_uxn_opcodes_h_l2388_c3_c571 : entity work.printf_uxn_opcodes_h_l2388_c3_c571_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2388_c3_c571_uxn_opcodes_h_l2388_c3_c571_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26
BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_left,
BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_right,
BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_return_output);

-- n16_MUX_uxn_opcodes_h_l2392_c7_473a
n16_MUX_uxn_opcodes_h_l2392_c7_473a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2392_c7_473a_cond,
n16_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue,
n16_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse,
n16_MUX_uxn_opcodes_h_l2392_c7_473a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2392_c7_473a
tmp16_MUX_uxn_opcodes_h_l2392_c7_473a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_cond,
tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a
result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a
result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a
result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a
result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_return_output);

-- t8_MUX_uxn_opcodes_h_l2392_c7_473a
t8_MUX_uxn_opcodes_h_l2392_c7_473a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2392_c7_473a_cond,
t8_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue,
t8_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse,
t8_MUX_uxn_opcodes_h_l2392_c7_473a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_left,
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_right,
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_return_output);

-- n16_MUX_uxn_opcodes_h_l2395_c7_58db
n16_MUX_uxn_opcodes_h_l2395_c7_58db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2395_c7_58db_cond,
n16_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue,
n16_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse,
n16_MUX_uxn_opcodes_h_l2395_c7_58db_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2395_c7_58db
tmp16_MUX_uxn_opcodes_h_l2395_c7_58db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_cond,
tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue,
tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse,
tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db
result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db
result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db
result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_cond,
result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_return_output);

-- t8_MUX_uxn_opcodes_h_l2395_c7_58db
t8_MUX_uxn_opcodes_h_l2395_c7_58db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2395_c7_58db_cond,
t8_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue,
t8_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse,
t8_MUX_uxn_opcodes_h_l2395_c7_58db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_left,
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_right,
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_return_output);

-- n16_MUX_uxn_opcodes_h_l2399_c7_d9e9
n16_MUX_uxn_opcodes_h_l2399_c7_d9e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond,
n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue,
n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse,
n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9
tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond,
tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9
result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9
result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_left,
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_right,
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_return_output);

-- n16_MUX_uxn_opcodes_h_l2402_c7_d9ae
n16_MUX_uxn_opcodes_h_l2402_c7_d9ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond,
n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue,
n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse,
n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae
tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond,
tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue,
tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse,
tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond,
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2404_c3_c480
CONST_SL_8_uxn_opcodes_h_l2404_c3_c480 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2404_c3_c480_x,
CONST_SL_8_uxn_opcodes_h_l2404_c3_c480_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a
BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_left,
BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_right,
BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_return_output);

-- n16_MUX_uxn_opcodes_h_l2407_c7_8701
n16_MUX_uxn_opcodes_h_l2407_c7_8701 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2407_c7_8701_cond,
n16_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue,
n16_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse,
n16_MUX_uxn_opcodes_h_l2407_c7_8701_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2407_c7_8701
tmp16_MUX_uxn_opcodes_h_l2407_c7_8701 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_cond,
tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue,
tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse,
tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701
result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701
result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701
result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701
result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701
result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_cond,
result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f
BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_left,
BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_right,
BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_return_output);

-- n16_MUX_uxn_opcodes_h_l2410_c7_f4a6
n16_MUX_uxn_opcodes_h_l2410_c7_f4a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond,
n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue,
n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse,
n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6
tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond,
tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6
result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6
result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6
result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6
result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6
BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6_left,
BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6_right,
BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb
sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_ins,
sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_x,
sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_y,
sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc
BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc_left,
BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc_right,
BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440
BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440_left,
BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440_right,
BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2414_c36_c02b
CONST_SR_4_uxn_opcodes_h_l2414_c36_c02b : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2414_c36_c02b_x,
CONST_SR_4_uxn_opcodes_h_l2414_c36_c02b_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f
BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f_left,
BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f_right,
BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f
BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_left,
BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_right,
BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0
result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0
result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0
result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0
result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2422_c31_ff5f
CONST_SR_8_uxn_opcodes_h_l2422_c31_ff5f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2422_c31_ff5f_x,
CONST_SR_8_uxn_opcodes_h_l2422_c31_ff5f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b
BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b_left,
BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b_right,
BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_return_output,
 n16_MUX_uxn_opcodes_h_l2387_c2_f861_return_output,
 tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_return_output,
 t8_MUX_uxn_opcodes_h_l2387_c2_f861_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_return_output,
 n16_MUX_uxn_opcodes_h_l2392_c7_473a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_return_output,
 t8_MUX_uxn_opcodes_h_l2392_c7_473a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_return_output,
 n16_MUX_uxn_opcodes_h_l2395_c7_58db_return_output,
 tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_return_output,
 t8_MUX_uxn_opcodes_h_l2395_c7_58db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_return_output,
 n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_return_output,
 n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output,
 tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output,
 CONST_SL_8_uxn_opcodes_h_l2404_c3_c480_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_return_output,
 n16_MUX_uxn_opcodes_h_l2407_c7_8701_return_output,
 tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_return_output,
 n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output,
 tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6_return_output,
 sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440_return_output,
 CONST_SR_4_uxn_opcodes_h_l2414_c36_c02b_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output,
 CONST_SR_8_uxn_opcodes_h_l2422_c31_ff5f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2392_c7_473a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2387_c2_f861_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2387_c2_f861_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2389_c3_7b5c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2392_c7_473a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2387_c2_f861_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2387_c2_f861_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2388_c3_c571_uxn_opcodes_h_l2388_c3_c571_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2395_c7_58db_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2392_c7_473a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2393_c3_2c9b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2395_c7_58db_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2392_c7_473a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2395_c7_58db_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2397_c3_e390 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2395_c7_58db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2400_c3_5d57 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2407_c7_8701_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2405_c3_5337 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2404_c3_c480_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2404_c3_c480_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2407_c7_8701_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2408_c3_277a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2416_c3_6429 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2414_c36_c02b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2414_c36_c02b_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2417_c21_7c8e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_bd54 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2419_c7_99f0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2422_c31_ff5f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2422_c31_ff5f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2422_c21_ef38_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2387_l2410_l2407_l2402_l2399_l2395_l2392_DUPLICATE_857e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2392_DUPLICATE_2c9d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_c799_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2392_DUPLICATE_03cd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2410_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_3d41_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2403_l2411_DUPLICATE_66b5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2382_l2429_DUPLICATE_b628_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_bd54 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_bd54;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2389_c3_7b5c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2389_c3_7b5c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2416_c3_6429 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2416_c3_6429;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2393_c3_2c9b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2393_c3_2c9b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2400_c3_5d57 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2400_c3_5d57;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2408_c3_277a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2408_c3_277a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2405_c3_5337 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2405_c3_5337;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2397_c3_e390 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2397_c3_e390;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2414_c36_c02b_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2422_c31_ff5f_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2410_c11_757f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2422_c31_ff5f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2422_c31_ff5f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2422_c31_ff5f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2422_c31_ff5f_return_output := CONST_SR_8_uxn_opcodes_h_l2422_c31_ff5f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2402_c11_b858] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_left;
     BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_return_output := BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2387_l2410_l2407_l2402_l2399_l2395_l2392_DUPLICATE_857e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2387_l2410_l2407_l2402_l2399_l2395_l2392_DUPLICATE_857e_return_output := result.sp_relative_shift;

     -- CONST_SR_4[uxn_opcodes_h_l2414_c36_c02b] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2414_c36_c02b_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2414_c36_c02b_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2414_c36_c02b_return_output := CONST_SR_4_uxn_opcodes_h_l2414_c36_c02b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2399_c11_aeb2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2392_DUPLICATE_03cd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2392_DUPLICATE_03cd_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2392_c11_9f26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_left;
     BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_return_output := BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2410_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_3d41 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2410_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_3d41_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_c799 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_c799_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2424_c11_b23b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2414_c20_58dc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc_left;
     BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc_return_output := BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2392_DUPLICATE_2c9d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2392_DUPLICATE_2c9d_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2407_c11_d11a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2419_c11_d83f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2413_c30_bdfb] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_ins;
     sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_x;
     sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_return_output := sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2419_c7_99f0] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2419_c7_99f0_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2403_l2411_DUPLICATE_66b5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2403_l2411_DUPLICATE_66b5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2395_c11_54f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2387_c6_5580] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_left;
     BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_return_output := BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2414_c20_58dc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2387_c2_f861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2387_c2_f861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_5580_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2392_c7_473a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2392_c7_473a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2392_c11_9f26_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2395_c7_58db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2395_c7_58db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_54f7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_aeb2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_b858_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2407_c7_8701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2407_c11_d11a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2410_c11_757f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_d83f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_b23b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2403_l2411_DUPLICATE_66b5_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2404_c3_c480_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2403_l2411_DUPLICATE_66b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2387_l2410_l2407_l2402_l2399_l2395_l2392_DUPLICATE_857e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2387_l2410_l2407_l2402_l2399_l2395_l2392_DUPLICATE_857e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2387_l2410_l2407_l2402_l2399_l2395_l2392_DUPLICATE_857e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2387_l2410_l2407_l2402_l2399_l2395_l2392_DUPLICATE_857e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2387_l2410_l2407_l2402_l2399_l2395_l2392_DUPLICATE_857e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2387_l2410_l2407_l2402_l2399_l2395_l2392_DUPLICATE_857e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2387_l2410_l2407_l2402_l2399_l2395_l2392_DUPLICATE_857e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2410_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_3d41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2410_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_3d41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2410_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_3d41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2410_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_3d41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2410_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_3d41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2410_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_3d41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2410_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_3d41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2410_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_3d41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2392_DUPLICATE_2c9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2392_DUPLICATE_2c9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2392_DUPLICATE_2c9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2392_DUPLICATE_2c9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2392_DUPLICATE_2c9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2392_DUPLICATE_2c9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2392_DUPLICATE_2c9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_c799_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_c799_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_c799_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_c799_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_c799_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_c799_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_c799_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2424_l2392_DUPLICATE_c799_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2392_DUPLICATE_03cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2392_DUPLICATE_03cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2392_DUPLICATE_03cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2392_DUPLICATE_03cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2392_DUPLICATE_03cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2392_DUPLICATE_03cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2419_l2387_l2407_l2402_l2399_l2395_l2392_DUPLICATE_03cd_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f_right := VAR_CONST_SR_4_uxn_opcodes_h_l2414_c36_c02b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2419_c7_99f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2413_c30_bdfb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2419_c7_99f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output;

     -- t8_MUX[uxn_opcodes_h_l2395_c7_58db] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2395_c7_58db_cond <= VAR_t8_MUX_uxn_opcodes_h_l2395_c7_58db_cond;
     t8_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue;
     t8_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2395_c7_58db_return_output := t8_MUX_uxn_opcodes_h_l2395_c7_58db_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2411_c3_6db6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6_left;
     BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6_return_output := BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2387_c1_2cea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2404_c3_c480] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2404_c3_c480_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2404_c3_c480_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2404_c3_c480_return_output := CONST_SL_8_uxn_opcodes_h_l2404_c3_c480_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2424_c7_5bec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2422_c21_ef38] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2422_c21_ef38_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2422_c31_ff5f_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2424_c7_5bec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2410_c7_f4a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2419_c7_99f0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2411_c3_6db6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2422_c21_ef38_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2404_c3_c480_return_output;
     VAR_printf_uxn_opcodes_h_l2388_c3_c571_uxn_opcodes_h_l2388_c3_c571_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2387_c1_2cea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_5bec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_5bec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2395_c7_58db_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2407_c7_8701] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2419_c7_99f0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2414_c12_b440] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440_left;
     BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440_return_output := BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440_return_output;

     -- n16_MUX[uxn_opcodes_h_l2410_c7_f4a6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond;
     n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue;
     n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output := n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2410_c7_f4a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output;

     -- t8_MUX[uxn_opcodes_h_l2392_c7_473a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2392_c7_473a_cond <= VAR_t8_MUX_uxn_opcodes_h_l2392_c7_473a_cond;
     t8_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue;
     t8_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2392_c7_473a_return_output := t8_MUX_uxn_opcodes_h_l2392_c7_473a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2419_c7_99f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output;

     -- printf_uxn_opcodes_h_l2388_c3_c571[uxn_opcodes_h_l2388_c3_c571] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2388_c3_c571_uxn_opcodes_h_l2388_c3_c571_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2388_c3_c571_uxn_opcodes_h_l2388_c3_c571_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2410_c7_f4a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2419_c7_99f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2414_c12_b440_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2407_c7_8701_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2419_c7_99f0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2392_c7_473a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2410_c7_f4a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2402_c7_d9ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2407_c7_8701] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2410_c7_f4a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2407_c7_8701] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2407_c7_8701_cond <= VAR_n16_MUX_uxn_opcodes_h_l2407_c7_8701_cond;
     n16_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue;
     n16_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2407_c7_8701_return_output := n16_MUX_uxn_opcodes_h_l2407_c7_8701_return_output;

     -- t8_MUX[uxn_opcodes_h_l2387_c2_f861] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2387_c2_f861_cond <= VAR_t8_MUX_uxn_opcodes_h_l2387_c2_f861_cond;
     t8_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue;
     t8_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2387_c2_f861_return_output := t8_MUX_uxn_opcodes_h_l2387_c2_f861_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2407_c7_8701] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2414_c12_5a8f] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f_left;
     BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f_return_output := BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2407_c7_8701_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2407_c7_8701_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2407_c7_8701_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2387_c2_f861_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2407_c7_8701] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2402_c7_d9ae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2417_c21_7c8e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2417_c21_7c8e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2414_c12_5a8f_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2399_c7_d9e9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2402_c7_d9ae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond <= VAR_n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond;
     n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue;
     n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output := n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2410_c7_f4a6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond;
     tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output := tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2407_c7_8701] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2402_c7_d9ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2417_c21_7c8e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2407_c7_8701_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2407_c7_8701_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2402_c7_d9ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2407_c7_8701] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_cond;
     tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_return_output := tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2399_c7_d9e9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2399_c7_d9e9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond;
     n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue;
     n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output := n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2395_c7_58db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2399_c7_d9e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2402_c7_d9ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2410_c7_f4a6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2395_c7_58db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2410_c7_f4a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2407_c7_8701_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2399_c7_d9e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2407_c7_8701] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_return_output := result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2395_c7_58db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2399_c7_d9e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2392_c7_473a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2395_c7_58db] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_return_output;

     -- n16_MUX[uxn_opcodes_h_l2395_c7_58db] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2395_c7_58db_cond <= VAR_n16_MUX_uxn_opcodes_h_l2395_c7_58db_cond;
     n16_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue;
     n16_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2395_c7_58db_return_output := n16_MUX_uxn_opcodes_h_l2395_c7_58db_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2402_c7_d9ae] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond;
     tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output := tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2395_c7_58db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_58db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2392_c7_473a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_58db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2407_c7_8701_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2387_c2_f861] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2395_c7_58db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2392_c7_473a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2392_c7_473a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2392_c7_473a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2392_c7_473a_cond;
     n16_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue;
     n16_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2392_c7_473a_return_output := n16_MUX_uxn_opcodes_h_l2392_c7_473a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2395_c7_58db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2392_c7_473a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2402_c7_d9ae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output := result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2399_c7_d9e9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond;
     tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output := tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2392_c7_473a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_58db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2392_c7_473a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_58db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2392_c7_473a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_d9ae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output;
     -- n16_MUX[uxn_opcodes_h_l2387_c2_f861] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2387_c2_f861_cond <= VAR_n16_MUX_uxn_opcodes_h_l2387_c2_f861_cond;
     n16_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue;
     n16_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2387_c2_f861_return_output := n16_MUX_uxn_opcodes_h_l2387_c2_f861_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2392_c7_473a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2392_c7_473a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2399_c7_d9e9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2395_c7_58db] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_cond;
     tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_return_output := tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2387_c2_f861] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2387_c2_f861] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2387_c2_f861_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2392_c7_473a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2392_c7_473a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_d9e9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2395_c7_58db_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2392_c7_473a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_cond;
     tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_return_output := tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2387_c2_f861] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2387_c2_f861] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2395_c7_58db] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_return_output := result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2395_c7_58db_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2392_c7_473a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2392_c7_473a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2387_c2_f861] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_cond;
     tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_return_output := tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_return_output;

     -- Submodule level 11
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2392_c7_473a_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2387_c2_f861_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2387_c2_f861] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_return_output := result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2382_l2429_DUPLICATE_b628 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2382_l2429_DUPLICATE_b628_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_f861_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_f861_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2387_c2_f861_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_f861_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_f861_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_f861_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2382_l2429_DUPLICATE_b628_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2382_l2429_DUPLICATE_b628_return_output;
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
