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
-- Submodules: 79
entity jsr_0CLK_f1c92b33 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr_0CLK_f1c92b33;
architecture arch of jsr_0CLK_f1c92b33 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l807_c6_9524]
signal BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l807_c1_25c3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l807_c2_b9f1]
signal t8_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l807_c2_b9f1]
signal result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l807_c2_b9f1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l807_c2_b9f1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l807_c2_b9f1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l807_c2_b9f1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l807_c2_b9f1]
signal result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l807_c2_b9f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l807_c2_b9f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l807_c2_b9f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l807_c2_b9f1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l808_c3_a7a1[uxn_opcodes_h_l808_c3_a7a1]
signal printf_uxn_opcodes_h_l808_c3_a7a1_uxn_opcodes_h_l808_c3_a7a1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l813_c11_674f]
signal BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l813_c7_6bc2]
signal t8_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l813_c7_6bc2]
signal result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l813_c7_6bc2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l813_c7_6bc2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l813_c7_6bc2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l813_c7_6bc2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l813_c7_6bc2]
signal result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l813_c7_6bc2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l813_c7_6bc2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l813_c7_6bc2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l813_c7_6bc2]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l816_c11_5499]
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l816_c7_09ac]
signal t8_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l816_c7_09ac]
signal result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l816_c7_09ac]
signal result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l816_c7_09ac]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l816_c7_09ac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l816_c7_09ac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l816_c7_09ac]
signal result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l816_c7_09ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l816_c7_09ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l816_c7_09ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l816_c7_09ac]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l820_c32_bacf]
signal BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l820_c32_86de]
signal BIN_OP_GT_uxn_opcodes_h_l820_c32_86de_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l820_c32_86de_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l820_c32_86de_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l820_c32_eb91]
signal MUX_uxn_opcodes_h_l820_c32_eb91_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l820_c32_eb91_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l820_c32_eb91_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l820_c32_eb91_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l822_c11_1122]
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l822_c7_f567]
signal result_pc_MUX_uxn_opcodes_h_l822_c7_f567_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l822_c7_f567_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l822_c7_f567_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l822_c7_f567_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l822_c7_f567]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l822_c7_f567]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l822_c7_f567]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l822_c7_f567]
signal result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l822_c7_f567]
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l822_c7_f567]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l822_c7_f567]
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l822_c7_f567]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l826_c11_82e5]
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l826_c7_120a]
signal result_pc_MUX_uxn_opcodes_h_l826_c7_120a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l826_c7_120a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l826_c7_120a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l826_c7_120a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l826_c7_120a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l826_c7_120a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l826_c7_120a]
signal result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l826_c7_120a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l826_c7_120a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l826_c7_120a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l826_c7_120a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l832_c11_b99b]
signal BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l832_c7_8bcc]
signal result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l832_c7_8bcc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l832_c7_8bcc]
signal result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l832_c7_8bcc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l832_c7_8bcc]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l832_c7_8bcc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l832_c7_8bcc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l834_c34_5bfb]
signal CONST_SR_8_uxn_opcodes_h_l834_c34_5bfb_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l834_c34_5bfb_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l836_c15_9ffc]
signal BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l838_c11_5027]
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_e350]
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_e350]
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l838_c7_e350]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l838_c7_e350]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_fe28( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.pc := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_value := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_stack_write := ref_toks_9;
      base.is_stack_index_flipped := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524
BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_left,
BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_right,
BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_return_output);

-- t8_MUX_uxn_opcodes_h_l807_c2_b9f1
t8_MUX_uxn_opcodes_h_l807_c2_b9f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l807_c2_b9f1_cond,
t8_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue,
t8_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse,
t8_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1
result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_cond,
result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue,
result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse,
result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1
result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1
result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1
result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1
result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1
result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_cond,
result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1
result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1
result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output);

-- printf_uxn_opcodes_h_l808_c3_a7a1_uxn_opcodes_h_l808_c3_a7a1
printf_uxn_opcodes_h_l808_c3_a7a1_uxn_opcodes_h_l808_c3_a7a1 : entity work.printf_uxn_opcodes_h_l808_c3_a7a1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l808_c3_a7a1_uxn_opcodes_h_l808_c3_a7a1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f
BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_left,
BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_right,
BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_return_output);

-- t8_MUX_uxn_opcodes_h_l813_c7_6bc2
t8_MUX_uxn_opcodes_h_l813_c7_6bc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l813_c7_6bc2_cond,
t8_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue,
t8_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse,
t8_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output);

