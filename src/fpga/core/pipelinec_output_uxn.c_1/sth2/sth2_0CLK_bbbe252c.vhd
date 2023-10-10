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
-- Submodules: 87
entity sth2_0CLK_bbbe252c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sth2_0CLK_bbbe252c;
architecture arch of sth2_0CLK_bbbe252c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2743_c6_a00b]
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c1_756e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2743_c2_130a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2743_c2_130a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2743_c2_130a]
signal result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2743_c2_130a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2743_c2_130a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2743_c2_130a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2743_c2_130a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2743_c2_130a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2743_c2_130a]
signal t16_MUX_uxn_opcodes_h_l2743_c2_130a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2743_c2_130a_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2744_c3_4692[uxn_opcodes_h_l2744_c3_4692]
signal printf_uxn_opcodes_h_l2744_c3_4692_uxn_opcodes_h_l2744_c3_4692_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2749_c11_4713]
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2749_c7_74b8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2749_c7_74b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2749_c7_74b8]
signal result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2749_c7_74b8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2749_c7_74b8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2749_c7_74b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2749_c7_74b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2749_c7_74b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2749_c7_74b8]
signal t16_MUX_uxn_opcodes_h_l2749_c7_74b8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2752_c11_74a7]
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2752_c7_09dc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2752_c7_09dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2752_c7_09dc]
signal result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2752_c7_09dc]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2752_c7_09dc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2752_c7_09dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2752_c7_09dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2752_c7_09dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2752_c7_09dc]
signal t16_MUX_uxn_opcodes_h_l2752_c7_09dc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2754_c3_ff0d]
signal CONST_SL_8_uxn_opcodes_h_l2754_c3_ff0d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2754_c3_ff0d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2757_c11_a949]
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2757_c7_86ab]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2757_c7_86ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2757_c7_86ab]
signal result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2757_c7_86ab]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2757_c7_86ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2757_c7_86ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2757_c7_86ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2757_c7_86ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2757_c7_86ab]
signal t16_MUX_uxn_opcodes_h_l2757_c7_86ab_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2760_c11_cab1]
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2760_c7_da2f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2760_c7_da2f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2760_c7_da2f]
signal result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2760_c7_da2f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2760_c7_da2f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2760_c7_da2f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2760_c7_da2f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2760_c7_da2f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2760_c7_da2f]
signal t16_MUX_uxn_opcodes_h_l2760_c7_da2f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2761_c3_7199]
signal BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2764_c32_67cf]
signal BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2764_c32_1958]
signal BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2764_c32_6275]
signal MUX_uxn_opcodes_h_l2764_c32_6275_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2764_c32_6275_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2764_c32_6275_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2764_c32_6275_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_4e25]
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2766_c7_de16]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2766_c7_de16]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2766_c7_de16]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2766_c7_de16]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2766_c7_de16]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2766_c7_de16]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2766_c7_de16]
signal result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2770_c11_6d44]
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2770_c7_3c81]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2770_c7_3c81]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2770_c7_3c81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2770_c7_3c81]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2770_c7_3c81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2770_c7_3c81]
signal result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2776_c11_a3ce]
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2776_c7_2744]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2776_c7_2744]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2776_c7_2744]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2776_c7_2744]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2776_c7_2744]
signal result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2778_c34_5103]
signal CONST_SR_8_uxn_opcodes_h_l2778_c34_5103_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2778_c34_5103_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2780_c11_124a]
signal BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2780_c7_2160]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2780_c7_2160]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2780_c7_2160]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c4f3( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b
BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_left,
BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_right,
BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a
result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a
result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a
result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a
result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_return_output);

-- t16_MUX_uxn_opcodes_h_l2743_c2_130a
t16_MUX_uxn_opcodes_h_l2743_c2_130a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2743_c2_130a_cond,
t16_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue,
t16_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse,
t16_MUX_uxn_opcodes_h_l2743_c2_130a_return_output);

-- printf_uxn_opcodes_h_l2744_c3_4692_uxn_opcodes_h_l2744_c3_4692
printf_uxn_opcodes_h_l2744_c3_4692_uxn_opcodes_h_l2744_c3_4692 : entity work.printf_uxn_opcodes_h_l2744_c3_4692_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2744_c3_4692_uxn_opcodes_h_l2744_c3_4692_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_left,
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_right,
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8
result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8
result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8
result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8
result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8
result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output);

-- t16_MUX_uxn_opcodes_h_l2749_c7_74b8
t16_MUX_uxn_opcodes_h_l2749_c7_74b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2749_c7_74b8_cond,
t16_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue,
t16_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse,
t16_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_left,
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_right,
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc
result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc
result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_cond,
result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc
result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc
result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc
result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output);

