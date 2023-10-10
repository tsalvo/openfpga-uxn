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
-- Submodules: 104
entity jsr2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr2_0CLK_3a9c1537;
architecture arch of jsr2_0CLK_3a9c1537 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l840_c6_b845]
signal BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l840_c1_5731]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l840_c2_3251]
signal result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l840_c2_3251]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l840_c2_3251]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l840_c2_3251]
signal result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l840_c2_3251]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l840_c2_3251]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l840_c2_3251]
signal result_pc_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l840_c2_3251_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l840_c2_3251]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l840_c2_3251]
signal result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l840_c2_3251]
signal result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l840_c2_3251]
signal t16_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l840_c2_3251_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l841_c3_66a5[uxn_opcodes_h_l841_c3_66a5]
signal printf_uxn_opcodes_h_l841_c3_66a5_uxn_opcodes_h_l841_c3_66a5_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l846_c11_2962]
signal BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l846_c7_3ea1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l846_c7_3ea1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l846_c7_3ea1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l846_c7_3ea1]
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l846_c7_3ea1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l846_c7_3ea1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l846_c7_3ea1]
signal result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l846_c7_3ea1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l846_c7_3ea1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l846_c7_3ea1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l846_c7_3ea1]
signal t16_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l849_c11_5657]
signal BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l849_c7_a8f3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l849_c7_a8f3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l849_c7_a8f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l849_c7_a8f3]
signal result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l849_c7_a8f3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l849_c7_a8f3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l849_c7_a8f3]
signal result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l849_c7_a8f3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l849_c7_a8f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l849_c7_a8f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l849_c7_a8f3]
signal t16_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l851_c3_582e]
signal CONST_SL_8_uxn_opcodes_h_l851_c3_582e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l851_c3_582e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l854_c11_c408]
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l854_c7_1649]
signal result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l854_c7_1649]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c7_1649]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l854_c7_1649]
signal result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l854_c7_1649]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l854_c7_1649]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l854_c7_1649]
signal result_pc_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l854_c7_1649_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l854_c7_1649]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l854_c7_1649]
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l854_c7_1649]
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l854_c7_1649]
signal t16_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l854_c7_1649_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l857_c11_424e]
signal BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l857_c7_8ce1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l857_c7_8ce1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l857_c7_8ce1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l857_c7_8ce1]
signal result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l857_c7_8ce1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l857_c7_8ce1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l857_c7_8ce1]
signal result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l857_c7_8ce1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l857_c7_8ce1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l857_c7_8ce1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l857_c7_8ce1]
signal t16_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l858_c3_93a3]
signal BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l861_c32_111f]
signal BIN_OP_AND_uxn_opcodes_h_l861_c32_111f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l861_c32_111f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l861_c32_111f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l861_c32_4443]
signal BIN_OP_GT_uxn_opcodes_h_l861_c32_4443_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l861_c32_4443_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l861_c32_4443_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l861_c32_0e7d]
signal MUX_uxn_opcodes_h_l861_c32_0e7d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l861_c32_0e7d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l861_c32_0e7d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l861_c32_0e7d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l863_c11_7612]
signal BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l863_c7_148d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l863_c7_148d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l863_c7_148d]
signal result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l863_c7_148d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l863_c7_148d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l863_c7_148d]
signal result_pc_MUX_uxn_opcodes_h_l863_c7_148d_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l863_c7_148d_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l863_c7_148d_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l863_c7_148d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l863_c7_148d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l863_c7_148d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l863_c7_148d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l867_c11_4a46]
signal BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l867_c7_220c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l867_c7_220c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l867_c7_220c]
signal result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l867_c7_220c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l867_c7_220c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l867_c7_220c]
signal result_pc_MUX_uxn_opcodes_h_l867_c7_220c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l867_c7_220c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l867_c7_220c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l867_c7_220c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l867_c7_220c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l867_c7_220c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l873_c11_f64d]
signal BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l873_c7_f55c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l873_c7_f55c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l873_c7_f55c]
signal result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l873_c7_f55c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l873_c7_f55c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l873_c7_f55c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l873_c7_f55c]
signal result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l875_c34_caf2]
signal CONST_SR_8_uxn_opcodes_h_l875_c34_caf2_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l875_c34_caf2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l879_c11_0505]
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l879_c7_0829]
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l879_c7_0829]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l879_c7_0829]
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l879_c7_0829]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_4929( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.stack_value := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.pc := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_stack_write := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845
BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_left,
BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_right,
BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251
result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251
result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251
result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_cond,
result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251
result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_return_output);

