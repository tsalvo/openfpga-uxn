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
-- Submodules: 82
entity sth2_0CLK_f1c92b33 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sth2_0CLK_f1c92b33;
architecture arch of sth2_0CLK_f1c92b33 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2633_c6_b747]
signal BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2633_c1_873f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2633_c2_a451]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2633_c2_a451]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2633_c2_a451]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2633_c2_a451]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2633_c2_a451]
signal result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2633_c2_a451]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2633_c2_a451]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2633_c2_a451]
signal t16_MUX_uxn_opcodes_h_l2633_c2_a451_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2633_c2_a451_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2634_c3_b808[uxn_opcodes_h_l2634_c3_b808]
signal printf_uxn_opcodes_h_l2634_c3_b808_uxn_opcodes_h_l2634_c3_b808_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2638_c11_bdd2]
signal BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2638_c7_99cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2638_c7_99cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2638_c7_99cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2638_c7_99cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2638_c7_99cb]
signal result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2638_c7_99cb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2638_c7_99cb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2638_c7_99cb]
signal t16_MUX_uxn_opcodes_h_l2638_c7_99cb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2641_c11_76a3]
signal BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2641_c7_7f40]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2641_c7_7f40]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2641_c7_7f40]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2641_c7_7f40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2641_c7_7f40]
signal result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2641_c7_7f40]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2641_c7_7f40]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2641_c7_7f40]
signal t16_MUX_uxn_opcodes_h_l2641_c7_7f40_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2643_c3_cccc]
signal CONST_SL_8_uxn_opcodes_h_l2643_c3_cccc_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2643_c3_cccc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2646_c11_937a]
signal BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2646_c7_575f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2646_c7_575f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2646_c7_575f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2646_c7_575f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2646_c7_575f]
signal result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2646_c7_575f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2646_c7_575f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2646_c7_575f]
signal t16_MUX_uxn_opcodes_h_l2646_c7_575f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2646_c7_575f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2649_c11_d9a6]
signal BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2649_c7_a562]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2649_c7_a562]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2649_c7_a562]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2649_c7_a562]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2649_c7_a562]
signal result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2649_c7_a562]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2649_c7_a562]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2649_c7_a562]
signal t16_MUX_uxn_opcodes_h_l2649_c7_a562_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2649_c7_a562_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2650_c3_9d7f]
signal BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2652_c32_174e]
signal BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2652_c32_3558]
signal BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2652_c32_3973]
signal MUX_uxn_opcodes_h_l2652_c32_3973_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2652_c32_3973_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2652_c32_3973_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2652_c32_3973_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2654_c11_a6c2]
signal BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2654_c7_3e1a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2654_c7_3e1a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2654_c7_3e1a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2654_c7_3e1a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2654_c7_3e1a]
signal result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2654_c7_3e1a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2654_c7_3e1a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2658_c11_48ae]
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2658_c7_9fbb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2658_c7_9fbb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2658_c7_9fbb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2658_c7_9fbb]
signal result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2658_c7_9fbb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2658_c7_9fbb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2664_c11_512d]
signal BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2664_c7_2c36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2664_c7_2c36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2664_c7_2c36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2664_c7_2c36]
signal result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2664_c7_2c36]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2666_c34_1904]
signal CONST_SR_8_uxn_opcodes_h_l2666_c34_1904_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2666_c34_1904_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2668_c11_6084]
signal BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2668_c7_e1cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2668_c7_e1cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2668_c7_e1cc]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_06e4( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747
BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_left,
BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_right,
BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451
result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451
result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451
result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451
result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_cond,
result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451
result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_return_output);

-- t16_MUX_uxn_opcodes_h_l2633_c2_a451
t16_MUX_uxn_opcodes_h_l2633_c2_a451 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2633_c2_a451_cond,
t16_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue,
t16_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse,
t16_MUX_uxn_opcodes_h_l2633_c2_a451_return_output);

