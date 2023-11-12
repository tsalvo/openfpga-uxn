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
-- BIN_OP_EQ[uxn_opcodes_h_l2450_c6_6d89]
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2450_c1_f3d8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2450_c2_46fd]
signal n16_MUX_uxn_opcodes_h_l2450_c2_46fd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2450_c2_46fd]
signal t16_MUX_uxn_opcodes_h_l2450_c2_46fd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2450_c2_46fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2450_c2_46fd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2450_c2_46fd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2450_c2_46fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2450_c2_46fd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2450_c2_46fd]
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2451_c3_6955[uxn_opcodes_h_l2451_c3_6955]
signal printf_uxn_opcodes_h_l2451_c3_6955_uxn_opcodes_h_l2451_c3_6955_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2455_c11_aaf4]
signal BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2455_c7_9ce6]
signal n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2455_c7_9ce6]
signal t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2455_c7_9ce6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2455_c7_9ce6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2455_c7_9ce6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2455_c7_9ce6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2455_c7_9ce6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2455_c7_9ce6]
signal result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2458_c11_826c]
signal BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2458_c7_01bf]
signal n16_MUX_uxn_opcodes_h_l2458_c7_01bf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2458_c7_01bf]
signal t16_MUX_uxn_opcodes_h_l2458_c7_01bf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2458_c7_01bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2458_c7_01bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2458_c7_01bf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2458_c7_01bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2458_c7_01bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2458_c7_01bf]
signal result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2463_c11_df0f]
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2463_c7_37c6]
signal n16_MUX_uxn_opcodes_h_l2463_c7_37c6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2463_c7_37c6]
signal t16_MUX_uxn_opcodes_h_l2463_c7_37c6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2463_c7_37c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2463_c7_37c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2463_c7_37c6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2463_c7_37c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2463_c7_37c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2463_c7_37c6]
signal result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2464_c3_2cff]
signal BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2467_c11_962d]
signal BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2467_c7_653c]
signal n16_MUX_uxn_opcodes_h_l2467_c7_653c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2467_c7_653c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2467_c7_653c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2467_c7_653c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2467_c7_653c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2467_c7_653c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2467_c7_653c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2467_c7_653c]
signal result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2471_c11_ac2c]
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2471_c7_3289]
signal n16_MUX_uxn_opcodes_h_l2471_c7_3289_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2471_c7_3289_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2471_c7_3289]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2471_c7_3289]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2471_c7_3289]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2471_c7_3289]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2471_c7_3289]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2471_c7_3289]
signal result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2472_c3_8b29]
signal BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2474_c30_4609]
signal sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2479_c11_24e1]
signal BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2479_c7_b4aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2479_c7_b4aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2479_c7_b4aa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2479_c7_b4aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2479_c7_b4aa]
signal result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2482_c31_e1c7]
signal CONST_SR_8_uxn_opcodes_h_l2482_c31_e1c7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2482_c31_e1c7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2484_c11_e07f]
signal BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2484_c7_8e4b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2484_c7_8e4b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2484_c7_8e4b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2484_c7_8e4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2484_c7_8e4b]
signal result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2489_c11_026c]
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2489_c7_a2a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2489_c7_a2a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2489_c7_a2a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2489_c7_a2a8]
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2491_c31_a383]
signal CONST_SR_8_uxn_opcodes_h_l2491_c31_a383_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2491_c31_a383_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2493_c11_f76e]
signal BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2493_c7_8f9e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2493_c7_8f9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2460_l2469_DUPLICATE_3268
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2460_l2469_DUPLICATE_3268_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2460_l2469_DUPLICATE_3268_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5b93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89
BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_left,
BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_right,
BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_return_output);

-- n16_MUX_uxn_opcodes_h_l2450_c2_46fd
n16_MUX_uxn_opcodes_h_l2450_c2_46fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2450_c2_46fd_cond,
n16_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue,
n16_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse,
n16_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output);

-- t16_MUX_uxn_opcodes_h_l2450_c2_46fd
t16_MUX_uxn_opcodes_h_l2450_c2_46fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2450_c2_46fd_cond,
t16_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue,
t16_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse,
t16_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd
result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output);

-- printf_uxn_opcodes_h_l2451_c3_6955_uxn_opcodes_h_l2451_c3_6955
printf_uxn_opcodes_h_l2451_c3_6955_uxn_opcodes_h_l2451_c3_6955 : entity work.printf_uxn_opcodes_h_l2451_c3_6955_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2451_c3_6955_uxn_opcodes_h_l2451_c3_6955_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_left,
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_right,
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_return_output);

-- n16_MUX_uxn_opcodes_h_l2455_c7_9ce6
n16_MUX_uxn_opcodes_h_l2455_c7_9ce6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond,
n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue,
n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse,
n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output);