-- result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2
result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_cond,
result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue,
result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse,
result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2
result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2
result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2
result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2
result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2
result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_cond,
result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2
result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2
result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499
BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_left,
BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_right,
BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_return_output);

-- t8_MUX_uxn_opcodes_h_l816_c7_09ac
t8_MUX_uxn_opcodes_h_l816_c7_09ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l816_c7_09ac_cond,
t8_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue,
t8_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse,
t8_MUX_uxn_opcodes_h_l816_c7_09ac_return_output);

-- result_pc_MUX_uxn_opcodes_h_l816_c7_09ac
result_pc_MUX_uxn_opcodes_h_l816_c7_09ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_cond,
result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue,
result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse,
result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac
result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac
result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac
result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac
result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_cond,
result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf
BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf_left,
BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf_right,
BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l820_c32_86de
BIN_OP_GT_uxn_opcodes_h_l820_c32_86de : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l820_c32_86de_left,
BIN_OP_GT_uxn_opcodes_h_l820_c32_86de_right,
BIN_OP_GT_uxn_opcodes_h_l820_c32_86de_return_output);

-- MUX_uxn_opcodes_h_l820_c32_eb91
MUX_uxn_opcodes_h_l820_c32_eb91 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l820_c32_eb91_cond,
MUX_uxn_opcodes_h_l820_c32_eb91_iftrue,
MUX_uxn_opcodes_h_l820_c32_eb91_iffalse,
MUX_uxn_opcodes_h_l820_c32_eb91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122
BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_left,
BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_right,
BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_return_output);

-- result_pc_MUX_uxn_opcodes_h_l822_c7_f567
result_pc_MUX_uxn_opcodes_h_l822_c7_f567 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l822_c7_f567_cond,
result_pc_MUX_uxn_opcodes_h_l822_c7_f567_iftrue,
result_pc_MUX_uxn_opcodes_h_l822_c7_f567_iffalse,
result_pc_MUX_uxn_opcodes_h_l822_c7_f567_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567
result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567
result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567
result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567
result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_cond,
result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5
BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_left,
BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_right,
BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_return_output);

-- result_pc_MUX_uxn_opcodes_h_l826_c7_120a
result_pc_MUX_uxn_opcodes_h_l826_c7_120a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l826_c7_120a_cond,
result_pc_MUX_uxn_opcodes_h_l826_c7_120a_iftrue,
result_pc_MUX_uxn_opcodes_h_l826_c7_120a_iffalse,
result_pc_MUX_uxn_opcodes_h_l826_c7_120a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a
result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_cond,
result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b
BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_left,
BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_right,
BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc
result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_cond,
result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue,
result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse,
result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc
result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc
result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_cond,
result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc
result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc
result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output);

