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
-- Submodules: 74
entity sth2_0CLK_f91b0bf2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sth2_0CLK_f91b0bf2;
architecture arch of sth2_0CLK_f91b0bf2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2576_c6_c5bb]
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2576_c1_b267]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2576_c2_b9f6]
signal t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2576_c2_b9f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2576_c2_b9f6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2576_c2_b9f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2576_c2_b9f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2576_c2_b9f6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2576_c2_b9f6]
signal result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2576_c2_b9f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output : signed(3 downto 0);

-- printf_uxn_opcodes_h_l2577_c3_b3e3[uxn_opcodes_h_l2577_c3_b3e3]
signal printf_uxn_opcodes_h_l2577_c3_b3e3_uxn_opcodes_h_l2577_c3_b3e3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2581_c11_d92b]
signal BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2581_c7_ce1a]
signal t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2581_c7_ce1a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2581_c7_ce1a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2581_c7_ce1a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2581_c7_ce1a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2581_c7_ce1a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2581_c7_ce1a]
signal result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2581_c7_ce1a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2584_c11_d38f]
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2584_c7_fa19]
signal t16_MUX_uxn_opcodes_h_l2584_c7_fa19_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2584_c7_fa19]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2584_c7_fa19]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2584_c7_fa19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2584_c7_fa19]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2584_c7_fa19]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2584_c7_fa19]
signal result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2584_c7_fa19]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output : signed(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2586_c3_87c5]
signal CONST_SL_8_uxn_opcodes_h_l2586_c3_87c5_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2586_c3_87c5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2589_c11_e5ae]
signal BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2589_c7_56ee]
signal t16_MUX_uxn_opcodes_h_l2589_c7_56ee_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2589_c7_56ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2589_c7_56ee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2589_c7_56ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2589_c7_56ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2589_c7_56ee]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2589_c7_56ee]
signal result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2589_c7_56ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2592_c11_e086]
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2592_c7_d6b3]
signal t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2592_c7_d6b3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2592_c7_d6b3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2592_c7_d6b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2592_c7_d6b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2592_c7_d6b3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2592_c7_d6b3]
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2592_c7_d6b3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2593_c3_dc16]
signal BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2595_c30_0505]
signal sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2597_c11_2a4e]
signal BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2597_c7_754f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2597_c7_754f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2597_c7_754f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2597_c7_754f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2597_c7_754f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2597_c7_754f]
signal result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2597_c7_754f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2604_c11_b90e]
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2604_c7_d510]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2604_c7_d510]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2604_c7_d510]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2604_c7_d510]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2604_c7_d510]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2604_c7_d510]
signal result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2607_c31_04a3]
signal CONST_SR_8_uxn_opcodes_h_l2607_c31_04a3_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2607_c31_04a3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2609_c11_b026]
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2609_c7_f23e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2609_c7_f23e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2609_c7_f23e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_78f9( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb
BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_left,
BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_right,
BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_return_output);

-- t16_MUX_uxn_opcodes_h_l2576_c2_b9f6
t16_MUX_uxn_opcodes_h_l2576_c2_b9f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond,
t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue,
t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse,
t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6
result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output);

-- printf_uxn_opcodes_h_l2577_c3_b3e3_uxn_opcodes_h_l2577_c3_b3e3
printf_uxn_opcodes_h_l2577_c3_b3e3_uxn_opcodes_h_l2577_c3_b3e3 : entity work.printf_uxn_opcodes_h_l2577_c3_b3e3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2577_c3_b3e3_uxn_opcodes_h_l2577_c3_b3e3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b
BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_left,
BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_right,
BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_return_output);

-- t16_MUX_uxn_opcodes_h_l2581_c7_ce1a
t16_MUX_uxn_opcodes_h_l2581_c7_ce1a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond,
t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue,
t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse,
t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a
result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a
result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a
result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a
result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_left,
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_right,
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_return_output);

