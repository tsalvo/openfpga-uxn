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
-- BIN_OP_EQ[uxn_opcodes_h_l2571_c6_6ace]
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2571_c1_296c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2571_c2_8a53]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2571_c2_8a53]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2571_c2_8a53]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2571_c2_8a53]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2571_c2_8a53]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2571_c2_8a53]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2571_c2_8a53]
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2571_c2_8a53]
signal t16_MUX_uxn_opcodes_h_l2571_c2_8a53_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2572_c3_74b8[uxn_opcodes_h_l2572_c3_74b8]
signal printf_uxn_opcodes_h_l2572_c3_74b8_uxn_opcodes_h_l2572_c3_74b8_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2576_c11_259c]
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2576_c7_1fd2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2576_c7_1fd2]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2576_c7_1fd2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2576_c7_1fd2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2576_c7_1fd2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2576_c7_1fd2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2576_c7_1fd2]
signal result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2576_c7_1fd2]
signal t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2579_c11_9a37]
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2579_c7_445f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2579_c7_445f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2579_c7_445f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2579_c7_445f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2579_c7_445f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2579_c7_445f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2579_c7_445f]
signal result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2579_c7_445f]
signal t16_MUX_uxn_opcodes_h_l2579_c7_445f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2579_c7_445f_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2581_c3_cf97]
signal CONST_SL_8_uxn_opcodes_h_l2581_c3_cf97_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2581_c3_cf97_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2584_c11_fa91]
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2584_c7_f12b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2584_c7_f12b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2584_c7_f12b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2584_c7_f12b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2584_c7_f12b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2584_c7_f12b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2584_c7_f12b]
signal result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2584_c7_f12b]
signal t16_MUX_uxn_opcodes_h_l2584_c7_f12b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2587_c11_3170]
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2587_c7_fb8d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2587_c7_fb8d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2587_c7_fb8d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2587_c7_fb8d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2587_c7_fb8d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2587_c7_fb8d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2587_c7_fb8d]
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2587_c7_fb8d]
signal t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2588_c3_08bb]
signal BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2590_c30_46ef]
signal sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2592_c11_c144]
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2592_c7_ff85]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2592_c7_ff85]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2592_c7_ff85]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2592_c7_ff85]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2592_c7_ff85]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2592_c7_ff85]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2592_c7_ff85]
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2599_c11_7e9d]
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2599_c7_dd6e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2599_c7_dd6e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2599_c7_dd6e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2599_c7_dd6e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2599_c7_dd6e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2599_c7_dd6e]
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2602_c31_39cf]
signal CONST_SR_8_uxn_opcodes_h_l2602_c31_39cf_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2602_c31_39cf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2604_c11_7e87]
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2604_c7_7f93]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2604_c7_7f93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2604_c7_7f93]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5ef4( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace
BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_left,
BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_right,
BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53
result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_cond,
result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output);

-- t16_MUX_uxn_opcodes_h_l2571_c2_8a53
t16_MUX_uxn_opcodes_h_l2571_c2_8a53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2571_c2_8a53_cond,
t16_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue,
t16_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse,
t16_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output);

-- printf_uxn_opcodes_h_l2572_c3_74b8_uxn_opcodes_h_l2572_c3_74b8
printf_uxn_opcodes_h_l2572_c3_74b8_uxn_opcodes_h_l2572_c3_74b8 : entity work.printf_uxn_opcodes_h_l2572_c3_74b8_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2572_c3_74b8_uxn_opcodes_h_l2572_c3_74b8_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_left,
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_right,
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2
result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output);

-- t16_MUX_uxn_opcodes_h_l2576_c7_1fd2
t16_MUX_uxn_opcodes_h_l2576_c7_1fd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond,
t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue,
t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse,
t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_left,
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_right,
BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f
result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_return_output);

-- t16_MUX_uxn_opcodes_h_l2579_c7_445f
t16_MUX_uxn_opcodes_h_l2579_c7_445f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2579_c7_445f_cond,
t16_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue,
t16_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse,
t16_MUX_uxn_opcodes_h_l2579_c7_445f_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2581_c3_cf97
CONST_SL_8_uxn_opcodes_h_l2581_c3_cf97 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2581_c3_cf97_x,
CONST_SL_8_uxn_opcodes_h_l2581_c3_cf97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_left,
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_right,
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b
result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b
result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output);

-- t16_MUX_uxn_opcodes_h_l2584_c7_f12b
t16_MUX_uxn_opcodes_h_l2584_c7_f12b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2584_c7_f12b_cond,
t16_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue,
t16_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse,
t16_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_left,
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_right,
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d
result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output);