-- result_pc_MUX_uxn_opcodes_h_l840_c2_3251
result_pc_MUX_uxn_opcodes_h_l840_c2_3251 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l840_c2_3251_cond,
result_pc_MUX_uxn_opcodes_h_l840_c2_3251_iftrue,
result_pc_MUX_uxn_opcodes_h_l840_c2_3251_iffalse,
result_pc_MUX_uxn_opcodes_h_l840_c2_3251_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251
result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251
result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251
result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_return_output);

-- t16_MUX_uxn_opcodes_h_l840_c2_3251
t16_MUX_uxn_opcodes_h_l840_c2_3251 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l840_c2_3251_cond,
t16_MUX_uxn_opcodes_h_l840_c2_3251_iftrue,
t16_MUX_uxn_opcodes_h_l840_c2_3251_iffalse,
t16_MUX_uxn_opcodes_h_l840_c2_3251_return_output);

-- printf_uxn_opcodes_h_l841_c3_66a5_uxn_opcodes_h_l841_c3_66a5
printf_uxn_opcodes_h_l841_c3_66a5_uxn_opcodes_h_l841_c3_66a5 : entity work.printf_uxn_opcodes_h_l841_c3_66a5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l841_c3_66a5_uxn_opcodes_h_l841_c3_66a5_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962
BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_left,
BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_right,
BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1
result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1
result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_cond,
result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1
result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_cond,
result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue,
result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse,
result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output);

-- t16_MUX_uxn_opcodes_h_l846_c7_3ea1
t16_MUX_uxn_opcodes_h_l846_c7_3ea1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l846_c7_3ea1_cond,
t16_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue,
t16_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse,
t16_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657
BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_left,
BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_right,
BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3
result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3
result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3
result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_cond,
result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3
result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output);

-- result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3
result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_cond,
result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue,
result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse,
result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3
result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3
result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3
result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output);

-- t16_MUX_uxn_opcodes_h_l849_c7_a8f3
t16_MUX_uxn_opcodes_h_l849_c7_a8f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l849_c7_a8f3_cond,
t16_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue,
t16_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse,
t16_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output);

-- CONST_SL_8_uxn_opcodes_h_l851_c3_582e
CONST_SL_8_uxn_opcodes_h_l851_c3_582e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l851_c3_582e_x,
CONST_SL_8_uxn_opcodes_h_l851_c3_582e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408
BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_left,
BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_right,
BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649
result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649
result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_cond,
result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649
result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_return_output);

-- result_pc_MUX_uxn_opcodes_h_l854_c7_1649
result_pc_MUX_uxn_opcodes_h_l854_c7_1649 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l854_c7_1649_cond,
result_pc_MUX_uxn_opcodes_h_l854_c7_1649_iftrue,
result_pc_MUX_uxn_opcodes_h_l854_c7_1649_iffalse,
result_pc_MUX_uxn_opcodes_h_l854_c7_1649_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_return_output);

-- t16_MUX_uxn_opcodes_h_l854_c7_1649
t16_MUX_uxn_opcodes_h_l854_c7_1649 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l854_c7_1649_cond,
t16_MUX_uxn_opcodes_h_l854_c7_1649_iftrue,
t16_MUX_uxn_opcodes_h_l854_c7_1649_iffalse,
t16_MUX_uxn_opcodes_h_l854_c7_1649_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e
BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_left,
BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_right,
BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1
result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1
result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1
result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_cond,
result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1
result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1
result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_cond,
result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue,
result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse,
result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1
result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output);

-- t16_MUX_uxn_opcodes_h_l857_c7_8ce1
t16_MUX_uxn_opcodes_h_l857_c7_8ce1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l857_c7_8ce1_cond,
t16_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue,
t16_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse,
t16_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3
BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3_left,
BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3_right,
BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l861_c32_111f
BIN_OP_AND_uxn_opcodes_h_l861_c32_111f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l861_c32_111f_left,
BIN_OP_AND_uxn_opcodes_h_l861_c32_111f_right,
BIN_OP_AND_uxn_opcodes_h_l861_c32_111f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l861_c32_4443
BIN_OP_GT_uxn_opcodes_h_l861_c32_4443 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l861_c32_4443_left,
BIN_OP_GT_uxn_opcodes_h_l861_c32_4443_right,
BIN_OP_GT_uxn_opcodes_h_l861_c32_4443_return_output);