-- t16_MUX_uxn_opcodes_h_l2455_c7_9ce6
t16_MUX_uxn_opcodes_h_l2455_c7_9ce6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond,
t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue,
t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse,
t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c
BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_left,
BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_right,
BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_return_output);

-- n16_MUX_uxn_opcodes_h_l2458_c7_01bf
n16_MUX_uxn_opcodes_h_l2458_c7_01bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2458_c7_01bf_cond,
n16_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue,
n16_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse,
n16_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output);

-- t16_MUX_uxn_opcodes_h_l2458_c7_01bf
t16_MUX_uxn_opcodes_h_l2458_c7_01bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2458_c7_01bf_cond,
t16_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue,
t16_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse,
t16_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf
result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_cond,
result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_left,
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_right,
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_return_output);

-- n16_MUX_uxn_opcodes_h_l2463_c7_37c6
n16_MUX_uxn_opcodes_h_l2463_c7_37c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2463_c7_37c6_cond,
n16_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue,
n16_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse,
n16_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output);

-- t16_MUX_uxn_opcodes_h_l2463_c7_37c6
t16_MUX_uxn_opcodes_h_l2463_c7_37c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2463_c7_37c6_cond,
t16_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue,
t16_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse,
t16_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff
BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff_left,
BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff_right,
BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_left,
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_right,
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_return_output);

-- n16_MUX_uxn_opcodes_h_l2467_c7_653c
n16_MUX_uxn_opcodes_h_l2467_c7_653c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2467_c7_653c_cond,
n16_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue,
n16_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse,
n16_MUX_uxn_opcodes_h_l2467_c7_653c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c
result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_left,
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_right,
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_return_output);