-- t16_MUX_uxn_opcodes_h_l2587_c7_fb8d
t16_MUX_uxn_opcodes_h_l2587_c7_fb8d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond,
t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue,
t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse,
t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb
BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb_left,
BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb_right,
BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef
sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_ins,
sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_x,
sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_y,
sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_left,
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_right,
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85
result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85
result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_cond,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_left,
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_right,
BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e
result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2602_c31_39cf
CONST_SR_8_uxn_opcodes_h_l2602_c31_39cf : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2602_c31_39cf_x,
CONST_SR_8_uxn_opcodes_h_l2602_c31_39cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_left,
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_right,
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output,
 t16_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output,
 t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_return_output,
 t16_MUX_uxn_opcodes_h_l2579_c7_445f_return_output,
 CONST_SL_8_uxn_opcodes_h_l2581_c3_cf97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output,
 t16_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output,
 t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb_return_output,
 sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output,
 CONST_SR_8_uxn_opcodes_h_l2602_c31_39cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_iffalse : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_75da : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2571_c2_8a53_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2572_c3_74b8_uxn_opcodes_h_l2572_c3_74b8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2577_c3_400e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2579_c7_445f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2582_c3_b490 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2579_c7_445f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2581_c3_cf97_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2581_c3_cf97_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_d3d8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2584_c7_f12b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2594_c3_fabb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_6a0b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2597_c21_6e0e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_bcea : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_39cf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_39cf_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2602_c21_82d9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2592_l2584_l2579_l2576_DUPLICATE_65ea_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_l2604_DUPLICATE_75f9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2571_l2599_l2592_l2584_l2579_l2576_DUPLICATE_ec65_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_l2604_DUPLICATE_971a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_DUPLICATE_5f01_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2599_l2592_l2587_l2584_l2579_l2576_l2604_DUPLICATE_0b22_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2588_l2580_DUPLICATE_6974_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2599_l2587_DUPLICATE_da30_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ef4_uxn_opcodes_h_l2610_l2567_DUPLICATE_7ee4_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2582_c3_b490 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2582_c3_b490;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2594_c3_fabb := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2594_c3_fabb;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_d3d8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_d3d8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_6a0b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2596_c3_6a0b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_75da := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_75da;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_bcea := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_bcea;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2577_c3_400e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2577_c3_400e;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_y := resize(to_signed(-2, 3), 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_39cf_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse := t16;
     -- CONST_SR_8[uxn_opcodes_h_l2602_c31_39cf] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2602_c31_39cf_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_39cf_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_39cf_return_output := CONST_SR_8_uxn_opcodes_h_l2602_c31_39cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2571_c6_6ace] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_left;
     BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_return_output := BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2590_c30_46ef] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_ins;
     sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_x;
     sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_return_output := sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2588_l2580_DUPLICATE_6974 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2588_l2580_DUPLICATE_6974_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2592_c11_c144] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_left;
     BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_return_output := BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_DUPLICATE_5f01 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_DUPLICATE_5f01_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2576_c11_259c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2599_l2592_l2587_l2584_l2579_l2576_l2604_DUPLICATE_0b22 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2599_l2592_l2587_l2584_l2579_l2576_l2604_DUPLICATE_0b22_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2604_c11_7e87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_left;
     BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_return_output := BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2592_l2584_l2579_l2576_DUPLICATE_65ea LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2592_l2584_l2579_l2576_DUPLICATE_65ea_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2597_c21_6e0e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2597_c21_6e0e_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2579_c11_9a37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_left;
     BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_return_output := BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2587_c11_3170] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_left;
     BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_return_output := BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_l2604_DUPLICATE_971a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_l2604_DUPLICATE_971a_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2571_l2599_l2592_l2584_l2579_l2576_DUPLICATE_ec65 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2571_l2599_l2592_l2584_l2579_l2576_DUPLICATE_ec65_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2599_l2587_DUPLICATE_da30 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2599_l2587_DUPLICATE_da30_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2599_c11_7e9d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2584_c11_fa91] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_left;
     BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_return_output := BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_l2604_DUPLICATE_75f9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_l2604_DUPLICATE_75f9_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2571_c2_8a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c6_6ace_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_259c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2579_c7_445f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2579_c11_9a37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2584_c7_f12b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_fa91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_3170_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_c144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2599_c11_7e9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_7e87_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2588_l2580_DUPLICATE_6974_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2581_c3_cf97_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2588_l2580_DUPLICATE_6974_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2597_c21_6e0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2592_l2584_l2579_l2576_DUPLICATE_65ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2592_l2584_l2579_l2576_DUPLICATE_65ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2592_l2584_l2579_l2576_DUPLICATE_65ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2592_l2584_l2579_l2576_DUPLICATE_65ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2592_l2584_l2579_l2576_DUPLICATE_65ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2599_l2592_l2587_l2584_l2579_l2576_l2604_DUPLICATE_0b22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2599_l2592_l2587_l2584_l2579_l2576_l2604_DUPLICATE_0b22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2599_l2592_l2587_l2584_l2579_l2576_l2604_DUPLICATE_0b22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2599_l2592_l2587_l2584_l2579_l2576_l2604_DUPLICATE_0b22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2599_l2592_l2587_l2584_l2579_l2576_l2604_DUPLICATE_0b22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2599_l2592_l2587_l2584_l2579_l2576_l2604_DUPLICATE_0b22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2599_l2592_l2587_l2584_l2579_l2576_l2604_DUPLICATE_0b22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2571_l2599_l2592_l2584_l2579_l2576_DUPLICATE_ec65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2571_l2599_l2592_l2584_l2579_l2576_DUPLICATE_ec65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2571_l2599_l2592_l2584_l2579_l2576_DUPLICATE_ec65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2571_l2599_l2592_l2584_l2579_l2576_DUPLICATE_ec65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2571_l2599_l2592_l2584_l2579_l2576_DUPLICATE_ec65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2571_l2599_l2592_l2584_l2579_l2576_DUPLICATE_ec65_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_l2604_DUPLICATE_75f9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_l2604_DUPLICATE_75f9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_l2604_DUPLICATE_75f9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_l2604_DUPLICATE_75f9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_l2604_DUPLICATE_75f9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_l2604_DUPLICATE_75f9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_l2604_DUPLICATE_75f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_l2604_DUPLICATE_971a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_l2604_DUPLICATE_971a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_l2604_DUPLICATE_971a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_l2604_DUPLICATE_971a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_l2604_DUPLICATE_971a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_l2604_DUPLICATE_971a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_l2604_DUPLICATE_971a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2599_l2587_DUPLICATE_da30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2599_l2587_DUPLICATE_da30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_DUPLICATE_5f01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_DUPLICATE_5f01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_DUPLICATE_5f01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_DUPLICATE_5f01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_DUPLICATE_5f01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2571_l2599_l2587_l2584_l2579_l2576_DUPLICATE_5f01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2590_c30_46ef_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2604_c7_7f93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2604_c7_7f93] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2604_c7_7f93] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2592_c7_ff85] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2571_c1_296c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2581_c3_cf97] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2581_c3_cf97_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2581_c3_cf97_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2581_c3_cf97_return_output := CONST_SL_8_uxn_opcodes_h_l2581_c3_cf97_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2599_c7_dd6e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2588_c3_08bb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb_left;
     BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb_return_output := BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2599_c7_dd6e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2602_c21_82d9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2602_c21_82d9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_39cf_return_output);

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2588_c3_08bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2602_c21_82d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2581_c3_cf97_return_output;
     VAR_printf_uxn_opcodes_h_l2572_c3_74b8_uxn_opcodes_h_l2572_c3_74b8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2571_c1_296c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_7f93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output;
     -- t16_MUX[uxn_opcodes_h_l2587_c7_fb8d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond;
     t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue;
     t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output := t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output;

     -- printf_uxn_opcodes_h_l2572_c3_74b8[uxn_opcodes_h_l2572_c3_74b8] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2572_c3_74b8_uxn_opcodes_h_l2572_c3_74b8_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2572_c3_74b8_uxn_opcodes_h_l2572_c3_74b8_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2587_c7_fb8d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2599_c7_dd6e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2599_c7_dd6e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2599_c7_dd6e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2592_c7_ff85] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2599_c7_dd6e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2592_c7_ff85] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2599_c7_dd6e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2592_c7_ff85] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2584_c7_f12b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2587_c7_fb8d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2584_c7_f12b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2584_c7_f12b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2584_c7_f12b_cond;
     t16_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue;
     t16_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output := t16_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2592_c7_ff85] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output := result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2592_c7_ff85] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2592_c7_ff85] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2587_c7_fb8d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_ff85_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2584_c7_f12b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2579_c7_445f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2584_c7_f12b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2587_c7_fb8d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2579_c7_445f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2579_c7_445f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2579_c7_445f_cond;
     t16_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue;
     t16_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2579_c7_445f_return_output := t16_MUX_uxn_opcodes_h_l2579_c7_445f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2587_c7_fb8d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2587_c7_fb8d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2587_c7_fb8d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2579_c7_445f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_fb8d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2579_c7_445f_return_output;
     -- t16_MUX[uxn_opcodes_h_l2576_c7_1fd2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond;
     t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue;
     t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output := t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2584_c7_f12b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2584_c7_f12b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2576_c7_1fd2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2584_c7_f12b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2579_c7_445f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2584_c7_f12b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2579_c7_445f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2579_c7_445f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2579_c7_445f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2584_c7_f12b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2571_c2_8a53] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2579_c7_445f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2576_c7_1fd2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2579_c7_445f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2579_c7_445f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2579_c7_445f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2576_c7_1fd2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2571_c2_8a53] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2571_c2_8a53_cond <= VAR_t16_MUX_uxn_opcodes_h_l2571_c2_8a53_cond;
     t16_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue;
     t16_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output := t16_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2579_c7_445f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2579_c7_445f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2579_c7_445f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2579_c7_445f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2576_c7_1fd2] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2571_c2_8a53] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2576_c7_1fd2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2576_c7_1fd2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2576_c7_1fd2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2571_c2_8a53] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2576_c7_1fd2_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2571_c2_8a53] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2571_c2_8a53] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2571_c2_8a53] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2571_c2_8a53] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output := result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5ef4_uxn_opcodes_h_l2610_l2567_DUPLICATE_7ee4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ef4_uxn_opcodes_h_l2610_l2567_DUPLICATE_7ee4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5ef4(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c2_8a53_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ef4_uxn_opcodes_h_l2610_l2567_DUPLICATE_7ee4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ef4_uxn_opcodes_h_l2610_l2567_DUPLICATE_7ee4_return_output;
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