-- MUX_uxn_opcodes_h_l861_c32_0e7d
MUX_uxn_opcodes_h_l861_c32_0e7d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l861_c32_0e7d_cond,
MUX_uxn_opcodes_h_l861_c32_0e7d_iftrue,
MUX_uxn_opcodes_h_l861_c32_0e7d_iffalse,
MUX_uxn_opcodes_h_l861_c32_0e7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612
BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_left,
BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_right,
BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d
result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d
result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_cond,
result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d
result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_return_output);

-- result_pc_MUX_uxn_opcodes_h_l863_c7_148d
result_pc_MUX_uxn_opcodes_h_l863_c7_148d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l863_c7_148d_cond,
result_pc_MUX_uxn_opcodes_h_l863_c7_148d_iftrue,
result_pc_MUX_uxn_opcodes_h_l863_c7_148d_iffalse,
result_pc_MUX_uxn_opcodes_h_l863_c7_148d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d
result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d
result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d
result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46
BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_left,
BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_right,
BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c
result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c
result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_cond,
result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c
result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l867_c7_220c
result_pc_MUX_uxn_opcodes_h_l867_c7_220c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l867_c7_220c_cond,
result_pc_MUX_uxn_opcodes_h_l867_c7_220c_iftrue,
result_pc_MUX_uxn_opcodes_h_l867_c7_220c_iffalse,
result_pc_MUX_uxn_opcodes_h_l867_c7_220c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d
BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_left,
BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_right,
BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c
result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l873_c7_f55c
result_pc_MUX_uxn_opcodes_h_l873_c7_f55c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_cond,
result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue,
result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse,
result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c
result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c
result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c
result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_cond,
result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l875_c34_caf2
CONST_SR_8_uxn_opcodes_h_l875_c34_caf2 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l875_c34_caf2_x,
CONST_SR_8_uxn_opcodes_h_l875_c34_caf2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505
BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_left,
BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_right,
BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829
result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_return_output,
 result_pc_MUX_uxn_opcodes_h_l840_c2_3251_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_return_output,
 t16_MUX_uxn_opcodes_h_l840_c2_3251_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output,
 result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output,
 t16_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output,
 result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output,
 t16_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output,
 CONST_SL_8_uxn_opcodes_h_l851_c3_582e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_return_output,
 result_pc_MUX_uxn_opcodes_h_l854_c7_1649_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_return_output,
 t16_MUX_uxn_opcodes_h_l854_c7_1649_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output,
 result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output,
 t16_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3_return_output,
 BIN_OP_AND_uxn_opcodes_h_l861_c32_111f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l861_c32_4443_return_output,
 MUX_uxn_opcodes_h_l861_c32_0e7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_return_output,
 result_pc_MUX_uxn_opcodes_h_l863_c7_148d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_return_output,
 result_pc_MUX_uxn_opcodes_h_l867_c7_220c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_return_output,
 result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_return_output,
 CONST_SR_8_uxn_opcodes_h_l875_c34_caf2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l843_c3_fd0e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l840_c2_3251_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l840_c2_3251_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l840_c2_3251_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l840_c2_3251_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l840_c2_3251_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l841_c3_66a5_uxn_opcodes_h_l841_c3_66a5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l847_c3_1f39 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l846_c7_3ea1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l852_c3_b94a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_1649_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l854_c7_1649_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l849_c7_a8f3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l851_c3_582e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l851_c3_582e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l855_c3_02ec : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l854_c7_1649_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l854_c7_1649_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l854_c7_1649_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l863_c7_148d_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l857_c7_8ce1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l861_c32_0e7d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l861_c32_0e7d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l861_c32_0e7d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l861_c32_111f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l861_c32_111f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l861_c32_111f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l861_c32_4443_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l861_c32_4443_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l861_c32_4443_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l861_c32_0e7d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l863_c7_148d_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l863_c7_148d_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l867_c7_220c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l863_c7_148d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l865_c3_86b5 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l870_c3_a823 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l867_c7_220c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l867_c7_220c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l867_c7_220c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l871_c24_5746_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l874_c3_69f3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l875_c34_caf2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l875_c34_caf2_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l875_c24_8183_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_l849_l879_l846_l840_l867_l863_l857_DUPLICATE_e1ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l863_l857_DUPLICATE_b91c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l854_l849_l846_l840_l867_l863_DUPLICATE_a219_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l867_l857_DUPLICATE_bd0b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l867_l863_l857_DUPLICATE_d526_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l849_l846_l840_l863_DUPLICATE_1cf7_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l863_l857_DUPLICATE_43b6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l854_l846_l857_l849_DUPLICATE_da9e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l867_l863_l857_DUPLICATE_2bc2_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l850_l858_DUPLICATE_1508_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l863_l857_l873_DUPLICATE_6e5e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4929_uxn_opcodes_h_l886_l836_DUPLICATE_2f40_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_right := to_unsigned(8, 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l861_c32_0e7d_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l843_c3_fd0e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l843_c3_fd0e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_right := to_unsigned(7, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l861_c32_4443_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l865_c3_86b5 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l865_c3_86b5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l861_c32_0e7d_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_right := to_unsigned(6, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l861_c32_111f_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l855_c3_02ec := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l855_c3_02ec;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l870_c3_a823 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l870_c3_a823;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l874_c3_69f3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l874_c3_69f3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l852_c3_b94a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l852_c3_b94a;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l847_c3_1f39 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l847_c3_1f39;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l861_c32_111f_left := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l875_c34_caf2_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3_left := t16;
     VAR_result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l840_c2_3251_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l854_c7_1649_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse := t16;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l871_c24_5746] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l871_c24_5746_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- BIN_OP_AND[uxn_opcodes_h_l861_c32_111f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l861_c32_111f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l861_c32_111f_left;
     BIN_OP_AND_uxn_opcodes_h_l861_c32_111f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l861_c32_111f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l861_c32_111f_return_output := BIN_OP_AND_uxn_opcodes_h_l861_c32_111f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l863_l857_l873_DUPLICATE_6e5e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l863_l857_l873_DUPLICATE_6e5e_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_l849_l879_l846_l840_l867_l863_l857_DUPLICATE_e1ff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_l849_l879_l846_l840_l867_l863_l857_DUPLICATE_e1ff_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l863_l857_DUPLICATE_b91c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l863_l857_DUPLICATE_b91c_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l873_c11_f64d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_left;
     BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_return_output := BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l867_l863_l857_DUPLICATE_d526 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l867_l863_l857_DUPLICATE_d526_return_output := result.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l867_l857_DUPLICATE_bd0b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l867_l857_DUPLICATE_bd0b_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l857_c11_424e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_left;
     BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_return_output := BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l840_c6_b845] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_left;
     BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_return_output := BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l863_l857_DUPLICATE_43b6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l863_l857_DUPLICATE_43b6_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l846_c11_2962] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_left;
     BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_return_output := BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l849_c11_5657] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_left;
     BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_return_output := BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l854_c11_c408] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_left;
     BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_return_output := BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l867_c11_4a46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_left;
     BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_return_output := BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l849_l846_l840_l863_DUPLICATE_1cf7 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l849_l846_l840_l863_DUPLICATE_1cf7_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l854_l846_l857_l849_DUPLICATE_da9e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l854_l846_l857_l849_DUPLICATE_da9e_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l863_c11_7612] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_left;
     BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_return_output := BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l854_l849_l846_l840_l867_l863_DUPLICATE_a219 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l854_l849_l846_l840_l867_l863_DUPLICATE_a219_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l867_l863_l857_DUPLICATE_2bc2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l867_l863_l857_DUPLICATE_2bc2_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l875_c34_caf2] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l875_c34_caf2_x <= VAR_CONST_SR_8_uxn_opcodes_h_l875_c34_caf2_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l875_c34_caf2_return_output := CONST_SR_8_uxn_opcodes_h_l875_c34_caf2_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l850_l858_DUPLICATE_1508 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l850_l858_DUPLICATE_1508_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l879_c11_0505] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_left;
     BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_return_output := BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l861_c32_4443_left := VAR_BIN_OP_AND_uxn_opcodes_h_l861_c32_111f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l840_c2_3251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l840_c2_3251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l840_c6_b845_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l846_c7_3ea1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l846_c11_2962_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l849_c7_a8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5657_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_1649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l854_c7_1649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_c408_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l857_c7_8ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l857_c11_424e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l863_c7_148d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l863_c11_7612_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l867_c7_220c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_4a46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l873_c11_f64d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_0505_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l850_l858_DUPLICATE_1508_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l851_c3_582e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l850_l858_DUPLICATE_1508_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l871_c24_5746_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l849_l846_l840_l863_DUPLICATE_1cf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l849_l846_l840_l863_DUPLICATE_1cf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l849_l846_l840_l863_DUPLICATE_1cf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l849_l846_l840_l863_DUPLICATE_1cf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l849_l846_l840_l863_DUPLICATE_1cf7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l840_c2_3251_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l867_l863_l857_DUPLICATE_d526_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l867_l863_l857_DUPLICATE_d526_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l867_l863_l857_DUPLICATE_d526_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_1649_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l867_l863_l857_DUPLICATE_d526_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l867_l863_l857_DUPLICATE_d526_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l863_c7_148d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l867_l863_l857_DUPLICATE_d526_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l867_c7_220c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l867_l863_l857_DUPLICATE_d526_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l867_l863_l857_DUPLICATE_d526_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l867_l863_l857_DUPLICATE_2bc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l867_l863_l857_DUPLICATE_2bc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l867_l863_l857_DUPLICATE_2bc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l867_l863_l857_DUPLICATE_2bc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l867_l863_l857_DUPLICATE_2bc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l867_l863_l857_DUPLICATE_2bc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l867_l863_l857_DUPLICATE_2bc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l867_l863_l857_DUPLICATE_2bc2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_l849_l879_l846_l840_l867_l863_l857_DUPLICATE_e1ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_l849_l879_l846_l840_l867_l863_l857_DUPLICATE_e1ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_l849_l879_l846_l840_l867_l863_l857_DUPLICATE_e1ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_l849_l879_l846_l840_l867_l863_l857_DUPLICATE_e1ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_l849_l879_l846_l840_l867_l863_l857_DUPLICATE_e1ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_l849_l879_l846_l840_l867_l863_l857_DUPLICATE_e1ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_l849_l879_l846_l840_l867_l863_l857_DUPLICATE_e1ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_l849_l879_l846_l840_l867_l863_l857_DUPLICATE_e1ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l854_l849_l846_l840_l867_l863_DUPLICATE_a219_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l854_l849_l846_l840_l867_l863_DUPLICATE_a219_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l854_l849_l846_l840_l867_l863_DUPLICATE_a219_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l854_l849_l846_l840_l867_l863_DUPLICATE_a219_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l854_l849_l846_l840_l867_l863_DUPLICATE_a219_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l854_l849_l846_l840_l867_l863_DUPLICATE_a219_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l867_l857_DUPLICATE_bd0b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l867_l857_DUPLICATE_bd0b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l867_l857_DUPLICATE_bd0b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l867_l857_DUPLICATE_bd0b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l867_l857_DUPLICATE_bd0b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l867_l857_DUPLICATE_bd0b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l867_l857_DUPLICATE_bd0b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l867_l857_DUPLICATE_bd0b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l854_l846_l857_l849_DUPLICATE_da9e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l854_l846_l857_l849_DUPLICATE_da9e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l854_l846_l857_l849_DUPLICATE_da9e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l854_l846_l857_l849_DUPLICATE_da9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l863_l857_DUPLICATE_43b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l863_l857_DUPLICATE_43b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l863_l857_DUPLICATE_43b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l863_l857_DUPLICATE_43b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l863_l857_DUPLICATE_43b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l863_l857_DUPLICATE_43b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l863_l857_DUPLICATE_43b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l849_l879_l846_l873_l840_l863_l857_DUPLICATE_43b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l863_l857_l873_DUPLICATE_6e5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l863_l857_l873_DUPLICATE_6e5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l863_l857_l873_DUPLICATE_6e5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l863_l857_DUPLICATE_b91c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l863_l857_DUPLICATE_b91c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l863_l857_DUPLICATE_b91c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l863_l857_DUPLICATE_b91c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l863_l857_DUPLICATE_b91c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l863_l857_DUPLICATE_b91c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l854_l849_l846_l873_l840_l863_l857_DUPLICATE_b91c_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l861_c32_4443] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l861_c32_4443_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l861_c32_4443_left;
     BIN_OP_GT_uxn_opcodes_h_l861_c32_4443_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l861_c32_4443_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l861_c32_4443_return_output := BIN_OP_GT_uxn_opcodes_h_l861_c32_4443_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l879_c7_0829] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l879_c7_0829] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l873_c7_f55c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_cond;
     result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_return_output := result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l879_c7_0829] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l851_c3_582e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l851_c3_582e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l851_c3_582e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l851_c3_582e_return_output := CONST_SL_8_uxn_opcodes_h_l851_c3_582e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l867_c7_220c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l840_c1_5731] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l858_c3_93a3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3_left;
     BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3_return_output := BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l875_c24_8183] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l875_c24_8183_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l875_c34_caf2_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l863_c7_148d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l879_c7_0829] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l873_c7_f55c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l857_c7_8ce1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l861_c32_0e7d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l861_c32_4443_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l858_c3_93a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l875_c24_8183_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l851_c3_582e_return_output;
     VAR_printf_uxn_opcodes_h_l841_c3_66a5_uxn_opcodes_h_l841_c3_66a5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l840_c1_5731_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_0829_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l879_c7_0829_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l867_c7_220c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l879_c7_0829_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_0829_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l867_c7_220c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l873_c7_f55c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l863_c7_148d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l873_c7_f55c_return_output;
     -- printf_uxn_opcodes_h_l841_c3_66a5[uxn_opcodes_h_l841_c3_66a5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l841_c3_66a5_uxn_opcodes_h_l841_c3_66a5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l841_c3_66a5_uxn_opcodes_h_l841_c3_66a5_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l873_c7_f55c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l873_c7_f55c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l867_c7_220c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l854_c7_1649] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_return_output;

     -- MUX[uxn_opcodes_h_l861_c32_0e7d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l861_c32_0e7d_cond <= VAR_MUX_uxn_opcodes_h_l861_c32_0e7d_cond;
     MUX_uxn_opcodes_h_l861_c32_0e7d_iftrue <= VAR_MUX_uxn_opcodes_h_l861_c32_0e7d_iftrue;
     MUX_uxn_opcodes_h_l861_c32_0e7d_iffalse <= VAR_MUX_uxn_opcodes_h_l861_c32_0e7d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l861_c32_0e7d_return_output := MUX_uxn_opcodes_h_l861_c32_0e7d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l863_c7_148d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_return_output;

     -- t16_MUX[uxn_opcodes_h_l857_c7_8ce1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l857_c7_8ce1_cond <= VAR_t16_MUX_uxn_opcodes_h_l857_c7_8ce1_cond;
     t16_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue;
     t16_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output := t16_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l867_c7_220c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l867_c7_220c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l867_c7_220c_cond;
     result_pc_MUX_uxn_opcodes_h_l867_c7_220c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l867_c7_220c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l867_c7_220c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l867_c7_220c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l867_c7_220c_return_output := result_pc_MUX_uxn_opcodes_h_l867_c7_220c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l873_c7_f55c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_return_output := result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l873_c7_f55c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l873_c7_f55c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue := VAR_MUX_uxn_opcodes_h_l861_c32_0e7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l873_c7_f55c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l873_c7_f55c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l863_c7_148d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l873_c7_f55c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_1649_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l873_c7_f55c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l863_c7_148d_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l867_c7_220c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_220c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l873_c7_f55c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l854_c7_1649_iffalse := VAR_t16_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l857_c7_8ce1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l863_c7_148d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l867_c7_220c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l867_c7_220c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l863_c7_148d] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l863_c7_148d_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l863_c7_148d_cond;
     result_pc_MUX_uxn_opcodes_h_l863_c7_148d_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l863_c7_148d_iftrue;
     result_pc_MUX_uxn_opcodes_h_l863_c7_148d_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l863_c7_148d_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l863_c7_148d_return_output := result_pc_MUX_uxn_opcodes_h_l863_c7_148d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l867_c7_220c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l857_c7_8ce1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l867_c7_220c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_return_output;

     -- t16_MUX[uxn_opcodes_h_l854_c7_1649] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l854_c7_1649_cond <= VAR_t16_MUX_uxn_opcodes_h_l854_c7_1649_cond;
     t16_MUX_uxn_opcodes_h_l854_c7_1649_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l854_c7_1649_iftrue;
     t16_MUX_uxn_opcodes_h_l854_c7_1649_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l854_c7_1649_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l854_c7_1649_return_output := t16_MUX_uxn_opcodes_h_l854_c7_1649_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l867_c7_220c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_return_output := result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l849_c7_a8f3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_220c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l867_c7_220c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l867_c7_220c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_220c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l863_c7_148d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l863_c7_148d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l867_c7_220c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l854_c7_1649_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l857_c7_8ce1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_cond;
     result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output := result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l854_c7_1649] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l863_c7_148d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l857_c7_8ce1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l863_c7_148d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_return_output;

     -- t16_MUX[uxn_opcodes_h_l849_c7_a8f3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l849_c7_a8f3_cond <= VAR_t16_MUX_uxn_opcodes_h_l849_c7_a8f3_cond;
     t16_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue;
     t16_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output := t16_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l854_c7_1649] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l863_c7_148d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l863_c7_148d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l863_c7_148d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_return_output := result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l846_c7_3ea1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l863_c7_148d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l863_c7_148d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_1649_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l863_c7_148d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l863_c7_148d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_1649_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_1649_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l863_c7_148d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l840_c2_3251] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l857_c7_8ce1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output := result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l849_c7_a8f3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l849_c7_a8f3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l854_c7_1649] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l854_c7_1649_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_1649_cond;
     result_pc_MUX_uxn_opcodes_h_l854_c7_1649_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_1649_iftrue;
     result_pc_MUX_uxn_opcodes_h_l854_c7_1649_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_1649_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_1649_return_output := result_pc_MUX_uxn_opcodes_h_l854_c7_1649_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l857_c7_8ce1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l857_c7_8ce1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l857_c7_8ce1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;

     -- t16_MUX[uxn_opcodes_h_l846_c7_3ea1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l846_c7_3ea1_cond <= VAR_t16_MUX_uxn_opcodes_h_l846_c7_3ea1_cond;
     t16_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue;
     t16_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output := t16_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c7_1649] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l857_c7_8ce1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l854_c7_1649_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_1649_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l857_c7_8ce1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l840_c2_3251_iffalse := VAR_t16_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l846_c7_3ea1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l854_c7_1649] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l854_c7_1649] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_cond;
     result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_return_output := result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l854_c7_1649] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l854_c7_1649] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_return_output;

     -- t16_MUX[uxn_opcodes_h_l840_c2_3251] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l840_c2_3251_cond <= VAR_t16_MUX_uxn_opcodes_h_l840_c2_3251_cond;
     t16_MUX_uxn_opcodes_h_l840_c2_3251_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l840_c2_3251_iftrue;
     t16_MUX_uxn_opcodes_h_l840_c2_3251_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l840_c2_3251_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l840_c2_3251_return_output := t16_MUX_uxn_opcodes_h_l840_c2_3251_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l846_c7_3ea1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l854_c7_1649] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l849_c7_a8f3] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_cond;
     result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue;
     result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output := result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l849_c7_a8f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_1649_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c7_1649_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c7_1649_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_1649_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_1649_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l840_c2_3251_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l849_c7_a8f3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output := result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l846_c7_3ea1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_cond;
     result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output := result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l849_c7_a8f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l846_c7_3ea1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l840_c2_3251] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l840_c2_3251] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l849_c7_a8f3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l849_c7_a8f3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l849_c7_a8f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l840_c2_3251_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l849_c7_a8f3_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l840_c2_3251] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l846_c7_3ea1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l846_c7_3ea1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output := result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l846_c7_3ea1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l840_c2_3251] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l840_c2_3251_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l840_c2_3251_cond;
     result_pc_MUX_uxn_opcodes_h_l840_c2_3251_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l840_c2_3251_iftrue;
     result_pc_MUX_uxn_opcodes_h_l840_c2_3251_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l840_c2_3251_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l840_c2_3251_return_output := result_pc_MUX_uxn_opcodes_h_l840_c2_3251_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l846_c7_3ea1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l846_c7_3ea1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l846_c7_3ea1_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l840_c2_3251] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_cond;
     result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_return_output := result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l840_c2_3251] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l840_c2_3251] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l840_c2_3251] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l840_c2_3251] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4929_uxn_opcodes_h_l886_l836_DUPLICATE_2f40 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4929_uxn_opcodes_h_l886_l836_DUPLICATE_2f40_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4929(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l840_c2_3251_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l840_c2_3251_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l840_c2_3251_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l840_c2_3251_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l840_c2_3251_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l840_c2_3251_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l840_c2_3251_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l840_c2_3251_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l840_c2_3251_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l840_c2_3251_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4929_uxn_opcodes_h_l886_l836_DUPLICATE_2f40_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4929_uxn_opcodes_h_l886_l836_DUPLICATE_2f40_return_output;
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
