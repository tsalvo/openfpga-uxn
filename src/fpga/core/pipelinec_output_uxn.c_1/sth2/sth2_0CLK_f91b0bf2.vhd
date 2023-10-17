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
-- BIN_OP_EQ[uxn_opcodes_h_l2571_c6_8ecf]
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2571_c1_45f9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2571_c2_f199]
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2571_c2_f199]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2571_c2_f199]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2571_c2_f199]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2571_c2_f199]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2571_c2_f199]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2571_c2_f199]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2571_c2_f199]
signal t16_MUX_uxn_opcodes_h_l2571_c2_f199_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2571_c2_f199_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2572_c3_5ac9[uxn_opcodes_h_l2572_c3_5ac9]
signal printf_uxn_opcodes_h_l2572_c3_5ac9_uxn_opcodes_h_l2572_c3_5ac9_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2576_c11_b31f]
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2576_c7_e01c]
signal result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2576_c7_e01c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2576_c7_e01c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2576_c7_e01c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2576_c7_e01c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2576_c7_e01c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2576_c7_e01c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2576_c7_e01c]
signal t16_MUX_uxn_opcodes_h_l2576_c7_e01c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2579_c11_9047]
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2579_c7_9bf7]
signal result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2579_c7_9bf7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2579_c7_9bf7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2579_c7_9bf7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2579_c7_9bf7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2579_c7_9bf7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2579_c7_9bf7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2579_c7_9bf7]
signal t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2581_c3_28ca]
signal CONST_SL_8_uxn_opcodes_h_l2581_c3_28ca_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2581_c3_28ca_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2584_c11_dac3]
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2584_c7_8225]
signal result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2584_c7_8225]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2584_c7_8225]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2584_c7_8225]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2584_c7_8225]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2584_c7_8225]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2584_c7_8225]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2584_c7_8225]
signal t16_MUX_uxn_opcodes_h_l2584_c7_8225_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2584_c7_8225_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2587_c11_99a2]
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2587_c7_0fc9]
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2587_c7_0fc9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2587_c7_0fc9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2587_c7_0fc9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2587_c7_0fc9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2587_c7_0fc9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2587_c7_0fc9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2587_c7_0fc9]
signal t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2588_c3_c15d]
signal BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2590_c30_fd31]
signal sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2592_c11_6f9d]
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2592_c7_a9a6]
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2592_c7_a9a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2592_c7_a9a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2592_c7_a9a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2592_c7_a9a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2592_c7_a9a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2592_c7_a9a6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2599_c11_5f72]
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2599_c7_0085]
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2599_c7_0085]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2599_c7_0085]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2599_c7_0085]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2599_c7_0085]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2599_c7_0085]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2602_c31_f731]
signal CONST_SR_8_uxn_opcodes_h_l2602_c31_f731_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2602_c31_f731_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2604_c11_d8a0]
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2604_c7_0a7d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2604_c7_0a7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2604_c7_0a7d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_b7e3( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf
BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_left,
BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_right,
BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199
result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_cond,
result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_return_output);

-- t16_MUX_uxn_opcodes_h_l2571_c2_f199
t16_MUX_uxn_opcodes_h_l2571_c2_f199 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2571_c2_f199_cond,
t16_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue,
t16_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse,
t16_MUX_uxn_opcodes_h_l2571_c2_f199_return_output);

-- printf_uxn_opcodes_h_l2572_c3_5ac9_uxn_opcodes_h_l2572_c3_5ac9
printf_uxn_opcodes_h_l2572_c3_5ac9_uxn_opcodes_h_l2572_c3_5ac9 : entity work.printf_uxn_opcodes_h_l2572_c3_5ac9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2572_c3_5ac9_uxn_opcodes_h_l2572_c3_5ac9_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_left,
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_right,
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c
result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output);

-- t16_MUX_uxn_opcodes_h_l2576_c7_e01c
t16_MUX_uxn_opcodes_h_l2576_c7_e01c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2576_c7_e01c_cond,
t16_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue,
t16_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse,
t16_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_left,
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_right,
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7
result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output);

