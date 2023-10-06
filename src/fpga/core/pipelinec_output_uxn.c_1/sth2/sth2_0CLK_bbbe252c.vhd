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
-- BIN_OP_EQ[uxn_opcodes_h_l2815_c6_b467]
signal BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2815_c1_90a8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2815_c2_972a]
signal t16_MUX_uxn_opcodes_h_l2815_c2_972a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2815_c2_972a_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2815_c2_972a]
signal result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2815_c2_972a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2815_c2_972a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2815_c2_972a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2815_c2_972a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2815_c2_972a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2815_c2_972a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2815_c2_972a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2816_c3_6173[uxn_opcodes_h_l2816_c3_6173]
signal printf_uxn_opcodes_h_l2816_c3_6173_uxn_opcodes_h_l2816_c3_6173_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2821_c11_ab4a]
signal BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2821_c7_6713]
signal t16_MUX_uxn_opcodes_h_l2821_c7_6713_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2821_c7_6713_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2821_c7_6713]
signal result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2821_c7_6713]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2821_c7_6713]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2821_c7_6713]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2821_c7_6713]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2821_c7_6713]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2821_c7_6713]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2821_c7_6713]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2824_c11_8a27]
signal BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2824_c7_b0ef]
signal t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2824_c7_b0ef]
signal result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2824_c7_b0ef]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2824_c7_b0ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2824_c7_b0ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2824_c7_b0ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2824_c7_b0ef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2824_c7_b0ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2824_c7_b0ef]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2826_c3_1f80]
signal CONST_SL_8_uxn_opcodes_h_l2826_c3_1f80_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2826_c3_1f80_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2829_c11_ca88]
signal BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2829_c7_76dd]
signal t16_MUX_uxn_opcodes_h_l2829_c7_76dd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2829_c7_76dd]
signal result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2829_c7_76dd]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2829_c7_76dd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2829_c7_76dd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2829_c7_76dd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2829_c7_76dd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2829_c7_76dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2829_c7_76dd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2832_c11_1083]
signal BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2832_c7_03dd]
signal t16_MUX_uxn_opcodes_h_l2832_c7_03dd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2832_c7_03dd]
signal result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2832_c7_03dd]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2832_c7_03dd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2832_c7_03dd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2832_c7_03dd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2832_c7_03dd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2832_c7_03dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2832_c7_03dd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2833_c3_ca19]
signal BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2836_c32_2275]
signal BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2836_c32_2fd0]
signal BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2836_c32_b40f]
signal MUX_uxn_opcodes_h_l2836_c32_b40f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2836_c32_b40f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2836_c32_b40f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2836_c32_b40f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2838_c11_d2ae]
signal BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2838_c7_f51c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2838_c7_f51c]
signal result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2838_c7_f51c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2838_c7_f51c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2838_c7_f51c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2838_c7_f51c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2838_c7_f51c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2842_c11_ce7f]
signal BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2842_c7_da53]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2842_c7_da53]
signal result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2842_c7_da53]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2842_c7_da53]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2842_c7_da53]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2842_c7_da53]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2848_c11_f05b]
signal BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2848_c7_f7cb]
signal result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2848_c7_f7cb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2848_c7_f7cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2848_c7_f7cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2848_c7_f7cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2850_c34_a5ef]
signal CONST_SR_8_uxn_opcodes_h_l2850_c34_a5ef_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2850_c34_a5ef_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2852_c11_56b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2852_c7_a0a6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2852_c7_a0a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2852_c7_a0a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c029( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_stack_read := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467
BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_left,
BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_right,
BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_return_output);

-- t16_MUX_uxn_opcodes_h_l2815_c2_972a
t16_MUX_uxn_opcodes_h_l2815_c2_972a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2815_c2_972a_cond,
t16_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue,
t16_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse,
t16_MUX_uxn_opcodes_h_l2815_c2_972a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a
result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a
result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a
result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a
result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a
result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_return_output);