-- t16_MUX_uxn_opcodes_h_l2752_c7_09dc
t16_MUX_uxn_opcodes_h_l2752_c7_09dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2752_c7_09dc_cond,
t16_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue,
t16_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse,
t16_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2754_c3_ff0d
CONST_SL_8_uxn_opcodes_h_l2754_c3_ff0d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2754_c3_ff0d_x,
CONST_SL_8_uxn_opcodes_h_l2754_c3_ff0d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_left,
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_right,
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab
result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab
result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_cond,
result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab
result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab
result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab
result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output);

-- t16_MUX_uxn_opcodes_h_l2757_c7_86ab
t16_MUX_uxn_opcodes_h_l2757_c7_86ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2757_c7_86ab_cond,
t16_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue,
t16_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse,
t16_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_left,
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_right,
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f
result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f
result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f
result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f
result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output);

-- t16_MUX_uxn_opcodes_h_l2760_c7_da2f
t16_MUX_uxn_opcodes_h_l2760_c7_da2f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2760_c7_da2f_cond,
t16_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue,
t16_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse,
t16_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199
BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199_left,
BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199_right,
BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf
BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf_left,
BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf_right,
BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958
BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958_left,
BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958_right,
BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958_return_output);

-- MUX_uxn_opcodes_h_l2764_c32_6275
MUX_uxn_opcodes_h_l2764_c32_6275 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2764_c32_6275_cond,
MUX_uxn_opcodes_h_l2764_c32_6275_iftrue,
MUX_uxn_opcodes_h_l2764_c32_6275_iffalse,
MUX_uxn_opcodes_h_l2764_c32_6275_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_left,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_right,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16
result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16
result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16
result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_cond,
result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_left,
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_right,
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81
result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81
result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_cond,
result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_left,
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_right,
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744
result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744
result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744
result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_cond,
result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2778_c34_5103
CONST_SR_8_uxn_opcodes_h_l2778_c34_5103 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2778_c34_5103_x,
CONST_SR_8_uxn_opcodes_h_l2778_c34_5103_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a
BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_left,
BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_right,
BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160
result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160
result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_return_output,
 t16_MUX_uxn_opcodes_h_l2743_c2_130a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output,
 t16_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output,
 t16_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output,
 CONST_SL_8_uxn_opcodes_h_l2754_c3_ff0d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output,
 t16_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output,
 t16_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958_return_output,
 MUX_uxn_opcodes_h_l2764_c32_6275_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_return_output,
 CONST_SR_8_uxn_opcodes_h_l2778_c34_5103_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2746_c3_28d8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2743_c2_130a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2743_c2_130a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2744_c3_4692_uxn_opcodes_h_l2744_c3_4692_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2750_c3_de88 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2749_c7_74b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2755_c3_fea0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2752_c7_09dc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2754_c3_ff0d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2754_c3_ff0d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2758_c3_3e59 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2757_c7_86ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2760_c7_da2f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2764_c32_6275_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2764_c32_6275_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2764_c32_6275_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2764_c32_6275_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2768_c3_adca : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2773_c3_75eb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2774_c24_cfc1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2777_c3_32d3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2778_c34_5103_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2778_c34_5103_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2778_c24_9f6e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2749_l2776_DUPLICATE_6c44_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2743_l2770_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_eee6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2743_l2770_l2766_l2757_l2752_l2749_DUPLICATE_c7bf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2743_l2766_l2757_l2752_l2749_DUPLICATE_12b2_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_7b49_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2752_l2757_l2749_l2760_DUPLICATE_6d56_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2770_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_0aa2_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2753_l2761_DUPLICATE_c163_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2766_l2760_l2776_DUPLICATE_efa5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c4f3_uxn_opcodes_h_l2786_l2739_DUPLICATE_d725_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2750_c3_de88 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2750_c3_de88;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2764_c32_6275_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2777_c3_32d3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2777_c3_32d3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_right := to_unsigned(8, 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2746_c3_28d8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2746_c3_28d8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2773_c3_75eb := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2773_c3_75eb;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2764_c32_6275_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2758_c3_3e59 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2758_c3_3e59;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2755_c3_fea0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2755_c3_fea0;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf_right := to_unsigned(128, 8);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2768_c3_adca := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2768_c3_adca;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2778_c34_5103_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse := t16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2766_l2760_l2776_DUPLICATE_efa5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2766_l2760_l2776_DUPLICATE_efa5_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2753_l2761_DUPLICATE_c163 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2753_l2761_DUPLICATE_c163_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2743_l2770_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_eee6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2743_l2770_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_eee6_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2757_c11_a949] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_left;
     BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_return_output := BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2764_c32_67cf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf_left;
     BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf_return_output := BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2752_c11_74a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2743_l2766_l2757_l2752_l2749_DUPLICATE_12b2 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2743_l2766_l2757_l2752_l2749_DUPLICATE_12b2_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l2778_c34_5103] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2778_c34_5103_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2778_c34_5103_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2778_c34_5103_return_output := CONST_SR_8_uxn_opcodes_h_l2778_c34_5103_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2743_c6_a00b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2760_c11_cab1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2752_l2757_l2749_l2760_DUPLICATE_6d56 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2752_l2757_l2749_l2760_DUPLICATE_6d56_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2749_c11_4713] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_left;
     BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_return_output := BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2770_c11_6d44] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_left;
     BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_return_output := BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2743_l2770_l2766_l2757_l2752_l2749_DUPLICATE_c7bf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2743_l2770_l2766_l2757_l2752_l2749_DUPLICATE_c7bf_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_7b49 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_7b49_return_output := result.is_stack_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2774_c24_cfc1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2774_c24_cfc1_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_4e25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_left;
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_return_output := BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2780_c11_124a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2770_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_0aa2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2770_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_0aa2_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2776_c11_a3ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2749_l2776_DUPLICATE_6c44 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2749_l2776_DUPLICATE_6c44_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2764_c32_67cf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2743_c2_130a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c6_a00b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2749_c7_74b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_4713_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2752_c7_09dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_74a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2757_c7_86ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a949_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2760_c7_da2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_cab1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_4e25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_6d44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_a3ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2780_c11_124a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2753_l2761_DUPLICATE_c163_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2754_c3_ff0d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2753_l2761_DUPLICATE_c163_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2774_c24_cfc1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2743_l2766_l2757_l2752_l2749_DUPLICATE_12b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2743_l2766_l2757_l2752_l2749_DUPLICATE_12b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2743_l2766_l2757_l2752_l2749_DUPLICATE_12b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2743_l2766_l2757_l2752_l2749_DUPLICATE_12b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2743_l2766_l2757_l2752_l2749_DUPLICATE_12b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2770_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_0aa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2770_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_0aa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2770_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_0aa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2770_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_0aa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2770_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_0aa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2770_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_0aa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2770_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_0aa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2770_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_0aa2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2743_l2770_l2766_l2757_l2752_l2749_DUPLICATE_c7bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2743_l2770_l2766_l2757_l2752_l2749_DUPLICATE_c7bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2743_l2770_l2766_l2757_l2752_l2749_DUPLICATE_c7bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2743_l2770_l2766_l2757_l2752_l2749_DUPLICATE_c7bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2743_l2770_l2766_l2757_l2752_l2749_DUPLICATE_c7bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2743_l2770_l2766_l2757_l2752_l2749_DUPLICATE_c7bf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2743_l2770_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_eee6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2743_l2770_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_eee6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2743_l2770_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_eee6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2743_l2770_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_eee6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2743_l2770_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_eee6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2743_l2770_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_eee6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2743_l2770_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_eee6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2743_l2770_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_eee6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2752_l2757_l2749_l2760_DUPLICATE_6d56_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2752_l2757_l2749_l2760_DUPLICATE_6d56_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2752_l2757_l2749_l2760_DUPLICATE_6d56_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2752_l2757_l2749_l2760_DUPLICATE_6d56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_7b49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_7b49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_7b49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_7b49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_7b49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_7b49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_7b49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2780_l2749_l2776_DUPLICATE_7b49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2766_l2760_l2776_DUPLICATE_efa5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2766_l2760_l2776_DUPLICATE_efa5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2766_l2760_l2776_DUPLICATE_efa5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2749_l2776_DUPLICATE_6c44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2749_l2776_DUPLICATE_6c44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2749_l2776_DUPLICATE_6c44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2749_l2776_DUPLICATE_6c44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2749_l2776_DUPLICATE_6c44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2749_l2776_DUPLICATE_6c44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2743_l2766_l2760_l2757_l2752_l2749_l2776_DUPLICATE_6c44_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2766_c7_de16] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2780_c7_2160] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2780_c7_2160] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2754_c3_ff0d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2754_c3_ff0d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2754_c3_ff0d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2754_c3_ff0d_return_output := CONST_SL_8_uxn_opcodes_h_l2754_c3_ff0d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2778_c24_9f6e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2778_c24_9f6e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2778_c34_5103_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l2764_c32_1958] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958_left;
     BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958_return_output := BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2776_c7_2744] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2760_c7_da2f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2761_c3_7199] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199_left;
     BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199_return_output := BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c1_756e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2770_c7_3c81] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2780_c7_2160] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2764_c32_6275_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2764_c32_1958_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2761_c3_7199_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2778_c24_9f6e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2754_c3_ff0d_return_output;
     VAR_printf_uxn_opcodes_h_l2744_c3_4692_uxn_opcodes_h_l2744_c3_4692_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_756e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2780_c7_2160_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2780_c7_2160_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2780_c7_2160_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_de16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_2744_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2776_c7_2744] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2766_c7_de16] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_return_output;

     -- MUX[uxn_opcodes_h_l2764_c32_6275] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2764_c32_6275_cond <= VAR_MUX_uxn_opcodes_h_l2764_c32_6275_cond;
     MUX_uxn_opcodes_h_l2764_c32_6275_iftrue <= VAR_MUX_uxn_opcodes_h_l2764_c32_6275_iftrue;
     MUX_uxn_opcodes_h_l2764_c32_6275_iffalse <= VAR_MUX_uxn_opcodes_h_l2764_c32_6275_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2764_c32_6275_return_output := MUX_uxn_opcodes_h_l2764_c32_6275_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2776_c7_2744] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_return_output := result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2757_c7_86ab] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output;

     -- t16_MUX[uxn_opcodes_h_l2760_c7_da2f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2760_c7_da2f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2760_c7_da2f_cond;
     t16_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue;
     t16_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output := t16_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2776_c7_2744] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2770_c7_3c81] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output;

     -- printf_uxn_opcodes_h_l2744_c3_4692[uxn_opcodes_h_l2744_c3_4692] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2744_c3_4692_uxn_opcodes_h_l2744_c3_4692_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2744_c3_4692_uxn_opcodes_h_l2744_c3_4692_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2776_c7_2744] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue := VAR_MUX_uxn_opcodes_h_l2764_c32_6275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_2744_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_de16_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2776_c7_2744_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_2744_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2776_c7_2744_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2752_c7_09dc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2770_c7_3c81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2770_c7_3c81] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output := result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2760_c7_da2f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2757_c7_86ab] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2757_c7_86ab_cond <= VAR_t16_MUX_uxn_opcodes_h_l2757_c7_86ab_cond;
     t16_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue;
     t16_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output := t16_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2770_c7_3c81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2760_c7_da2f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2766_c7_de16] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2770_c7_3c81] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_de16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2770_c7_3c81_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output;
     -- t16_MUX[uxn_opcodes_h_l2752_c7_09dc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2752_c7_09dc_cond <= VAR_t16_MUX_uxn_opcodes_h_l2752_c7_09dc_cond;
     t16_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue;
     t16_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output := t16_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2766_c7_de16] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2766_c7_de16] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2757_c7_86ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2766_c7_de16] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_return_output := result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2760_c7_da2f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2757_c7_86ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2766_c7_de16] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2749_c7_74b8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_de16_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2766_c7_de16_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_de16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_de16_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2757_c7_86ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2760_c7_da2f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2752_c7_09dc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output;

     -- t16_MUX[uxn_opcodes_h_l2749_c7_74b8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2749_c7_74b8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2749_c7_74b8_cond;
     t16_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue;
     t16_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output := t16_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2743_c2_130a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2760_c7_da2f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2760_c7_da2f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2760_c7_da2f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2752_c7_09dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_da2f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2749_c7_74b8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2752_c7_09dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2757_c7_86ab] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output := result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2757_c7_86ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2757_c7_86ab] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2749_c7_74b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output;

     -- t16_MUX[uxn_opcodes_h_l2743_c2_130a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2743_c2_130a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2743_c2_130a_cond;
     t16_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue;
     t16_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2743_c2_130a_return_output := t16_MUX_uxn_opcodes_h_l2743_c2_130a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2757_c7_86ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_86ab_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2743_c2_130a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2743_c2_130a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2752_c7_09dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2752_c7_09dc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output := result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2752_c7_09dc] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2749_c7_74b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2743_c2_130a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2752_c7_09dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2752_c7_09dc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2749_c7_74b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2749_c7_74b8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2749_c7_74b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2743_c2_130a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2749_c7_74b8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2749_c7_74b8_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2743_c2_130a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2743_c2_130a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2743_c2_130a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2743_c2_130a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c4f3_uxn_opcodes_h_l2786_l2739_DUPLICATE_d725 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c4f3_uxn_opcodes_h_l2786_l2739_DUPLICATE_d725_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c4f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2743_c2_130a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c2_130a_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c2_130a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2743_c2_130a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c2_130a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c2_130a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c2_130a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c2_130a_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c4f3_uxn_opcodes_h_l2786_l2739_DUPLICATE_d725_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c4f3_uxn_opcodes_h_l2786_l2739_DUPLICATE_d725_return_output;
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