-- CONST_SR_8_uxn_opcodes_h_l834_c34_5bfb
CONST_SR_8_uxn_opcodes_h_l834_c34_5bfb : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l834_c34_5bfb_x,
CONST_SR_8_uxn_opcodes_h_l834_c34_5bfb_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc
BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc_left,
BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc_right,
BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027
BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_left,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_right,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350
result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_return_output,
 t8_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output,
 result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_return_output,
 t8_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output,
 result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_return_output,
 t8_MUX_uxn_opcodes_h_l816_c7_09ac_return_output,
 result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_return_output,
 BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf_return_output,
 BIN_OP_GT_uxn_opcodes_h_l820_c32_86de_return_output,
 MUX_uxn_opcodes_h_l820_c32_eb91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_return_output,
 result_pc_MUX_uxn_opcodes_h_l822_c7_f567_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_return_output,
 result_pc_MUX_uxn_opcodes_h_l826_c7_120a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_return_output,
 result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output,
 CONST_SR_8_uxn_opcodes_h_l834_c34_5bfb_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l810_c3_fe95 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l808_c3_a7a1_uxn_opcodes_h_l808_c3_a7a1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l814_c3_4fcd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_f567_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l820_c32_eb91_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l820_c32_eb91_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l820_c32_eb91_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l820_c32_86de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l820_c32_86de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l820_c32_86de_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l820_c32_eb91_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_return_output : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_f567_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_f567_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_120a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_f567_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l824_c3_10c7 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_return_output : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_120a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_120a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_120a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l829_c3_ed39 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l830_c24_987b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_return_output : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l836_c3_7f2e : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l833_c3_737a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l834_c34_5bfb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l834_c34_5bfb_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l834_c24_f23f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l836_c20_191d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l816_l813_l807_l832_l826_l822_DUPLICATE_0a35_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l816_l813_l807_l838_l826_l822_DUPLICATE_3483_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l807_l822_l813_DUPLICATE_c858_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l807_l822_l813_l826_DUPLICATE_a871_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l816_l813_l807_l832_l822_DUPLICATE_a2ae_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l816_l813_l807_l838_l832_l822_DUPLICATE_5331_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l816_l813_l807_l838_l832_l826_DUPLICATE_86a4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l816_l813_DUPLICATE_25e9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l816_l813_l838_l832_l826_l822_DUPLICATE_a66b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l816_l832_l822_DUPLICATE_efd9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fe28_uxn_opcodes_h_l845_l803_DUPLICATE_d3a2_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_right := to_unsigned(6, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf_right := to_unsigned(128, 8);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l824_c3_10c7 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l824_c3_10c7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l820_c32_86de_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l810_c3_fe95 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l810_c3_fe95;
     VAR_MUX_uxn_opcodes_h_l820_c32_eb91_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l833_c3_737a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l833_c3_737a;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l829_c3_ed39 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l829_c3_ed39;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l814_c3_4fcd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l814_c3_4fcd;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l820_c32_eb91_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_CONST_SR_8_uxn_opcodes_h_l834_c34_5bfb_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l807_l822_l813_l826_DUPLICATE_a871 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l807_l822_l813_l826_DUPLICATE_a871_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l807_l822_l813_DUPLICATE_c858 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l807_l822_l813_DUPLICATE_c858_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l816_l813_l807_l838_l832_l826_DUPLICATE_86a4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l816_l813_l807_l838_l832_l826_DUPLICATE_86a4_return_output := result.is_stack_index_flipped;

     -- CAST_TO_int8_t[uxn_opcodes_h_l836_c20_191d] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l836_c20_191d_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l816_c11_5499] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_left;
     BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_return_output := BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l816_l813_l807_l832_l826_l822_DUPLICATE_0a35 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l816_l813_l807_l832_l826_l822_DUPLICATE_0a35_return_output := result.pc;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l816_l832_l822_DUPLICATE_efd9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l816_l832_l822_DUPLICATE_efd9_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l820_c32_bacf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf_left;
     BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf_return_output := BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l838_c11_5027] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_left;
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_return_output := BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l813_c11_674f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_left;
     BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_return_output := BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l826_c11_82e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l816_l813_DUPLICATE_25e9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l816_l813_DUPLICATE_25e9_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l816_l813_l838_l832_l826_l822_DUPLICATE_a66b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l816_l813_l838_l832_l826_l822_DUPLICATE_a66b_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l816_l813_l807_l832_l822_DUPLICATE_a2ae LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l816_l813_l807_l832_l822_DUPLICATE_a2ae_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l832_c11_b99b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_left;
     BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_return_output := BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l834_c34_5bfb] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l834_c34_5bfb_x <= VAR_CONST_SR_8_uxn_opcodes_h_l834_c34_5bfb_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l834_c34_5bfb_return_output := CONST_SR_8_uxn_opcodes_h_l834_c34_5bfb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l822_c11_1122] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_left;
     BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_return_output := BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l830_c24_987b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l830_c24_987b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- BIN_OP_EQ[uxn_opcodes_h_l807_c6_9524] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_left;
     BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_return_output := BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l816_l813_l807_l838_l832_l822_DUPLICATE_5331 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l816_l813_l807_l838_l832_l822_DUPLICATE_5331_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l816_l813_l807_l838_l826_l822_DUPLICATE_3483 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l816_l813_l807_l838_l826_l822_DUPLICATE_3483_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l820_c32_86de_left := VAR_BIN_OP_AND_uxn_opcodes_h_l820_c32_bacf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l807_c2_b9f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l807_c6_9524_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l813_c7_6bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l813_c11_674f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l816_c7_09ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l816_c11_5499_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_f567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_1122_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_120a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_82e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b99b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_5027_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l836_c20_191d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l830_c24_987b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l807_l822_l813_DUPLICATE_c858_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l807_l822_l813_DUPLICATE_c858_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l807_l822_l813_DUPLICATE_c858_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l816_l813_l807_l832_l826_l822_DUPLICATE_0a35_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l816_l813_l807_l832_l826_l822_DUPLICATE_0a35_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l816_l813_l807_l832_l826_l822_DUPLICATE_0a35_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_f567_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l816_l813_l807_l832_l826_l822_DUPLICATE_0a35_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_120a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l816_l813_l807_l832_l826_l822_DUPLICATE_0a35_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l816_l813_l807_l832_l826_l822_DUPLICATE_0a35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l816_l813_l838_l832_l826_l822_DUPLICATE_a66b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l816_l813_l838_l832_l826_l822_DUPLICATE_a66b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l816_l813_l838_l832_l826_l822_DUPLICATE_a66b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l816_l813_l838_l832_l826_l822_DUPLICATE_a66b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l816_l813_l838_l832_l826_l822_DUPLICATE_a66b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l816_l813_l838_l832_l826_l822_DUPLICATE_a66b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l816_l813_l807_l838_l826_l822_DUPLICATE_3483_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l816_l813_l807_l838_l826_l822_DUPLICATE_3483_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l816_l813_l807_l838_l826_l822_DUPLICATE_3483_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l816_l813_l807_l838_l826_l822_DUPLICATE_3483_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l816_l813_l807_l838_l826_l822_DUPLICATE_3483_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l816_l813_l807_l838_l826_l822_DUPLICATE_3483_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l807_l822_l813_l826_DUPLICATE_a871_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l807_l822_l813_l826_DUPLICATE_a871_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l807_l822_l813_l826_DUPLICATE_a871_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l807_l822_l813_l826_DUPLICATE_a871_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l816_l813_l807_l838_l832_l826_DUPLICATE_86a4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l816_l813_l807_l838_l832_l826_DUPLICATE_86a4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l816_l813_l807_l838_l832_l826_DUPLICATE_86a4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l816_l813_l807_l838_l832_l826_DUPLICATE_86a4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l816_l813_l807_l838_l832_l826_DUPLICATE_86a4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l816_l813_l807_l838_l832_l826_DUPLICATE_86a4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l816_l813_DUPLICATE_25e9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l816_l813_DUPLICATE_25e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l816_l813_l807_l838_l832_l822_DUPLICATE_5331_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l816_l813_l807_l838_l832_l822_DUPLICATE_5331_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l816_l813_l807_l838_l832_l822_DUPLICATE_5331_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l816_l813_l807_l838_l832_l822_DUPLICATE_5331_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l816_l813_l807_l838_l832_l822_DUPLICATE_5331_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l816_l813_l807_l838_l832_l822_DUPLICATE_5331_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l816_l832_l822_DUPLICATE_efd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l816_l832_l822_DUPLICATE_efd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l816_l832_l822_DUPLICATE_efd9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l816_l813_l807_l832_l822_DUPLICATE_a2ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l816_l813_l807_l832_l822_DUPLICATE_a2ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l816_l813_l807_l832_l822_DUPLICATE_a2ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l816_l813_l807_l832_l822_DUPLICATE_a2ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l816_l813_l807_l832_l822_DUPLICATE_a2ae_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l834_c24_f23f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l834_c24_f23f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l834_c34_5bfb_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_e350] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_e350] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l838_c7_e350] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l836_c15_9ffc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc_left;
     BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc_return_output := BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l807_c1_25c3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l838_c7_e350] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l820_c32_86de] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l820_c32_86de_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l820_c32_86de_left;
     BIN_OP_GT_uxn_opcodes_h_l820_c32_86de_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l820_c32_86de_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l820_c32_86de_return_output := BIN_OP_GT_uxn_opcodes_h_l820_c32_86de_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l826_c7_120a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l822_c7_f567] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l832_c7_8bcc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output;

     -- t8_MUX[uxn_opcodes_h_l816_c7_09ac] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l816_c7_09ac_cond <= VAR_t8_MUX_uxn_opcodes_h_l816_c7_09ac_cond;
     t8_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue;
     t8_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l816_c7_09ac_return_output := t8_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l816_c7_09ac] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l820_c32_eb91_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l820_c32_86de_return_output;
     VAR_result_pc_uxn_opcodes_h_l836_c3_7f2e := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l836_c15_9ffc_return_output)),16);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l834_c24_f23f_return_output;
     VAR_printf_uxn_opcodes_h_l808_c3_a7a1_uxn_opcodes_h_l808_c3_a7a1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l807_c1_25c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_e350_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l838_c7_e350_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l826_c7_120a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l838_c7_e350_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_e350_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_f567_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue := VAR_result_pc_uxn_opcodes_h_l836_c3_7f2e;
     -- result_stack_value_MUX[uxn_opcodes_h_l832_c7_8bcc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output := result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l832_c7_8bcc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output;

     -- t8_MUX[uxn_opcodes_h_l813_c7_6bc2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l813_c7_6bc2_cond <= VAR_t8_MUX_uxn_opcodes_h_l813_c7_6bc2_cond;
     t8_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue;
     t8_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output := t8_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l832_c7_8bcc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output;

     -- printf_uxn_opcodes_h_l808_c3_a7a1[uxn_opcodes_h_l808_c3_a7a1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l808_c3_a7a1_uxn_opcodes_h_l808_c3_a7a1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l808_c3_a7a1_uxn_opcodes_h_l808_c3_a7a1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l813_c7_6bc2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l832_c7_8bcc] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l822_c7_f567] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l826_c7_120a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l832_c7_8bcc] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_cond;
     result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue;
     result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output := result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output;

     -- MUX[uxn_opcodes_h_l820_c32_eb91] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l820_c32_eb91_cond <= VAR_MUX_uxn_opcodes_h_l820_c32_eb91_cond;
     MUX_uxn_opcodes_h_l820_c32_eb91_iftrue <= VAR_MUX_uxn_opcodes_h_l820_c32_eb91_iftrue;
     MUX_uxn_opcodes_h_l820_c32_eb91_iffalse <= VAR_MUX_uxn_opcodes_h_l820_c32_eb91_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l820_c32_eb91_return_output := MUX_uxn_opcodes_h_l820_c32_eb91_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l832_c7_8bcc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue := VAR_MUX_uxn_opcodes_h_l820_c32_eb91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_f567_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_120a_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l826_c7_120a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l832_c7_8bcc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l826_c7_120a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l826_c7_120a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_120a_cond;
     result_pc_MUX_uxn_opcodes_h_l826_c7_120a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_120a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l826_c7_120a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_120a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_120a_return_output := result_pc_MUX_uxn_opcodes_h_l826_c7_120a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l822_c7_f567] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_return_output;

     -- t8_MUX[uxn_opcodes_h_l807_c2_b9f1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l807_c2_b9f1_cond <= VAR_t8_MUX_uxn_opcodes_h_l807_c2_b9f1_cond;
     t8_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue;
     t8_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output := t8_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l807_c2_b9f1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l826_c7_120a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l826_c7_120a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l816_c7_09ac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l816_c7_09ac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l826_c7_120a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l826_c7_120a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l826_c7_120a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_return_output := result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_120a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_120a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_120a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_120a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_f567_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l826_c7_120a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_f567_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l826_c7_120a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l822_c7_f567] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l822_c7_f567] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l822_c7_f567] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l813_c7_6bc2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l822_c7_f567] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_cond;
     result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_return_output := result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l816_c7_09ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l822_c7_f567] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l822_c7_f567] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l822_c7_f567_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_f567_cond;
     result_pc_MUX_uxn_opcodes_h_l822_c7_f567_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_f567_iftrue;
     result_pc_MUX_uxn_opcodes_h_l822_c7_f567_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_f567_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_f567_return_output := result_pc_MUX_uxn_opcodes_h_l822_c7_f567_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l813_c7_6bc2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_f567_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_f567_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_f567_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_f567_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_f567_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_f567_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l807_c2_b9f1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l816_c7_09ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l816_c7_09ac] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_cond;
     result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue;
     result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_return_output := result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l816_c7_09ac] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l816_c7_09ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l807_c2_b9f1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l816_c7_09ac] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l816_c7_09ac] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_cond;
     result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_return_output := result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l813_c7_6bc2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l816_c7_09ac_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l813_c7_6bc2] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l807_c2_b9f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l813_c7_6bc2] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_cond;
     result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue;
     result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output := result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l813_c7_6bc2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output := result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l813_c7_6bc2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l813_c7_6bc2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l813_c7_6bc2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l813_c7_6bc2_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l807_c2_b9f1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output := result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l807_c2_b9f1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_cond;
     result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output := result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l807_c2_b9f1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l807_c2_b9f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l807_c2_b9f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l807_c2_b9f1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fe28_uxn_opcodes_h_l845_l803_DUPLICATE_d3a2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fe28_uxn_opcodes_h_l845_l803_DUPLICATE_d3a2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fe28(
     result,
     VAR_result_pc_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l807_c2_b9f1_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fe28_uxn_opcodes_h_l845_l803_DUPLICATE_d3a2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fe28_uxn_opcodes_h_l845_l803_DUPLICATE_d3a2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