-- t16_MUX_uxn_opcodes_h_l2584_c7_fa19
t16_MUX_uxn_opcodes_h_l2584_c7_fa19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2584_c7_fa19_cond,
t16_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue,
t16_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse,
t16_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19
result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19
result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_cond,
result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19
result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2586_c3_87c5
CONST_SL_8_uxn_opcodes_h_l2586_c3_87c5 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2586_c3_87c5_x,
CONST_SL_8_uxn_opcodes_h_l2586_c3_87c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae
BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_left,
BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_right,
BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_return_output);

-- t16_MUX_uxn_opcodes_h_l2589_c7_56ee
t16_MUX_uxn_opcodes_h_l2589_c7_56ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2589_c7_56ee_cond,
t16_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue,
t16_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse,
t16_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee
result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee
result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee
result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee
result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_cond,
result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_left,
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_right,
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_return_output);

-- t16_MUX_uxn_opcodes_h_l2592_c7_d6b3
t16_MUX_uxn_opcodes_h_l2592_c7_d6b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond,
t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue,
t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse,
t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3
result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16
BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16_left,
BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16_right,
BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2595_c30_0505
sp_relative_shift_uxn_opcodes_h_l2595_c30_0505 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_ins,
sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_x,
sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_y,
sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e
BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_left,
BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_right,
BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f
result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f
result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f
result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f
result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_left,
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_right,
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510
result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510
result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_cond,
result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2607_c31_04a3
CONST_SR_8_uxn_opcodes_h_l2607_c31_04a3 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2607_c31_04a3_x,
CONST_SR_8_uxn_opcodes_h_l2607_c31_04a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_left,
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_right,
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_return_output,
 t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_return_output,
 t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_return_output,
 t16_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output,
 CONST_SL_8_uxn_opcodes_h_l2586_c3_87c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_return_output,
 t16_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_return_output,
 t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16_return_output,
 sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_return_output,
 CONST_SR_8_uxn_opcodes_h_l2607_c31_04a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2578_c3_b1e7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2577_c3_b3e3_uxn_opcodes_h_l2577_c3_b3e3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2582_c3_a83c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2584_c7_fa19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2587_c3_0b2a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2586_c3_87c5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2586_c3_87c5_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2589_c7_56ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2590_c3_cba3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_a4d4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2599_c3_a810 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2602_c21_a32c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2606_c3_484c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2607_c31_04a3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2607_c31_04a3_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2607_c21_3ff8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2604_l2597_l2589_l2584_l2581_l2576_DUPLICATE_2693_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2609_l2576_DUPLICATE_a8cc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2609_l2576_DUPLICATE_e059_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2576_DUPLICATE_3360_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2597_l2589_l2584_l2581_l2576_DUPLICATE_43f8_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2604_l2597_l2592_l2589_l2584_l2581_l2609_DUPLICATE_8627_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2593_l2585_DUPLICATE_f295_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2604_l2592_DUPLICATE_a23e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_78f9_uxn_opcodes_h_l2615_l2572_DUPLICATE_eed1_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2590_c3_cba3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2590_c3_cba3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_a4d4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_a4d4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2606_c3_484c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2606_c3_484c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2578_c3_b1e7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2578_c3_b1e7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2599_c3_a810 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2599_c3_a810;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2587_c3_0b2a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2587_c3_0b2a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2582_c3_a83c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2582_c3_a83c;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2607_c31_04a3_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2592_c11_e086] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_left;
     BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_return_output := BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2604_c11_b90e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2609_l2576_DUPLICATE_a8cc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2609_l2576_DUPLICATE_a8cc_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2597_l2589_l2584_l2581_l2576_DUPLICATE_43f8 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2597_l2589_l2584_l2581_l2576_DUPLICATE_43f8_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2604_l2597_l2589_l2584_l2581_l2576_DUPLICATE_2693 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2604_l2597_l2589_l2584_l2581_l2576_DUPLICATE_2693_return_output := result.is_sp_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2602_c21_a32c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2602_c21_a32c_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2609_l2576_DUPLICATE_e059 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2609_l2576_DUPLICATE_e059_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l2595_c30_0505] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_ins;
     sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_x;
     sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_return_output := sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2609_c11_b026] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_left;
     BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_return_output := BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2597_c11_2a4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2607_c31_04a3] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2607_c31_04a3_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2607_c31_04a3_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2607_c31_04a3_return_output := CONST_SR_8_uxn_opcodes_h_l2607_c31_04a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2576_c6_c5bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2604_l2597_l2592_l2589_l2584_l2581_l2609_DUPLICATE_8627 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2604_l2597_l2592_l2589_l2584_l2581_l2609_DUPLICATE_8627_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2593_l2585_DUPLICATE_f295 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2593_l2585_DUPLICATE_f295_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2581_c11_d92b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2589_c11_e5ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2584_c11_d38f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2576_DUPLICATE_3360 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2576_DUPLICATE_3360_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2604_l2592_DUPLICATE_a23e LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2604_l2592_DUPLICATE_a23e_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c6_c5bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_d92b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2584_c7_fa19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d38f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2589_c7_56ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_e5ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_e086_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2597_c11_2a4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_b90e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_b026_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2593_l2585_DUPLICATE_f295_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2586_c3_87c5_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2593_l2585_DUPLICATE_f295_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2602_c21_a32c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2597_l2589_l2584_l2581_l2576_DUPLICATE_43f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2597_l2589_l2584_l2581_l2576_DUPLICATE_43f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2597_l2589_l2584_l2581_l2576_DUPLICATE_43f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2597_l2589_l2584_l2581_l2576_DUPLICATE_43f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2597_l2589_l2584_l2581_l2576_DUPLICATE_43f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2604_l2597_l2592_l2589_l2584_l2581_l2609_DUPLICATE_8627_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2604_l2597_l2592_l2589_l2584_l2581_l2609_DUPLICATE_8627_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2604_l2597_l2592_l2589_l2584_l2581_l2609_DUPLICATE_8627_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2604_l2597_l2592_l2589_l2584_l2581_l2609_DUPLICATE_8627_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2604_l2597_l2592_l2589_l2584_l2581_l2609_DUPLICATE_8627_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2604_l2597_l2592_l2589_l2584_l2581_l2609_DUPLICATE_8627_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2604_l2597_l2592_l2589_l2584_l2581_l2609_DUPLICATE_8627_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2604_l2597_l2589_l2584_l2581_l2576_DUPLICATE_2693_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2604_l2597_l2589_l2584_l2581_l2576_DUPLICATE_2693_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2604_l2597_l2589_l2584_l2581_l2576_DUPLICATE_2693_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2604_l2597_l2589_l2584_l2581_l2576_DUPLICATE_2693_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2604_l2597_l2589_l2584_l2581_l2576_DUPLICATE_2693_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2604_l2597_l2589_l2584_l2581_l2576_DUPLICATE_2693_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2609_l2576_DUPLICATE_e059_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2609_l2576_DUPLICATE_e059_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2609_l2576_DUPLICATE_e059_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2609_l2576_DUPLICATE_e059_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2609_l2576_DUPLICATE_e059_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2609_l2576_DUPLICATE_e059_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2609_l2576_DUPLICATE_e059_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2609_l2576_DUPLICATE_a8cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2609_l2576_DUPLICATE_a8cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2609_l2576_DUPLICATE_a8cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2609_l2576_DUPLICATE_a8cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2609_l2576_DUPLICATE_a8cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2609_l2576_DUPLICATE_a8cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2609_l2576_DUPLICATE_a8cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2604_l2592_DUPLICATE_a23e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2604_l2592_DUPLICATE_a23e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2576_DUPLICATE_3360_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2576_DUPLICATE_3360_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2576_DUPLICATE_3360_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2576_DUPLICATE_3360_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2576_DUPLICATE_3360_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2604_l2592_l2589_l2584_l2581_l2576_DUPLICATE_3360_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2595_c30_0505_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2597_c7_754f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2593_c3_dc16] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16_left;
     BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16_return_output := BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2609_c7_f23e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2604_c7_d510] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2609_c7_f23e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2607_c21_3ff8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2607_c21_3ff8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2607_c31_04a3_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2604_c7_d510] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2576_c1_b267] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2586_c3_87c5] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2586_c3_87c5_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2586_c3_87c5_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2586_c3_87c5_return_output := CONST_SL_8_uxn_opcodes_h_l2586_c3_87c5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2609_c7_f23e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2593_c3_dc16_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2607_c21_3ff8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2586_c3_87c5_return_output;
     VAR_printf_uxn_opcodes_h_l2577_c3_b3e3_uxn_opcodes_h_l2577_c3_b3e3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2576_c1_b267_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2604_c7_d510_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_f23e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2597_c7_754f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2604_c7_d510_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2604_c7_d510] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_return_output;

     -- t16_MUX[uxn_opcodes_h_l2592_c7_d6b3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond;
     t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue;
     t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output := t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2597_c7_754f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2597_c7_754f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2604_c7_d510] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_return_output := result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2604_c7_d510] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2592_c7_d6b3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2604_c7_d510] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_return_output;

     -- printf_uxn_opcodes_h_l2577_c3_b3e3[uxn_opcodes_h_l2577_c3_b3e3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2577_c3_b3e3_uxn_opcodes_h_l2577_c3_b3e3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2577_c3_b3e3_uxn_opcodes_h_l2577_c3_b3e3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_d510_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2597_c7_754f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_d510_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_d510_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2597_c7_754f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2604_c7_d510_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2592_c7_d6b3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2589_c7_56ee] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2589_c7_56ee_cond <= VAR_t16_MUX_uxn_opcodes_h_l2589_c7_56ee_cond;
     t16_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue;
     t16_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output := t16_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2597_c7_754f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2597_c7_754f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2592_c7_d6b3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2597_c7_754f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2597_c7_754f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2589_c7_56ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2597_c7_754f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2597_c7_754f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2597_c7_754f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2597_c7_754f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output;
     -- t16_MUX[uxn_opcodes_h_l2584_c7_fa19] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2584_c7_fa19_cond <= VAR_t16_MUX_uxn_opcodes_h_l2584_c7_fa19_cond;
     t16_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue;
     t16_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output := t16_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2589_c7_56ee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2592_c7_d6b3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2592_c7_d6b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2584_c7_fa19] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2592_c7_d6b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2589_c7_56ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2592_c7_d6b3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_d6b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2589_c7_56ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2589_c7_56ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2584_c7_fa19] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2581_c7_ce1a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2589_c7_56ee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output := result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output;

     -- t16_MUX[uxn_opcodes_h_l2581_c7_ce1a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond;
     t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue;
     t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output := t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2584_c7_fa19] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2589_c7_56ee] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2589_c7_56ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2584_c7_fa19] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2581_c7_ce1a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2584_c7_fa19] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output;

     -- t16_MUX[uxn_opcodes_h_l2576_c2_b9f6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond;
     t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue;
     t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output := t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2584_c7_fa19] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output := result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2584_c7_fa19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2576_c2_b9f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2581_c7_ce1a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_fa19_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2581_c7_ce1a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2581_c7_ce1a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2576_c2_b9f6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2576_c2_b9f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2581_c7_ce1a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2581_c7_ce1a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_ce1a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2576_c2_b9f6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2576_c2_b9f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2576_c2_b9f6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2576_c2_b9f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_78f9_uxn_opcodes_h_l2615_l2572_DUPLICATE_eed1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_78f9_uxn_opcodes_h_l2615_l2572_DUPLICATE_eed1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_78f9(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c2_b9f6_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_78f9_uxn_opcodes_h_l2615_l2572_DUPLICATE_eed1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_78f9_uxn_opcodes_h_l2615_l2572_DUPLICATE_eed1_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
