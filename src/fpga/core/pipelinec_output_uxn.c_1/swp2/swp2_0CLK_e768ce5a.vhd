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
-- Submodules: 86
entity swp2_0CLK_e768ce5a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_e768ce5a;
architecture arch of swp2_0CLK_e768ce5a is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2442_c6_317a]
signal BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2442_c1_328f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2442_c2_1e24]
signal n16_MUX_uxn_opcodes_h_l2442_c2_1e24_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2442_c2_1e24]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2442_c2_1e24]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2442_c2_1e24]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2442_c2_1e24]
signal result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2442_c2_1e24]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2442_c2_1e24]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2442_c2_1e24]
signal t16_MUX_uxn_opcodes_h_l2442_c2_1e24_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2443_c3_c066[uxn_opcodes_h_l2443_c3_c066]
signal printf_uxn_opcodes_h_l2443_c3_c066_uxn_opcodes_h_l2443_c3_c066_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2447_c11_d44e]
signal BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2447_c7_d7d8]
signal n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2447_c7_d7d8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2447_c7_d7d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2447_c7_d7d8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2447_c7_d7d8]
signal result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2447_c7_d7d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2447_c7_d7d8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2447_c7_d7d8]
signal t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2450_c11_daf2]
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2450_c7_77ca]
signal n16_MUX_uxn_opcodes_h_l2450_c7_77ca_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2450_c7_77ca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2450_c7_77ca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2450_c7_77ca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2450_c7_77ca]
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2450_c7_77ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2450_c7_77ca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2450_c7_77ca]
signal t16_MUX_uxn_opcodes_h_l2450_c7_77ca_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2455_c11_c80e]
signal BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2455_c7_09c0]
signal n16_MUX_uxn_opcodes_h_l2455_c7_09c0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2455_c7_09c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2455_c7_09c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2455_c7_09c0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2455_c7_09c0]
signal result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2455_c7_09c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2455_c7_09c0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2455_c7_09c0]
signal t16_MUX_uxn_opcodes_h_l2455_c7_09c0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2456_c3_6e4c]
signal BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2459_c11_688e]
signal BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2459_c7_409f]
signal n16_MUX_uxn_opcodes_h_l2459_c7_409f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2459_c7_409f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2459_c7_409f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2459_c7_409f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2459_c7_409f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2459_c7_409f]
signal result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2459_c7_409f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2459_c7_409f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2463_c11_ba5b]
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2463_c7_b31e]
signal n16_MUX_uxn_opcodes_h_l2463_c7_b31e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2463_c7_b31e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2463_c7_b31e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2463_c7_b31e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2463_c7_b31e]
signal result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2463_c7_b31e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2463_c7_b31e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2464_c3_24d7]
signal BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2466_c30_f947]
signal sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2471_c11_60f5]
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2471_c7_89ce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2471_c7_89ce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2471_c7_89ce]
signal result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2471_c7_89ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2471_c7_89ce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2474_c31_4c61]
signal CONST_SR_8_uxn_opcodes_h_l2474_c31_4c61_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2474_c31_4c61_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2476_c11_3aa9]
signal BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2476_c7_6b5f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2476_c7_6b5f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2476_c7_6b5f]
signal result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2476_c7_6b5f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2476_c7_6b5f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2481_c11_78d8]
signal BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2481_c7_e734]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2481_c7_e734]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2481_c7_e734]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2481_c7_e734]
signal result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2483_c31_7ab5]
signal CONST_SR_8_uxn_opcodes_h_l2483_c31_7ab5_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2483_c31_7ab5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2485_c11_cd9e]
signal BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2485_c7_1afd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2485_c7_1afd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2461_l2452_DUPLICATE_5aeb
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2461_l2452_DUPLICATE_5aeb_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2461_l2452_DUPLICATE_5aeb_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a
BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_left,
BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_right,
BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_return_output);

-- n16_MUX_uxn_opcodes_h_l2442_c2_1e24
n16_MUX_uxn_opcodes_h_l2442_c2_1e24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2442_c2_1e24_cond,
n16_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue,
n16_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse,
n16_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24
result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24
result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_cond,
result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output);

-- t16_MUX_uxn_opcodes_h_l2442_c2_1e24
t16_MUX_uxn_opcodes_h_l2442_c2_1e24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2442_c2_1e24_cond,
t16_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue,
t16_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse,
t16_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output);