-- printf_uxn_opcodes_h_l2816_c3_6173_uxn_opcodes_h_l2816_c3_6173
printf_uxn_opcodes_h_l2816_c3_6173_uxn_opcodes_h_l2816_c3_6173 : entity work.printf_uxn_opcodes_h_l2816_c3_6173_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2816_c3_6173_uxn_opcodes_h_l2816_c3_6173_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a
BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_left,
BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_right,
BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_return_output);

-- t16_MUX_uxn_opcodes_h_l2821_c7_6713
t16_MUX_uxn_opcodes_h_l2821_c7_6713 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2821_c7_6713_cond,
t16_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue,
t16_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse,
t16_MUX_uxn_opcodes_h_l2821_c7_6713_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713
result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_cond,
result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713
result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713
result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713
result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713
result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713
result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27
BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_left,
BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_right,
BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_return_output);

-- t16_MUX_uxn_opcodes_h_l2824_c7_b0ef
t16_MUX_uxn_opcodes_h_l2824_c7_b0ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond,
t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue,
t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse,
t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef
result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond,
result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef
result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef
result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef
result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef
result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2826_c3_1f80
CONST_SL_8_uxn_opcodes_h_l2826_c3_1f80 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2826_c3_1f80_x,
CONST_SL_8_uxn_opcodes_h_l2826_c3_1f80_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88
BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_left,
BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_right,
BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_return_output);

-- t16_MUX_uxn_opcodes_h_l2829_c7_76dd
t16_MUX_uxn_opcodes_h_l2829_c7_76dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2829_c7_76dd_cond,
t16_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue,
t16_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse,
t16_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd
result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_cond,
result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd
result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd
result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd
result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd
result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_left,
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_right,
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_return_output);

-- t16_MUX_uxn_opcodes_h_l2832_c7_03dd
t16_MUX_uxn_opcodes_h_l2832_c7_03dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2832_c7_03dd_cond,
t16_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue,
t16_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse,
t16_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd
result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_cond,
result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd
result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd
result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd
result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd
result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19
BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19_left,
BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19_right,
BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275
BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275_left,
BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275_right,
BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0
BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0_left,
BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0_right,
BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0_return_output);