-- n16_MUX_uxn_opcodes_h_l2471_c7_3289
n16_MUX_uxn_opcodes_h_l2471_c7_3289 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2471_c7_3289_cond,
n16_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue,
n16_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse,
n16_MUX_uxn_opcodes_h_l2471_c7_3289_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289
result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_cond,
result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29
BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29_left,
BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29_right,
BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2474_c30_4609
sp_relative_shift_uxn_opcodes_h_l2474_c30_4609 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_ins,
sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_x,
sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_y,
sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1
BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_left,
BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_right,
BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa
result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa
result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa
result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa
result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond,
result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2482_c31_e1c7
CONST_SR_8_uxn_opcodes_h_l2482_c31_e1c7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2482_c31_e1c7_x,
CONST_SR_8_uxn_opcodes_h_l2482_c31_e1c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f
BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_left,
BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_right,
BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b
result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_left,
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_right,
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8
result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2491_c31_a383
CONST_SR_8_uxn_opcodes_h_l2491_c31_a383 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2491_c31_a383_x,
CONST_SR_8_uxn_opcodes_h_l2491_c31_a383_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e
BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e_left,
BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e_right,
BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e
result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e
result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2460_l2469_DUPLICATE_3268
CONST_SL_8_uint16_t_uxn_opcodes_h_l2460_l2469_DUPLICATE_3268 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2460_l2469_DUPLICATE_3268_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2460_l2469_DUPLICATE_3268_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_return_output,
 n16_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output,
 t16_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_return_output,
 n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output,
 t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_return_output,
 n16_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output,
 t16_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_return_output,
 n16_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output,
 t16_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_return_output,
 n16_MUX_uxn_opcodes_h_l2467_c7_653c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_return_output,
 n16_MUX_uxn_opcodes_h_l2471_c7_3289_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29_return_output,
 sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output,
 CONST_SR_8_uxn_opcodes_h_l2482_c31_e1c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output,
 CONST_SR_8_uxn_opcodes_h_l2491_c31_a383_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2460_l2469_DUPLICATE_3268_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2450_c2_46fd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c2_46fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2452_c3_d890 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2451_c3_6955_uxn_opcodes_h_l2451_c3_6955_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2456_c3_760b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2458_c7_01bf_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2458_c7_01bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_a37f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2467_c7_653c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_37c6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2463_c7_37c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2465_c3_bfd9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2471_c7_3289_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2467_c7_653c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2471_c7_3289_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2476_c3_b209 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2477_c21_ea1a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2481_c3_b820 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2482_c31_e1c7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2482_c31_e1c7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2482_c21_67f3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2486_c3_fd38 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2487_c21_50c0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2490_c3_6bbb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2491_c31_a383_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2491_c31_a383_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2491_c21_6b5d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_49df_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2455_l2484_l2450_DUPLICATE_ef38_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2458_l2455_l2450_DUPLICATE_94cf_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2489_l2455_l2450_DUPLICATE_a752_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_8890_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2459_l2468_l2472_l2464_DUPLICATE_7ca2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2460_l2469_DUPLICATE_3268_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2460_l2469_DUPLICATE_3268_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2489_l2467_DUPLICATE_c657_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2498_l2446_DUPLICATE_1645_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_a37f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_a37f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2476_c3_b209 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2476_c3_b209;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2465_c3_bfd9 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2465_c3_bfd9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2490_c3_6bbb := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2490_c3_6bbb;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2481_c3_b820 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2481_c3_b820;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2486_c3_fd38 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2486_c3_fd38;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2456_c3_760b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2456_c3_760b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2452_c3_d890 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2452_c3_d890;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e_right := to_unsigned(9, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2482_c31_e1c7_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2491_c31_a383_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2484_c11_e07f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2479_c11_24e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2458_c11_826c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2455_c11_aaf4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2455_l2484_l2450_DUPLICATE_ef38 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2455_l2484_l2450_DUPLICATE_ef38_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2493_c11_f76e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2471_c11_ac2c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_49df LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_49df_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2458_l2455_l2450_DUPLICATE_94cf LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2458_l2455_l2450_DUPLICATE_94cf_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2463_c11_df0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2459_l2468_l2472_l2464_DUPLICATE_7ca2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2459_l2468_l2472_l2464_DUPLICATE_7ca2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2467_c11_962d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2491_c31_a383] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2491_c31_a383_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2491_c31_a383_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2491_c31_a383_return_output := CONST_SR_8_uxn_opcodes_h_l2491_c31_a383_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2487_c21_50c0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2487_c21_50c0_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2489_l2467_DUPLICATE_c657 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2489_l2467_DUPLICATE_c657_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l2482_c31_e1c7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2482_c31_e1c7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2482_c31_e1c7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2482_c31_e1c7_return_output := CONST_SR_8_uxn_opcodes_h_l2482_c31_e1c7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_8890 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_8890_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2450_c6_6d89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_left;
     BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_return_output := BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2489_l2455_l2450_DUPLICATE_a752 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2489_l2455_l2450_DUPLICATE_a752_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l2474_c30_4609] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_ins;
     sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_x;
     sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_return_output := sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2489_c11_026c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2450_c2_46fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c2_46fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_6d89_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_aaf4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2458_c7_01bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2458_c7_01bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_826c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_37c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2463_c7_37c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_df0f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2467_c7_653c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_962d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2471_c7_3289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_ac2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_24e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_e07f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_026c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_f76e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2459_l2468_l2472_l2464_DUPLICATE_7ca2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2459_l2468_l2472_l2464_DUPLICATE_7ca2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2460_l2469_DUPLICATE_3268_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2459_l2468_l2472_l2464_DUPLICATE_7ca2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2487_c21_50c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2458_l2455_l2450_DUPLICATE_94cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2458_l2455_l2450_DUPLICATE_94cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2458_l2455_l2450_DUPLICATE_94cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2458_l2455_l2450_DUPLICATE_94cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2458_l2455_l2450_DUPLICATE_94cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2458_l2455_l2450_DUPLICATE_94cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_8890_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_8890_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_8890_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_8890_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_8890_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_8890_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_8890_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_8890_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_8890_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2455_l2484_l2450_DUPLICATE_ef38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2455_l2484_l2450_DUPLICATE_ef38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2455_l2484_l2450_DUPLICATE_ef38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2455_l2484_l2450_DUPLICATE_ef38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2455_l2484_l2450_DUPLICATE_ef38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2455_l2484_l2450_DUPLICATE_ef38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_49df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_49df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_49df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_49df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_49df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_49df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_49df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_49df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_49df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2489_l2467_DUPLICATE_c657_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2489_l2467_DUPLICATE_c657_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2489_l2455_l2450_DUPLICATE_a752_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2489_l2455_l2450_DUPLICATE_a752_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2489_l2455_l2450_DUPLICATE_a752_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2489_l2455_l2450_DUPLICATE_a752_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2489_l2455_l2450_DUPLICATE_a752_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2489_l2455_l2450_DUPLICATE_a752_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_4609_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2450_c1_f3d8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2472_c3_8b29] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29_left;
     BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29_return_output := BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2482_c21_67f3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2482_c21_67f3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2482_c31_e1c7_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2493_c7_8f9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2464_c3_2cff] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff_left;
     BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff_return_output := BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2493_c7_8f9e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2491_c21_6b5d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2491_c21_6b5d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2491_c31_a383_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2484_c7_8e4b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2460_l2469_DUPLICATE_3268 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2460_l2469_DUPLICATE_3268_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2460_l2469_DUPLICATE_3268_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2460_l2469_DUPLICATE_3268_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2460_l2469_DUPLICATE_3268_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2471_c7_3289] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2489_c7_a2a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_2cff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2482_c21_67f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2491_c21_6b5d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2460_l2469_DUPLICATE_3268_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2460_l2469_DUPLICATE_3268_return_output;
     VAR_printf_uxn_opcodes_h_l2451_c3_6955_uxn_opcodes_h_l2451_c3_6955_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_f3d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_8f9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_8f9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_3289_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output;
     -- printf_uxn_opcodes_h_l2451_c3_6955[uxn_opcodes_h_l2451_c3_6955] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2451_c3_6955_uxn_opcodes_h_l2451_c3_6955_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2451_c3_6955_uxn_opcodes_h_l2451_c3_6955_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2467_c7_653c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2463_c7_37c6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2463_c7_37c6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2463_c7_37c6_cond;
     t16_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue;
     t16_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output := t16_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2489_c7_a2a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2489_c7_a2a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2479_c7_b4aa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output;

     -- n16_MUX[uxn_opcodes_h_l2471_c7_3289] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2471_c7_3289_cond <= VAR_n16_MUX_uxn_opcodes_h_l2471_c7_3289_cond;
     n16_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue;
     n16_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2471_c7_3289_return_output := n16_MUX_uxn_opcodes_h_l2471_c7_3289_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2477_c21_ea1a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2477_c21_ea1a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_8b29_return_output);

     -- result_u8_value_MUX[uxn_opcodes_h_l2489_c7_a2a8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2484_c7_8e4b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2477_c21_ea1a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2471_c7_3289_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_653c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_a2a8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2484_c7_8e4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2458_c7_01bf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2458_c7_01bf_cond <= VAR_t16_MUX_uxn_opcodes_h_l2458_c7_01bf_cond;
     t16_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue;
     t16_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output := t16_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2484_c7_8e4b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2471_c7_3289] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2484_c7_8e4b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2463_c7_37c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2467_c7_653c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2467_c7_653c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2467_c7_653c_cond;
     n16_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue;
     n16_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2467_c7_653c_return_output := n16_MUX_uxn_opcodes_h_l2467_c7_653c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2479_c7_b4aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2467_c7_653c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_3289_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_8e4b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2458_c7_01bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output;

     -- t16_MUX[uxn_opcodes_h_l2455_c7_9ce6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond;
     t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue;
     t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output := t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2479_c7_b4aa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output := result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output;

     -- n16_MUX[uxn_opcodes_h_l2463_c7_37c6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2463_c7_37c6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2463_c7_37c6_cond;
     n16_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue;
     n16_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output := n16_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2471_c7_3289] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2467_c7_653c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2479_c7_b4aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2479_c7_b4aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_653c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_3289_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_b4aa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2471_c7_3289] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_return_output := result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2471_c7_3289] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_return_output;

     -- n16_MUX[uxn_opcodes_h_l2458_c7_01bf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2458_c7_01bf_cond <= VAR_n16_MUX_uxn_opcodes_h_l2458_c7_01bf_cond;
     n16_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue;
     n16_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output := n16_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2471_c7_3289] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2463_c7_37c6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2455_c7_9ce6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2467_c7_653c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2450_c2_46fd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2450_c2_46fd_cond <= VAR_t16_MUX_uxn_opcodes_h_l2450_c2_46fd_cond;
     t16_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue;
     t16_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output := t16_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_3289_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_3289_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_653c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_3289_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2467_c7_653c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2467_c7_653c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2455_c7_9ce6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond;
     n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue;
     n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output := n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2467_c7_653c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2463_c7_37c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2450_c2_46fd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2458_c7_01bf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_653c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_653c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_653c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2463_c7_37c6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2463_c7_37c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2458_c7_01bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2463_c7_37c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2455_c7_9ce6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2450_c2_46fd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2450_c2_46fd_cond <= VAR_n16_MUX_uxn_opcodes_h_l2450_c2_46fd_cond;
     n16_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue;
     n16_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output := n16_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_37c6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2458_c7_01bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2450_c2_46fd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2458_c7_01bf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output := result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2455_c7_9ce6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2458_c7_01bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_01bf_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2455_c7_9ce6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2450_c2_46fd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2455_c7_9ce6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2455_c7_9ce6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_9ce6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2450_c2_46fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2450_c2_46fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2450_c2_46fd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2498_l2446_DUPLICATE_1645 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2498_l2446_DUPLICATE_1645_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b93(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_46fd_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2498_l2446_DUPLICATE_1645_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l2498_l2446_DUPLICATE_1645_return_output;
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