-- printf_uxn_opcodes_h_l2443_c3_c066_uxn_opcodes_h_l2443_c3_c066
printf_uxn_opcodes_h_l2443_c3_c066_uxn_opcodes_h_l2443_c3_c066 : entity work.printf_uxn_opcodes_h_l2443_c3_c066_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2443_c3_c066_uxn_opcodes_h_l2443_c3_c066_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e
BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_left,
BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_right,
BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_return_output);

-- n16_MUX_uxn_opcodes_h_l2447_c7_d7d8
n16_MUX_uxn_opcodes_h_l2447_c7_d7d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond,
n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue,
n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse,
n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8
result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8
result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8
result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8
result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output);

-- t16_MUX_uxn_opcodes_h_l2447_c7_d7d8
t16_MUX_uxn_opcodes_h_l2447_c7_d7d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond,
t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue,
t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse,
t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2
BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_left,
BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_right,
BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_return_output);

-- n16_MUX_uxn_opcodes_h_l2450_c7_77ca
n16_MUX_uxn_opcodes_h_l2450_c7_77ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2450_c7_77ca_cond,
n16_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue,
n16_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse,
n16_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca
result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_cond,
result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output);

-- t16_MUX_uxn_opcodes_h_l2450_c7_77ca
t16_MUX_uxn_opcodes_h_l2450_c7_77ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2450_c7_77ca_cond,
t16_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue,
t16_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse,
t16_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_left,
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_right,
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_return_output);

-- n16_MUX_uxn_opcodes_h_l2455_c7_09c0
n16_MUX_uxn_opcodes_h_l2455_c7_09c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2455_c7_09c0_cond,
n16_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue,
n16_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse,
n16_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output);

-- t16_MUX_uxn_opcodes_h_l2455_c7_09c0
t16_MUX_uxn_opcodes_h_l2455_c7_09c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2455_c7_09c0_cond,
t16_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue,
t16_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse,
t16_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c
BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c_left,
BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c_right,
BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e
BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_left,
BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_right,
BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_return_output);

-- n16_MUX_uxn_opcodes_h_l2459_c7_409f
n16_MUX_uxn_opcodes_h_l2459_c7_409f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2459_c7_409f_cond,
n16_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue,
n16_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse,
n16_MUX_uxn_opcodes_h_l2459_c7_409f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f
result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f
result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_left,
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_right,
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_return_output);