-- t16_MUX_uxn_opcodes_h_l2579_c7_9bf7
t16_MUX_uxn_opcodes_h_l2579_c7_9bf7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond,
t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue,
t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse,
t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2581_c3_28ca
CONST_SL_8_uxn_opcodes_h_l2581_c3_28ca : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2581_c3_28ca_x,
CONST_SL_8_uxn_opcodes_h_l2581_c3_28ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_left,
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_right,
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225
result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_cond,
result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225
result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225
result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_return_output);

-- t16_MUX_uxn_opcodes_h_l2584_c7_8225
t16_MUX_uxn_opcodes_h_l2584_c7_8225 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2584_c7_8225_cond,
t16_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue,
t16_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse,
t16_MUX_uxn_opcodes_h_l2584_c7_8225_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_left,
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_right,
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9
result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output);

-- t16_MUX_uxn_opcodes_h_l2587_c7_0fc9
t16_MUX_uxn_opcodes_h_l2587_c7_0fc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond,
t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue,
t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse,
t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d
BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d_left,
BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d_right,
BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31
sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_ins,
sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_x,
sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_y,
sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_left,
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_right,
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6
result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_left,
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_right,
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_cond,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085
result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2602_c31_f731
CONST_SR_8_uxn_opcodes_h_l2602_c31_f731 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2602_c31_f731_x,
CONST_SR_8_uxn_opcodes_h_l2602_c31_f731_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_left,
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_right,
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_return_output,
 t16_MUX_uxn_opcodes_h_l2571_c2_f199_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output,
 t16_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output,
 t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output,
 CONST_SL_8_uxn_opcodes_h_l2581_c3_28ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_return_output,
 t16_MUX_uxn_opcodes_h_l2584_c7_8225_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output,
 t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d_return_output,
 sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_return_output,
 CONST_SR_8_uxn_opcodes_h_l2602_c31_f731_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_eff7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2571_c2_f199_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2571_c2_f199_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2572_c3_5ac9_uxn_opcodes_h_l2572_c3_5ac9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2577_c3_49f1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2576_c7_e01c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2582_c3_cd49 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2584_c7_8225_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2581_c3_28ca_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2581_c3_28ca_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_cdbb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2584_c7_8225_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2594_c3_f234 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_b81a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2597_c21_3a7f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_1094 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_f731_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_f731_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2602_c21_4055_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2599_l2587_l2584_DUPLICATE_f6cf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2592_l2584_DUPLICATE_ea47_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2571_l2599_l2587_l2584_DUPLICATE_3de2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2599_l2592_l2584_DUPLICATE_70ba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2571_l2599_l2587_l2584_DUPLICATE_e0e7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2599_l2592_l2587_l2584_DUPLICATE_5ad3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2588_l2580_DUPLICATE_23bd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2599_l2587_DUPLICATE_fd63_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b7e3_uxn_opcodes_h_l2610_l2567_DUPLICATE_28a4_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_cdbb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_cdbb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_right := to_unsigned(7, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2577_c3_49f1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2577_c3_49f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_y := resize(to_signed(-2, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2582_c3_cd49 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2582_c3_cd49;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_1094 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_1094;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_b81a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_b81a;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2594_c3_f234 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2594_c3_f234;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_eff7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_eff7;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_f731_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2584_c11_dac3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2571_c6_8ecf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2599_l2587_DUPLICATE_fd63 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2599_l2587_DUPLICATE_fd63_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l2602_c31_f731] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2602_c31_f731_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_f731_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_f731_return_output := CONST_SR_8_uxn_opcodes_h_l2602_c31_f731_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2599_l2587_l2584_DUPLICATE_f6cf LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2599_l2587_l2584_DUPLICATE_f6cf_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2576_c11_b31f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2590_c30_fd31] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_ins;
     sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_x;
     sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_return_output := sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2599_l2592_l2584_DUPLICATE_70ba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2599_l2592_l2584_DUPLICATE_70ba_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2599_c11_5f72] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_left;
     BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_return_output := BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2571_l2599_l2587_l2584_DUPLICATE_3de2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2571_l2599_l2587_l2584_DUPLICATE_3de2_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2588_l2580_DUPLICATE_23bd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2588_l2580_DUPLICATE_23bd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2571_l2599_l2587_l2584_DUPLICATE_e0e7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2571_l2599_l2587_l2584_DUPLICATE_e0e7_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2604_c11_d8a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2592_l2584_DUPLICATE_ea47 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2592_l2584_DUPLICATE_ea47_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2592_c11_6f9d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2587_c11_99a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2599_l2592_l2587_l2584_DUPLICATE_5ad3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2599_l2592_l2587_l2584_DUPLICATE_5ad3_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2579_c11_9047] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_left;
     BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_return_output := BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2597_c21_3a7f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2597_c21_3a7f_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2571_c2_f199_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_8ecf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2576_c7_e01c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_b31f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9047_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2584_c7_8225_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_dac3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_99a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_6f9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_5f72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_d8a0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2588_l2580_DUPLICATE_23bd_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2581_c3_28ca_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2588_l2580_DUPLICATE_23bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2597_c21_3a7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2592_l2584_DUPLICATE_ea47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2592_l2584_DUPLICATE_ea47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2592_l2584_DUPLICATE_ea47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2592_l2584_DUPLICATE_ea47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2592_l2584_DUPLICATE_ea47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2599_l2592_l2587_l2584_DUPLICATE_5ad3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2599_l2592_l2587_l2584_DUPLICATE_5ad3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2599_l2592_l2587_l2584_DUPLICATE_5ad3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2599_l2592_l2587_l2584_DUPLICATE_5ad3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2599_l2592_l2587_l2584_DUPLICATE_5ad3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2599_l2592_l2587_l2584_DUPLICATE_5ad3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2599_l2592_l2587_l2584_DUPLICATE_5ad3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2599_l2592_l2584_DUPLICATE_70ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2599_l2592_l2584_DUPLICATE_70ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2599_l2592_l2584_DUPLICATE_70ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2599_l2592_l2584_DUPLICATE_70ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2599_l2592_l2584_DUPLICATE_70ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2599_l2592_l2584_DUPLICATE_70ba_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2571_l2599_l2587_l2584_DUPLICATE_e0e7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2571_l2599_l2587_l2584_DUPLICATE_e0e7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2571_l2599_l2587_l2584_DUPLICATE_e0e7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2571_l2599_l2587_l2584_DUPLICATE_e0e7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2571_l2599_l2587_l2584_DUPLICATE_e0e7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2571_l2599_l2587_l2584_DUPLICATE_e0e7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2571_l2599_l2587_l2584_DUPLICATE_e0e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2571_l2599_l2587_l2584_DUPLICATE_3de2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2571_l2599_l2587_l2584_DUPLICATE_3de2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2571_l2599_l2587_l2584_DUPLICATE_3de2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2571_l2599_l2587_l2584_DUPLICATE_3de2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2571_l2599_l2587_l2584_DUPLICATE_3de2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2571_l2599_l2587_l2584_DUPLICATE_3de2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2579_l2576_l2604_l2571_l2599_l2587_l2584_DUPLICATE_3de2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2599_l2587_DUPLICATE_fd63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2599_l2587_DUPLICATE_fd63_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2599_l2587_l2584_DUPLICATE_f6cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2599_l2587_l2584_DUPLICATE_f6cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2599_l2587_l2584_DUPLICATE_f6cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2599_l2587_l2584_DUPLICATE_f6cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2599_l2587_l2584_DUPLICATE_f6cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2579_l2576_l2571_l2599_l2587_l2584_DUPLICATE_f6cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_fd31_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l2581_c3_28ca] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2581_c3_28ca_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2581_c3_28ca_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2581_c3_28ca_return_output := CONST_SL_8_uxn_opcodes_h_l2581_c3_28ca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2599_c7_0085] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2602_c21_4055] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2602_c21_4055_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_f731_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2604_c7_0a7d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2604_c7_0a7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2571_c1_45f9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2604_c7_0a7d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2592_c7_a9a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2588_c3_c15d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d_left;
     BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d_return_output := BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2599_c7_0085] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2588_c3_c15d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2602_c21_4055_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2581_c3_28ca_return_output;
     VAR_printf_uxn_opcodes_h_l2572_c3_5ac9_uxn_opcodes_h_l2572_c3_5ac9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_45f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_0085_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_0a7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_0085_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2599_c7_0085] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_return_output;

     -- t16_MUX[uxn_opcodes_h_l2587_c7_0fc9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond;
     t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue;
     t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output := t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output;

     -- printf_uxn_opcodes_h_l2572_c3_5ac9[uxn_opcodes_h_l2572_c3_5ac9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2572_c3_5ac9_uxn_opcodes_h_l2572_c3_5ac9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2572_c3_5ac9_uxn_opcodes_h_l2572_c3_5ac9_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2592_c7_a9a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2599_c7_0085] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2599_c7_0085] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2592_c7_a9a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2599_c7_0085] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_return_output := result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2587_c7_0fc9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_0085_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_0085_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_0085_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_0085_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2584_c7_8225] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_return_output;

     -- t16_MUX[uxn_opcodes_h_l2584_c7_8225] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2584_c7_8225_cond <= VAR_t16_MUX_uxn_opcodes_h_l2584_c7_8225_cond;
     t16_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue;
     t16_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2584_c7_8225_return_output := t16_MUX_uxn_opcodes_h_l2584_c7_8225_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2587_c7_0fc9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2592_c7_a9a6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2587_c7_0fc9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2592_c7_a9a6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2592_c7_a9a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2592_c7_a9a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_8225_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_a9a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2584_c7_8225_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2587_c7_0fc9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2584_c7_8225] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2584_c7_8225] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2587_c7_0fc9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output;

     -- t16_MUX[uxn_opcodes_h_l2579_c7_9bf7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond <= VAR_t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond;
     t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue;
     t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output := t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2587_c7_0fc9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2587_c7_0fc9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2579_c7_9bf7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_8225_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_8225_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_0fc9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2579_c7_9bf7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2584_c7_8225] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2584_c7_8225] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2584_c7_8225] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2576_c7_e01c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2579_c7_9bf7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2584_c7_8225] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_return_output := result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_return_output;

     -- t16_MUX[uxn_opcodes_h_l2576_c7_e01c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2576_c7_e01c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2576_c7_e01c_cond;
     t16_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue;
     t16_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output := t16_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_8225_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_8225_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_8225_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_8225_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output;
     -- t16_MUX[uxn_opcodes_h_l2571_c2_f199] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2571_c2_f199_cond <= VAR_t16_MUX_uxn_opcodes_h_l2571_c2_f199_cond;
     t16_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue;
     t16_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2571_c2_f199_return_output := t16_MUX_uxn_opcodes_h_l2571_c2_f199_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2576_c7_e01c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2579_c7_9bf7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2579_c7_9bf7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2579_c7_9bf7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2576_c7_e01c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2571_c2_f199] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2579_c7_9bf7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_9bf7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2571_c2_f199_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2576_c7_e01c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2576_c7_e01c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2571_c2_f199] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2576_c7_e01c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2576_c7_e01c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2571_c2_f199] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_e01c_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2571_c2_f199] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2571_c2_f199] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_return_output := result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2571_c2_f199] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2571_c2_f199] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b7e3_uxn_opcodes_h_l2610_l2567_DUPLICATE_28a4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b7e3_uxn_opcodes_h_l2610_l2567_DUPLICATE_28a4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b7e3(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_f199_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_f199_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_f199_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_f199_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_f199_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_f199_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_f199_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b7e3_uxn_opcodes_h_l2610_l2567_DUPLICATE_28a4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b7e3_uxn_opcodes_h_l2610_l2567_DUPLICATE_28a4_return_output;
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