-- printf_uxn_opcodes_h_l2634_c3_b808_uxn_opcodes_h_l2634_c3_b808
printf_uxn_opcodes_h_l2634_c3_b808_uxn_opcodes_h_l2634_c3_b808 : entity work.printf_uxn_opcodes_h_l2634_c3_b808_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2634_c3_b808_uxn_opcodes_h_l2634_c3_b808_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2
BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_left,
BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_right,
BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb
result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb
result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb
result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb
result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output);

-- t16_MUX_uxn_opcodes_h_l2638_c7_99cb
t16_MUX_uxn_opcodes_h_l2638_c7_99cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2638_c7_99cb_cond,
t16_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue,
t16_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse,
t16_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3
BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_left,
BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_right,
BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40
result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40
result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_cond,
result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40
result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output);

-- t16_MUX_uxn_opcodes_h_l2641_c7_7f40
t16_MUX_uxn_opcodes_h_l2641_c7_7f40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2641_c7_7f40_cond,
t16_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue,
t16_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse,
t16_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2643_c3_cccc
CONST_SL_8_uxn_opcodes_h_l2643_c3_cccc : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2643_c3_cccc_x,
CONST_SL_8_uxn_opcodes_h_l2643_c3_cccc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a
BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_left,
BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_right,
BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f
result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f
result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f
result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f
result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_return_output);

-- t16_MUX_uxn_opcodes_h_l2646_c7_575f
t16_MUX_uxn_opcodes_h_l2646_c7_575f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2646_c7_575f_cond,
t16_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue,
t16_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse,
t16_MUX_uxn_opcodes_h_l2646_c7_575f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6
BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_left,
BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_right,
BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562
result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_cond,
result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_return_output);

-- t16_MUX_uxn_opcodes_h_l2649_c7_a562
t16_MUX_uxn_opcodes_h_l2649_c7_a562 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2649_c7_a562_cond,
t16_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue,
t16_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse,
t16_MUX_uxn_opcodes_h_l2649_c7_a562_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f
BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f_left,
BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f_right,
BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e
BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e_left,
BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e_right,
BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558
BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558_left,
BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558_right,
BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558_return_output);