-- n16_MUX_uxn_opcodes_h_l2463_c7_b31e
n16_MUX_uxn_opcodes_h_l2463_c7_b31e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2463_c7_b31e_cond,
n16_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue,
n16_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse,
n16_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7
BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7_left,
BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7_right,
BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2466_c30_f947
sp_relative_shift_uxn_opcodes_h_l2466_c30_f947 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_ins,
sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_x,
sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_y,
sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_left,
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_right,
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce
result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_cond,
result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2474_c31_4c61
CONST_SR_8_uxn_opcodes_h_l2474_c31_4c61 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2474_c31_4c61_x,
CONST_SR_8_uxn_opcodes_h_l2474_c31_4c61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9
BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_left,
BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_right,
BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f
result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f
result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f
result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f
result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8
BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_left,
BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_right,
BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734
result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734
result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_cond,
result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2483_c31_7ab5
CONST_SR_8_uxn_opcodes_h_l2483_c31_7ab5 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2483_c31_7ab5_x,
CONST_SR_8_uxn_opcodes_h_l2483_c31_7ab5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e
BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e_left,
BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e_right,
BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd
result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd
result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2461_l2452_DUPLICATE_5aeb
CONST_SL_8_uint16_t_uxn_opcodes_h_l2461_l2452_DUPLICATE_5aeb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2461_l2452_DUPLICATE_5aeb_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2461_l2452_DUPLICATE_5aeb_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_return_output,
 n16_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output,
 t16_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_return_output,
 n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output,
 t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_return_output,
 n16_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output,
 t16_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_return_output,
 n16_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output,
 t16_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_return_output,
 n16_MUX_uxn_opcodes_h_l2459_c7_409f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_return_output,
 n16_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7_return_output,
 sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output,
 CONST_SR_8_uxn_opcodes_h_l2474_c31_4c61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_return_output,
 CONST_SR_8_uxn_opcodes_h_l2483_c31_7ab5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2461_l2452_DUPLICATE_5aeb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2442_c2_1e24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2444_c3_42f6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2442_c2_1e24_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2443_c3_c066_uxn_opcodes_h_l2443_c3_c066_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2448_c3_c515 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2450_c7_77ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2453_c3_ecd7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c7_77ca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2459_c7_409f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2455_c7_09c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2457_c3_89eb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2455_c7_09c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2459_c7_409f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_b31e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2468_c3_7d9a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2469_c21_ce66_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2473_c3_3bda : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2474_c31_4c61_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2474_c31_4c61_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2474_c21_a1a8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2478_c3_6040 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2479_c21_9d7c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2482_c3_9a85 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2483_c31_7ab5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2483_c31_7ab5_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2483_c21_f757_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2471_l2459_l2455_l2485_l2450_l2481_DUPLICATE_f530_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2447_l2442_l2463_l2459_l2455_l2450_DUPLICATE_86bb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2447_l2442_l2459_l2455_l2450_l2481_DUPLICATE_b690_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2459_l2455_l2450_DUPLICATE_aeb5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2447_l2476_l2471_l2463_l2459_l2455_l2485_l2450_l2481_DUPLICATE_6ab8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2460_l2464_l2451_l2456_DUPLICATE_0ba7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2461_l2452_DUPLICATE_5aeb_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2461_l2452_DUPLICATE_5aeb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2459_l2481_DUPLICATE_93f8_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2490_l2438_DUPLICATE_1d3d_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2453_c3_ecd7 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2453_c3_ecd7;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2468_c3_7d9a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2468_c3_7d9a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2473_c3_3bda := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2473_c3_3bda;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2448_c3_c515 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2448_c3_c515;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2444_c3_42f6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2444_c3_42f6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2457_c3_89eb := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2457_c3_89eb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e_right := to_unsigned(9, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2482_c3_9a85 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2482_c3_9a85;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2478_c3_6040 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2478_c3_6040;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2474_c31_4c61_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2483_c31_7ab5_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse := t16;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2459_l2481_DUPLICATE_93f8 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2459_l2481_DUPLICATE_93f8_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2481_c11_78d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2471_c11_60f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2485_c11_cd9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2442_c6_317a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2460_l2464_l2451_l2456_DUPLICATE_0ba7 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2460_l2464_l2451_l2456_DUPLICATE_0ba7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2463_c11_ba5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2447_l2476_l2471_l2463_l2459_l2455_l2485_l2450_l2481_DUPLICATE_6ab8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2447_l2476_l2471_l2463_l2459_l2455_l2485_l2450_l2481_DUPLICATE_6ab8_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2447_l2442_l2459_l2455_l2450_l2481_DUPLICATE_b690 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2447_l2442_l2459_l2455_l2450_l2481_DUPLICATE_b690_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2459_l2455_l2450_DUPLICATE_aeb5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2459_l2455_l2450_DUPLICATE_aeb5_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2455_c11_c80e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2459_c11_688e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2447_c11_d44e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2476_c11_3aa9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2483_c31_7ab5] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2483_c31_7ab5_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2483_c31_7ab5_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2483_c31_7ab5_return_output := CONST_SR_8_uxn_opcodes_h_l2483_c31_7ab5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2450_c11_daf2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2471_l2459_l2455_l2485_l2450_l2481_DUPLICATE_f530 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2471_l2459_l2455_l2485_l2450_l2481_DUPLICATE_f530_return_output := result.is_stack_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2479_c21_9d7c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2479_c21_9d7c_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- sp_relative_shift[uxn_opcodes_h_l2466_c30_f947] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_ins;
     sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_x;
     sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_return_output := sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2447_l2442_l2463_l2459_l2455_l2450_DUPLICATE_86bb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2447_l2442_l2463_l2459_l2455_l2450_DUPLICATE_86bb_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l2474_c31_4c61] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2474_c31_4c61_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2474_c31_4c61_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2474_c31_4c61_return_output := CONST_SR_8_uxn_opcodes_h_l2474_c31_4c61_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2442_c2_1e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2442_c2_1e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c6_317a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2447_c11_d44e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2450_c7_77ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c7_77ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_daf2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2455_c7_09c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2455_c7_09c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_c80e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2459_c7_409f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2459_c11_688e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_b31e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_ba5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_60f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2476_c11_3aa9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_78d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2485_c11_cd9e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2460_l2464_l2451_l2456_DUPLICATE_0ba7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2460_l2464_l2451_l2456_DUPLICATE_0ba7_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2461_l2452_DUPLICATE_5aeb_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2460_l2464_l2451_l2456_DUPLICATE_0ba7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2479_c21_9d7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2447_l2442_l2463_l2459_l2455_l2450_DUPLICATE_86bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2447_l2442_l2463_l2459_l2455_l2450_DUPLICATE_86bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2447_l2442_l2463_l2459_l2455_l2450_DUPLICATE_86bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2447_l2442_l2463_l2459_l2455_l2450_DUPLICATE_86bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2447_l2442_l2463_l2459_l2455_l2450_DUPLICATE_86bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2447_l2442_l2463_l2459_l2455_l2450_DUPLICATE_86bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2447_l2476_l2471_l2463_l2459_l2455_l2485_l2450_l2481_DUPLICATE_6ab8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2447_l2476_l2471_l2463_l2459_l2455_l2485_l2450_l2481_DUPLICATE_6ab8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2447_l2476_l2471_l2463_l2459_l2455_l2485_l2450_l2481_DUPLICATE_6ab8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2447_l2476_l2471_l2463_l2459_l2455_l2485_l2450_l2481_DUPLICATE_6ab8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2447_l2476_l2471_l2463_l2459_l2455_l2485_l2450_l2481_DUPLICATE_6ab8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2447_l2476_l2471_l2463_l2459_l2455_l2485_l2450_l2481_DUPLICATE_6ab8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2447_l2476_l2471_l2463_l2459_l2455_l2485_l2450_l2481_DUPLICATE_6ab8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2447_l2476_l2471_l2463_l2459_l2455_l2485_l2450_l2481_DUPLICATE_6ab8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2447_l2476_l2471_l2463_l2459_l2455_l2485_l2450_l2481_DUPLICATE_6ab8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2459_l2455_l2450_DUPLICATE_aeb5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2459_l2455_l2450_DUPLICATE_aeb5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2459_l2455_l2450_DUPLICATE_aeb5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2459_l2455_l2450_DUPLICATE_aeb5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2459_l2455_l2450_DUPLICATE_aeb5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2459_l2455_l2450_DUPLICATE_aeb5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2471_l2459_l2455_l2485_l2450_l2481_DUPLICATE_f530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2471_l2459_l2455_l2485_l2450_l2481_DUPLICATE_f530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2471_l2459_l2455_l2485_l2450_l2481_DUPLICATE_f530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2471_l2459_l2455_l2485_l2450_l2481_DUPLICATE_f530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2471_l2459_l2455_l2485_l2450_l2481_DUPLICATE_f530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2471_l2459_l2455_l2485_l2450_l2481_DUPLICATE_f530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2471_l2459_l2455_l2485_l2450_l2481_DUPLICATE_f530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2471_l2459_l2455_l2485_l2450_l2481_DUPLICATE_f530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2447_l2476_l2442_l2471_l2459_l2455_l2485_l2450_l2481_DUPLICATE_f530_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2459_l2481_DUPLICATE_93f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2459_l2481_DUPLICATE_93f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2447_l2442_l2459_l2455_l2450_l2481_DUPLICATE_b690_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2447_l2442_l2459_l2455_l2450_l2481_DUPLICATE_b690_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2447_l2442_l2459_l2455_l2450_l2481_DUPLICATE_b690_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2447_l2442_l2459_l2455_l2450_l2481_DUPLICATE_b690_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2447_l2442_l2459_l2455_l2450_l2481_DUPLICATE_b690_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2447_l2442_l2459_l2455_l2450_l2481_DUPLICATE_b690_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_f947_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2456_c3_6e4c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c_left;
     BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c_return_output := BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2476_c7_6b5f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2485_c7_1afd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2464_c3_24d7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7_left;
     BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7_return_output := BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2483_c21_f757] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2483_c21_f757_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2483_c31_7ab5_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2485_c7_1afd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2442_c1_328f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2463_c7_b31e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2481_c7_e734] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2474_c21_a1a8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2474_c21_a1a8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2474_c31_4c61_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2461_l2452_DUPLICATE_5aeb LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2461_l2452_DUPLICATE_5aeb_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2461_l2452_DUPLICATE_5aeb_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2461_l2452_DUPLICATE_5aeb_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2461_l2452_DUPLICATE_5aeb_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2456_c3_6e4c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2474_c21_a1a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2483_c21_f757_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2461_l2452_DUPLICATE_5aeb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2461_l2452_DUPLICATE_5aeb_return_output;
     VAR_printf_uxn_opcodes_h_l2443_c3_c066_uxn_opcodes_h_l2443_c3_c066_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2442_c1_328f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2485_c7_1afd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2485_c7_1afd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_e734_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2469_c21_ce66] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2469_c21_ce66_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_24d7_return_output);

     -- t16_MUX[uxn_opcodes_h_l2455_c7_09c0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2455_c7_09c0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2455_c7_09c0_cond;
     t16_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue;
     t16_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output := t16_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2481_c7_e734] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2476_c7_6b5f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2471_c7_89ce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2481_c7_e734] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2481_c7_e734] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_return_output := result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_return_output;

     -- printf_uxn_opcodes_h_l2443_c3_c066[uxn_opcodes_h_l2443_c3_c066] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2443_c3_c066_uxn_opcodes_h_l2443_c3_c066_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2443_c3_c066_uxn_opcodes_h_l2443_c3_c066_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2459_c7_409f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2463_c7_b31e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2463_c7_b31e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2463_c7_b31e_cond;
     n16_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue;
     n16_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output := n16_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2469_c21_ce66_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_e734_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_e734_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2459_c7_409f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c7_e734_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output;
     -- n16_MUX[uxn_opcodes_h_l2459_c7_409f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2459_c7_409f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2459_c7_409f_cond;
     n16_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue;
     n16_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2459_c7_409f_return_output := n16_MUX_uxn_opcodes_h_l2459_c7_409f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2463_c7_b31e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2455_c7_09c0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2471_c7_89ce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2476_c7_6b5f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2476_c7_6b5f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2450_c7_77ca] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2450_c7_77ca_cond <= VAR_t16_MUX_uxn_opcodes_h_l2450_c7_77ca_cond;
     t16_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue;
     t16_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output := t16_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2476_c7_6b5f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2459_c7_409f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2476_c7_6b5f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2450_c7_77ca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2459_c7_409f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2463_c7_b31e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2455_c7_09c0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2455_c7_09c0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2455_c7_09c0_cond;
     n16_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue;
     n16_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output := n16_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2471_c7_89ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2471_c7_89ce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output;

     -- t16_MUX[uxn_opcodes_h_l2447_c7_d7d8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond;
     t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue;
     t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output := t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2471_c7_89ce] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output := result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2459_c7_409f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_89ce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2463_c7_b31e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2463_c7_b31e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2455_c7_09c0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2450_c7_77ca] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2450_c7_77ca_cond <= VAR_n16_MUX_uxn_opcodes_h_l2450_c7_77ca_cond;
     n16_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue;
     n16_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output := n16_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2447_c7_d7d8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2459_c7_409f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2442_c2_1e24] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2442_c2_1e24_cond <= VAR_t16_MUX_uxn_opcodes_h_l2442_c2_1e24_cond;
     t16_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue;
     t16_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output := t16_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2463_c7_b31e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2459_c7_409f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_b31e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output;
     -- n16_MUX[uxn_opcodes_h_l2447_c7_d7d8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond;
     n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue;
     n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output := n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2459_c7_409f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2442_c2_1e24] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2450_c7_77ca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2455_c7_09c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2459_c7_409f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2459_c7_409f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2459_c7_409f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2459_c7_409f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2459_c7_409f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2450_c7_77ca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2447_c7_d7d8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2455_c7_09c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2455_c7_09c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2442_c2_1e24] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2442_c2_1e24_cond <= VAR_n16_MUX_uxn_opcodes_h_l2442_c2_1e24_cond;
     n16_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue;
     n16_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output := n16_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2455_c7_09c0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_09c0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2450_c7_77ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2447_c7_d7d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2450_c7_77ca] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output := result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2450_c7_77ca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2442_c2_1e24] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_77ca_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2447_c7_d7d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2442_c2_1e24] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2447_c7_d7d8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2447_c7_d7d8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2447_c7_d7d8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2442_c2_1e24] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2442_c2_1e24] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2442_c2_1e24] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output := result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2490_l2438_DUPLICATE_1d3d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2490_l2438_DUPLICATE_1d3d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c551(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c2_1e24_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2490_l2438_DUPLICATE_1d3d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2490_l2438_DUPLICATE_1d3d_return_output;
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