-- MUX_uxn_opcodes_h_l2836_c32_b40f
MUX_uxn_opcodes_h_l2836_c32_b40f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2836_c32_b40f_cond,
MUX_uxn_opcodes_h_l2836_c32_b40f_iftrue,
MUX_uxn_opcodes_h_l2836_c32_b40f_iffalse,
MUX_uxn_opcodes_h_l2836_c32_b40f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae
BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_left,
BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_right,
BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c
result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c
result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c
result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c
result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f
BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_left,
BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_right,
BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53
result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53
result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_cond,
result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53
result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53
result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b
BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_left,
BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_right,
BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb
result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb
result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb
result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2850_c34_a5ef
CONST_SR_8_uxn_opcodes_h_l2850_c34_a5ef : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2850_c34_a5ef_x,
CONST_SR_8_uxn_opcodes_h_l2850_c34_a5ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2
BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6
result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6
result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_return_output,
 t16_MUX_uxn_opcodes_h_l2815_c2_972a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_return_output,
 t16_MUX_uxn_opcodes_h_l2821_c7_6713_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_return_output,
 t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output,
 CONST_SL_8_uxn_opcodes_h_l2826_c3_1f80_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_return_output,
 t16_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_return_output,
 t16_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0_return_output,
 MUX_uxn_opcodes_h_l2836_c32_b40f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output,
 CONST_SR_8_uxn_opcodes_h_l2850_c34_a5ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2821_c7_6713_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2815_c2_972a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2815_c2_972a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2818_c3_ceed : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2816_c3_6173_uxn_opcodes_h_l2816_c3_6173_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2821_c7_6713_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2822_c3_264c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2827_c3_7ca8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2826_c3_1f80_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2826_c3_1f80_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2829_c7_76dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2830_c3_6ee3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2832_c7_03dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2836_c32_b40f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2836_c32_b40f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2836_c32_b40f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2836_c32_b40f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2840_c3_256b : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2845_c3_836b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2846_c24_5952_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2849_c3_c82d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2850_c34_a5ef_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2850_c34_a5ef_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2850_c24_17d0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2848_l2815_l2838_l2832_DUPLICATE_38e4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2842_l2832_DUPLICATE_ceaa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2838_l2832_DUPLICATE_b92b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2815_l2838_DUPLICATE_f3b6_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2815_l2842_l2838_DUPLICATE_35d9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2842_l2838_l2832_DUPLICATE_b6bf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2824_l2829_l2821_l2832_DUPLICATE_4082_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2825_l2833_DUPLICATE_533e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2848_l2838_l2832_DUPLICATE_e416_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c029_uxn_opcodes_h_l2811_l2858_DUPLICATE_4088_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2822_c3_264c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2822_c3_264c;
     VAR_MUX_uxn_opcodes_h_l2836_c32_b40f_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2845_c3_836b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2845_c3_836b;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l2836_c32_b40f_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2849_c3_c82d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2849_c3_c82d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2830_c3_6ee3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2830_c3_6ee3;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2840_c3_256b := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2840_c3_256b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2827_c3_7ca8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2827_c3_7ca8;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2818_c3_ceed := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2818_c3_ceed;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2850_c34_a5ef_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2848_c11_f05b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2815_l2842_l2838_DUPLICATE_35d9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2815_l2842_l2838_DUPLICATE_35d9_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2824_l2829_l2821_l2832_DUPLICATE_4082 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2824_l2829_l2821_l2832_DUPLICATE_4082_return_output := result.is_stack_read;

     -- CONST_SR_8[uxn_opcodes_h_l2850_c34_a5ef] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2850_c34_a5ef_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2850_c34_a5ef_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2850_c34_a5ef_return_output := CONST_SR_8_uxn_opcodes_h_l2850_c34_a5ef_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2838_l2832_DUPLICATE_b92b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2838_l2832_DUPLICATE_b92b_return_output := result.is_stack_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2846_c24_5952] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2846_c24_5952_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2848_l2838_l2832_DUPLICATE_e416 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2848_l2838_l2832_DUPLICATE_e416_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2852_c11_56b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2838_c11_d2ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2824_c11_8a27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_left;
     BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_return_output := BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2821_c11_ab4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2848_l2815_l2838_l2832_DUPLICATE_38e4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2848_l2815_l2838_l2832_DUPLICATE_38e4_return_output := result.stack_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2815_l2838_DUPLICATE_f3b6 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2815_l2838_DUPLICATE_f3b6_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2842_l2838_l2832_DUPLICATE_b6bf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2842_l2838_l2832_DUPLICATE_b6bf_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2842_c11_ce7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2842_l2832_DUPLICATE_ceaa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2842_l2832_DUPLICATE_ceaa_return_output := result.is_stack_index_flipped;

     -- BIN_OP_AND[uxn_opcodes_h_l2836_c32_2275] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275_left;
     BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275_return_output := BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2829_c11_ca88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_left;
     BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_return_output := BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2825_l2833_DUPLICATE_533e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2825_l2833_DUPLICATE_533e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2832_c11_1083] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_left;
     BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_return_output := BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2815_c6_b467] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_left;
     BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_return_output := BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2836_c32_2275_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2815_c2_972a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c6_b467_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2821_c7_6713_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_ab4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_8a27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2829_c7_76dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_ca88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2832_c7_03dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_1083_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_d2ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_ce7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_f05b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_56b2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2825_l2833_DUPLICATE_533e_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2826_c3_1f80_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2825_l2833_DUPLICATE_533e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2846_c24_5952_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2815_l2838_DUPLICATE_f3b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2815_l2838_DUPLICATE_f3b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2815_l2838_DUPLICATE_f3b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2815_l2838_DUPLICATE_f3b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2815_l2838_DUPLICATE_f3b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2842_l2838_l2832_DUPLICATE_b6bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2842_l2838_l2832_DUPLICATE_b6bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2842_l2838_l2832_DUPLICATE_b6bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2842_l2838_l2832_DUPLICATE_b6bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2842_l2838_l2832_DUPLICATE_b6bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2842_l2838_l2832_DUPLICATE_b6bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2842_l2838_l2832_DUPLICATE_b6bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2842_l2838_l2832_DUPLICATE_b6bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2815_l2842_l2838_DUPLICATE_35d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2815_l2842_l2838_DUPLICATE_35d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2815_l2842_l2838_DUPLICATE_35d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2815_l2842_l2838_DUPLICATE_35d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2815_l2842_l2838_DUPLICATE_35d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2815_l2842_l2838_DUPLICATE_35d9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2842_l2832_DUPLICATE_ceaa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2842_l2832_DUPLICATE_ceaa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2842_l2832_DUPLICATE_ceaa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2842_l2832_DUPLICATE_ceaa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2842_l2832_DUPLICATE_ceaa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2842_l2832_DUPLICATE_ceaa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2842_l2832_DUPLICATE_ceaa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2842_l2832_DUPLICATE_ceaa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2824_l2829_l2821_l2832_DUPLICATE_4082_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2824_l2829_l2821_l2832_DUPLICATE_4082_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2824_l2829_l2821_l2832_DUPLICATE_4082_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2824_l2829_l2821_l2832_DUPLICATE_4082_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2838_l2832_DUPLICATE_b92b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2838_l2832_DUPLICATE_b92b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2838_l2832_DUPLICATE_b92b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2838_l2832_DUPLICATE_b92b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2838_l2832_DUPLICATE_b92b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2838_l2832_DUPLICATE_b92b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2838_l2832_DUPLICATE_b92b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2829_l2824_l2852_l2821_l2848_l2815_l2838_l2832_DUPLICATE_b92b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2848_l2838_l2832_DUPLICATE_e416_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2848_l2838_l2832_DUPLICATE_e416_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2848_l2838_l2832_DUPLICATE_e416_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2848_l2815_l2838_l2832_DUPLICATE_38e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2848_l2815_l2838_l2832_DUPLICATE_38e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2848_l2815_l2838_l2832_DUPLICATE_38e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2848_l2815_l2838_l2832_DUPLICATE_38e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2848_l2815_l2838_l2832_DUPLICATE_38e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2848_l2815_l2838_l2832_DUPLICATE_38e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2829_l2824_l2821_l2848_l2815_l2838_l2832_DUPLICATE_38e4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2815_c1_90a8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2842_c7_da53] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2850_c24_17d0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2850_c24_17d0_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2850_c34_a5ef_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2852_c7_a0a6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2836_c32_2fd0] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0_left;
     BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0_return_output := BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2852_c7_a0a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2832_c7_03dd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2826_c3_1f80] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2826_c3_1f80_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2826_c3_1f80_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2826_c3_1f80_return_output := CONST_SL_8_uxn_opcodes_h_l2826_c3_1f80_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2833_c3_ca19] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19_left;
     BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19_return_output := BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2838_c7_f51c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2852_c7_a0a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2848_c7_f7cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2836_c32_b40f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2836_c32_2fd0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2833_c3_ca19_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2850_c24_17d0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2826_c3_1f80_return_output;
     VAR_printf_uxn_opcodes_h_l2816_c3_6173_uxn_opcodes_h_l2816_c3_6173_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2815_c1_90a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2842_c7_da53_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_a0a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output;
     -- t16_MUX[uxn_opcodes_h_l2832_c7_03dd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2832_c7_03dd_cond <= VAR_t16_MUX_uxn_opcodes_h_l2832_c7_03dd_cond;
     t16_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue;
     t16_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output := t16_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2848_c7_f7cb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2842_c7_da53] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_return_output;

     -- MUX[uxn_opcodes_h_l2836_c32_b40f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2836_c32_b40f_cond <= VAR_MUX_uxn_opcodes_h_l2836_c32_b40f_cond;
     MUX_uxn_opcodes_h_l2836_c32_b40f_iftrue <= VAR_MUX_uxn_opcodes_h_l2836_c32_b40f_iftrue;
     MUX_uxn_opcodes_h_l2836_c32_b40f_iffalse <= VAR_MUX_uxn_opcodes_h_l2836_c32_b40f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2836_c32_b40f_return_output := MUX_uxn_opcodes_h_l2836_c32_b40f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2848_c7_f7cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output;

     -- printf_uxn_opcodes_h_l2816_c3_6173[uxn_opcodes_h_l2816_c3_6173] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2816_c3_6173_uxn_opcodes_h_l2816_c3_6173_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2816_c3_6173_uxn_opcodes_h_l2816_c3_6173_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2848_c7_f7cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2838_c7_f51c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2829_c7_76dd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2848_c7_f7cb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue := VAR_MUX_uxn_opcodes_h_l2836_c32_b40f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2842_c7_da53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_f7cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2832_c7_03dd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2842_c7_da53] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2842_c7_da53] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2842_c7_da53] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_return_output := result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2824_c7_b0ef] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2832_c7_03dd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2842_c7_da53] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_return_output;

     -- t16_MUX[uxn_opcodes_h_l2829_c7_76dd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2829_c7_76dd_cond <= VAR_t16_MUX_uxn_opcodes_h_l2829_c7_76dd_cond;
     t16_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue;
     t16_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output := t16_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2838_c7_f51c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2842_c7_da53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2842_c7_da53_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2842_c7_da53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2842_c7_da53_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2838_c7_f51c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2838_c7_f51c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2821_c7_6713] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2829_c7_76dd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2838_c7_f51c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2838_c7_f51c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2832_c7_03dd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output;

     -- t16_MUX[uxn_opcodes_h_l2824_c7_b0ef] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond <= VAR_t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond;
     t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue;
     t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output := t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2829_c7_76dd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2821_c7_6713_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2838_c7_f51c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2829_c7_76dd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2824_c7_b0ef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2832_c7_03dd] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2832_c7_03dd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2832_c7_03dd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output := result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2815_c2_972a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2824_c7_b0ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output;

     -- t16_MUX[uxn_opcodes_h_l2821_c7_6713] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2821_c7_6713_cond <= VAR_t16_MUX_uxn_opcodes_h_l2821_c7_6713_cond;
     t16_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue;
     t16_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2821_c7_6713_return_output := t16_MUX_uxn_opcodes_h_l2821_c7_6713_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2832_c7_03dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_03dd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2821_c7_6713_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2829_c7_76dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output;

     -- t16_MUX[uxn_opcodes_h_l2815_c2_972a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2815_c2_972a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2815_c2_972a_cond;
     t16_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue;
     t16_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2815_c2_972a_return_output := t16_MUX_uxn_opcodes_h_l2815_c2_972a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2821_c7_6713] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2821_c7_6713] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2829_c7_76dd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2829_c7_76dd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output := result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2829_c7_76dd] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2824_c7_b0ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2821_c7_6713_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2821_c7_6713_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_76dd_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2815_c2_972a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2815_c2_972a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2824_c7_b0ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2815_c2_972a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2824_c7_b0ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2821_c7_6713] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2824_c7_b0ef] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output := result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2824_c7_b0ef] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2821_c7_6713_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c7_b0ef_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2821_c7_6713] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_return_output := result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2821_c7_6713] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2815_c2_972a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2821_c7_6713] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2821_c7_6713] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_6713_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2821_c7_6713_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_6713_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2821_c7_6713_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2815_c2_972a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2815_c2_972a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2815_c2_972a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2815_c2_972a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c029_uxn_opcodes_h_l2811_l2858_DUPLICATE_4088 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c029_uxn_opcodes_h_l2811_l2858_DUPLICATE_4088_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c029(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c2_972a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2815_c2_972a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c2_972a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2815_c2_972a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c2_972a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c2_972a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c2_972a_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2815_c2_972a_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c029_uxn_opcodes_h_l2811_l2858_DUPLICATE_4088_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c029_uxn_opcodes_h_l2811_l2858_DUPLICATE_4088_return_output;
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