-- MUX_uxn_opcodes_h_l2652_c32_3973
MUX_uxn_opcodes_h_l2652_c32_3973 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2652_c32_3973_cond,
MUX_uxn_opcodes_h_l2652_c32_3973_iftrue,
MUX_uxn_opcodes_h_l2652_c32_3973_iffalse,
MUX_uxn_opcodes_h_l2652_c32_3973_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2
BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_left,
BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_right,
BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a
result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a
result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a
result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a
result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_left,
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_right,
BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb
result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d
BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_left,
BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_right,
BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36
result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36
result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36
result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_cond,
result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2666_c34_1904
CONST_SR_8_uxn_opcodes_h_l2666_c34_1904 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2666_c34_1904_x,
CONST_SR_8_uxn_opcodes_h_l2666_c34_1904_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084
BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_left,
BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_right,
BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc
result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_return_output,
 t16_MUX_uxn_opcodes_h_l2633_c2_a451_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output,
 t16_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output,
 t16_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output,
 CONST_SL_8_uxn_opcodes_h_l2643_c3_cccc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_return_output,
 t16_MUX_uxn_opcodes_h_l2646_c7_575f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_return_output,
 t16_MUX_uxn_opcodes_h_l2649_c7_a562_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558_return_output,
 MUX_uxn_opcodes_h_l2652_c32_3973_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output,
 CONST_SR_8_uxn_opcodes_h_l2666_c34_1904_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2635_c3_6be8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2633_c2_a451_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2633_c2_a451_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2634_c3_b808_uxn_opcodes_h_l2634_c3_b808_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2639_c3_f881 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2638_c7_99cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2644_c3_4764 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2646_c7_575f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2641_c7_7f40_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2643_c3_cccc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2643_c3_cccc_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2647_c3_5cb1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2649_c7_a562_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2646_c7_575f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2649_c7_a562_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2652_c32_3973_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2652_c32_3973_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2652_c32_3973_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2652_c32_3973_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2656_c3_fe10 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2661_c3_4e1d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2662_c24_7988_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2665_c3_f406 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2666_c34_1904_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2666_c34_1904_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2666_c24_c312_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2654_DUPLICATE_d7fb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2646_l2641_l2638_l2633_l2654_DUPLICATE_c40a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2638_l2664_l2633_l2654_DUPLICATE_1416_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2646_l2641_l2638_l2633_l2658_l2654_DUPLICATE_b300_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2658_DUPLICATE_079d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2658_l2654_DUPLICATE_0d5c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2642_l2650_DUPLICATE_084f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2649_l2664_l2654_DUPLICATE_ac5b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_06e4_uxn_opcodes_h_l2674_l2629_DUPLICATE_f7f5_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2661_c3_4e1d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2661_c3_4e1d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2639_c3_f881 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2639_c3_f881;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l2652_c32_3973_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2644_c3_4764 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2644_c3_4764;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2665_c3_f406 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2665_c3_f406;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2652_c32_3973_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2647_c3_5cb1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2647_c3_5cb1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2656_c3_fe10 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2656_c3_fe10;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2635_c3_6be8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2635_c3_6be8;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2666_c34_1904_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2654_DUPLICATE_d7fb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2654_DUPLICATE_d7fb_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2642_l2650_DUPLICATE_084f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2642_l2650_DUPLICATE_084f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2641_c11_76a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2658_DUPLICATE_079d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2658_DUPLICATE_079d_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2658_l2654_DUPLICATE_0d5c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2658_l2654_DUPLICATE_0d5c_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2646_l2641_l2638_l2633_l2658_l2654_DUPLICATE_b300 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2646_l2641_l2638_l2633_l2658_l2654_DUPLICATE_b300_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2638_c11_bdd2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2654_c11_a6c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2649_l2664_l2654_DUPLICATE_ac5b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2649_l2664_l2654_DUPLICATE_ac5b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2668_c11_6084] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_left;
     BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_return_output := BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2638_l2664_l2633_l2654_DUPLICATE_1416 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2638_l2664_l2633_l2654_DUPLICATE_1416_return_output := result.stack_value;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2662_c24_7988] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2662_c24_7988_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2646_c11_937a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2649_c11_d9a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2664_c11_512d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2646_l2641_l2638_l2633_l2654_DUPLICATE_c40a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2646_l2641_l2638_l2633_l2654_DUPLICATE_c40a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2633_c6_b747] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_left;
     BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_return_output := BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2658_c11_48ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2652_c32_174e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e_left;
     BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e_return_output := BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2666_c34_1904] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2666_c34_1904_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2666_c34_1904_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2666_c34_1904_return_output := CONST_SR_8_uxn_opcodes_h_l2666_c34_1904_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2652_c32_174e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2633_c2_a451_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c6_b747_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2638_c7_99cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2638_c11_bdd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2641_c7_7f40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2641_c11_76a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2646_c7_575f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2646_c11_937a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2649_c7_a562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2649_c11_d9a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2654_c11_a6c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c11_48ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_512d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_6084_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2642_l2650_DUPLICATE_084f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2643_c3_cccc_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2642_l2650_DUPLICATE_084f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2662_c24_7988_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2646_l2641_l2638_l2633_l2654_DUPLICATE_c40a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2646_l2641_l2638_l2633_l2654_DUPLICATE_c40a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2646_l2641_l2638_l2633_l2654_DUPLICATE_c40a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2646_l2641_l2638_l2633_l2654_DUPLICATE_c40a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2646_l2641_l2638_l2633_l2654_DUPLICATE_c40a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2658_l2654_DUPLICATE_0d5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2658_l2654_DUPLICATE_0d5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2658_l2654_DUPLICATE_0d5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2658_l2654_DUPLICATE_0d5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2658_l2654_DUPLICATE_0d5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2658_l2654_DUPLICATE_0d5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2658_l2654_DUPLICATE_0d5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2658_l2654_DUPLICATE_0d5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2646_l2641_l2638_l2633_l2658_l2654_DUPLICATE_b300_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2646_l2641_l2638_l2633_l2658_l2654_DUPLICATE_b300_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2646_l2641_l2638_l2633_l2658_l2654_DUPLICATE_b300_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2646_l2641_l2638_l2633_l2658_l2654_DUPLICATE_b300_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2646_l2641_l2638_l2633_l2658_l2654_DUPLICATE_b300_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2646_l2641_l2638_l2633_l2658_l2654_DUPLICATE_b300_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2658_DUPLICATE_079d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2658_DUPLICATE_079d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2658_DUPLICATE_079d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2658_DUPLICATE_079d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2658_DUPLICATE_079d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2658_DUPLICATE_079d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2658_DUPLICATE_079d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2658_DUPLICATE_079d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2654_DUPLICATE_d7fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2654_DUPLICATE_d7fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2654_DUPLICATE_d7fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2654_DUPLICATE_d7fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2654_DUPLICATE_d7fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2654_DUPLICATE_d7fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2654_DUPLICATE_d7fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2668_l2638_l2664_l2633_l2654_DUPLICATE_d7fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2649_l2664_l2654_DUPLICATE_ac5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2649_l2664_l2654_DUPLICATE_ac5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2649_l2664_l2654_DUPLICATE_ac5b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2638_l2664_l2633_l2654_DUPLICATE_1416_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2638_l2664_l2633_l2654_DUPLICATE_1416_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2638_l2664_l2633_l2654_DUPLICATE_1416_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2638_l2664_l2633_l2654_DUPLICATE_1416_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2638_l2664_l2633_l2654_DUPLICATE_1416_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2638_l2664_l2633_l2654_DUPLICATE_1416_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2649_l2646_l2641_l2638_l2664_l2633_l2654_DUPLICATE_1416_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2658_c7_9fbb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2643_c3_cccc] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2643_c3_cccc_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2643_c3_cccc_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2643_c3_cccc_return_output := CONST_SL_8_uxn_opcodes_h_l2643_c3_cccc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2650_c3_9d7f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f_left;
     BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f_return_output := BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2633_c1_873f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2668_c7_e1cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2668_c7_e1cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2666_c24_c312] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2666_c24_c312_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2666_c34_1904_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2664_c7_2c36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2668_c7_e1cc] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2652_c32_3558] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558_left;
     BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558_return_output := BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2654_c7_3e1a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2652_c32_3973_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2652_c32_3558_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2650_c3_9d7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2666_c24_c312_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2643_c3_cccc_return_output;
     VAR_printf_uxn_opcodes_h_l2634_c3_b808_uxn_opcodes_h_l2634_c3_b808_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2633_c1_873f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_e1cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2664_c7_2c36] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output := result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2664_c7_2c36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2664_c7_2c36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output;

     -- printf_uxn_opcodes_h_l2634_c3_b808[uxn_opcodes_h_l2634_c3_b808] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2634_c3_b808_uxn_opcodes_h_l2634_c3_b808_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2634_c3_b808_uxn_opcodes_h_l2634_c3_b808_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2654_c7_3e1a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2649_c7_a562] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2649_c7_a562_cond <= VAR_t16_MUX_uxn_opcodes_h_l2649_c7_a562_cond;
     t16_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue;
     t16_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2649_c7_a562_return_output := t16_MUX_uxn_opcodes_h_l2649_c7_a562_return_output;

     -- MUX[uxn_opcodes_h_l2652_c32_3973] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2652_c32_3973_cond <= VAR_MUX_uxn_opcodes_h_l2652_c32_3973_cond;
     MUX_uxn_opcodes_h_l2652_c32_3973_iftrue <= VAR_MUX_uxn_opcodes_h_l2652_c32_3973_iftrue;
     MUX_uxn_opcodes_h_l2652_c32_3973_iffalse <= VAR_MUX_uxn_opcodes_h_l2652_c32_3973_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2652_c32_3973_return_output := MUX_uxn_opcodes_h_l2652_c32_3973_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2664_c7_2c36] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2658_c7_9fbb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue := VAR_MUX_uxn_opcodes_h_l2652_c32_3973_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2664_c7_2c36_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2649_c7_a562_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2658_c7_9fbb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2654_c7_3e1a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2649_c7_a562] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_return_output;

     -- t16_MUX[uxn_opcodes_h_l2646_c7_575f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2646_c7_575f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2646_c7_575f_cond;
     t16_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue;
     t16_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2646_c7_575f_return_output := t16_MUX_uxn_opcodes_h_l2646_c7_575f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2658_c7_9fbb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2658_c7_9fbb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2658_c7_9fbb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2649_c7_a562] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2649_c7_a562_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2649_c7_a562_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2658_c7_9fbb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2646_c7_575f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2649_c7_a562] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2646_c7_575f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2654_c7_3e1a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2641_c7_7f40] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2641_c7_7f40_cond <= VAR_t16_MUX_uxn_opcodes_h_l2641_c7_7f40_cond;
     t16_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue;
     t16_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output := t16_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2654_c7_3e1a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2654_c7_3e1a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2646_c7_575f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2654_c7_3e1a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2646_c7_575f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2646_c7_575f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2649_c7_a562_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2654_c7_3e1a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2649_c7_a562] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2641_c7_7f40] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2646_c7_575f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2641_c7_7f40] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2649_c7_a562] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2649_c7_a562] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_return_output := result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2649_c7_a562] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_return_output;

     -- t16_MUX[uxn_opcodes_h_l2638_c7_99cb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2638_c7_99cb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2638_c7_99cb_cond;
     t16_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue;
     t16_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output := t16_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2649_c7_a562_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2649_c7_a562_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2649_c7_a562_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2646_c7_575f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2649_c7_a562_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output;
     -- t16_MUX[uxn_opcodes_h_l2633_c2_a451] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2633_c2_a451_cond <= VAR_t16_MUX_uxn_opcodes_h_l2633_c2_a451_cond;
     t16_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue;
     t16_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2633_c2_a451_return_output := t16_MUX_uxn_opcodes_h_l2633_c2_a451_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2641_c7_7f40] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2638_c7_99cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2638_c7_99cb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2646_c7_575f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2646_c7_575f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2646_c7_575f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2646_c7_575f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2646_c7_575f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2646_c7_575f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2646_c7_575f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2646_c7_575f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2633_c2_a451_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2641_c7_7f40] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output := result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2641_c7_7f40] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2641_c7_7f40] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2633_c2_a451] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2633_c2_a451] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2641_c7_7f40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2638_c7_99cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2641_c7_7f40_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2633_c2_a451] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2638_c7_99cb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2638_c7_99cb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2638_c7_99cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2638_c7_99cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2638_c7_99cb_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2633_c2_a451] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2633_c2_a451] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2633_c2_a451] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_return_output := result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2633_c2_a451] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_06e4_uxn_opcodes_h_l2674_l2629_DUPLICATE_f7f5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_06e4_uxn_opcodes_h_l2674_l2629_DUPLICATE_f7f5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_06e4(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2633_c2_a451_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c2_a451_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c2_a451_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c2_a451_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2633_c2_a451_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2633_c2_a451_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2633_c2_a451_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_06e4_uxn_opcodes_h_l2674_l2629_DUPLICATE_f7f5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_06e4_uxn_opcodes_h_l2674_l2629_DUPLICATE_f7f5_return_output;
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
