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
-- Submodules: 76
entity jsr_0CLK_6c9b19c4 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr_0CLK_6c9b19c4;
architecture arch of jsr_0CLK_6c9b19c4 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l771_c6_d884]
signal BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l771_c1_c22f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l771_c2_4f45]
signal t8_MUX_uxn_opcodes_h_l771_c2_4f45_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l771_c2_4f45_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l771_c2_4f45]
signal result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l771_c2_4f45]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l771_c2_4f45]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l771_c2_4f45]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l771_c2_4f45]
signal result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l771_c2_4f45]
signal result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l771_c2_4f45]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_return_output : signed(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l771_c2_4f45]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l771_c2_4f45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l772_c3_31ff[uxn_opcodes_h_l772_c3_31ff]
signal printf_uxn_opcodes_h_l772_c3_31ff_uxn_opcodes_h_l772_c3_31ff_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l776_c11_e342]
signal BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l776_c7_fd5f]
signal t8_MUX_uxn_opcodes_h_l776_c7_fd5f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l776_c7_fd5f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l776_c7_fd5f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l776_c7_fd5f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l776_c7_fd5f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l776_c7_fd5f]
signal result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l776_c7_fd5f]
signal result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l776_c7_fd5f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output : signed(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l776_c7_fd5f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l776_c7_fd5f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l779_c11_ce1c]
signal BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l779_c7_197a]
signal t8_MUX_uxn_opcodes_h_l779_c7_197a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l779_c7_197a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l779_c7_197a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l779_c7_197a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l779_c7_197a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l779_c7_197a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l779_c7_197a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l779_c7_197a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l779_c7_197a]
signal result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l779_c7_197a]
signal result_pc_MUX_uxn_opcodes_h_l779_c7_197a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l779_c7_197a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l779_c7_197a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l779_c7_197a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l779_c7_197a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_return_output : signed(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l779_c7_197a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l779_c7_197a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l782_c32_221a]
signal BIN_OP_AND_uxn_opcodes_h_l782_c32_221a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l782_c32_221a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l782_c32_221a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l782_c32_9160]
signal BIN_OP_GT_uxn_opcodes_h_l782_c32_9160_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l782_c32_9160_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l782_c32_9160_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l782_c32_0414]
signal MUX_uxn_opcodes_h_l782_c32_0414_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l782_c32_0414_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l782_c32_0414_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l782_c32_0414_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l784_c11_874b]
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l784_c7_3b57]
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l784_c7_3b57]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l784_c7_3b57]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l784_c7_3b57]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l784_c7_3b57]
signal result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l784_c7_3b57]
signal result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l784_c7_3b57]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_return_output : signed(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l784_c7_3b57]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l784_c7_3b57]
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l788_c11_48e2]
signal BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l788_c7_fa0b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l788_c7_fa0b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l788_c7_fa0b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l788_c7_fa0b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l788_c7_fa0b]
signal result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l788_c7_fa0b]
signal result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l788_c7_fa0b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l788_c7_fa0b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l794_c11_ccca]
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l794_c7_9cd2]
signal result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_9cd2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l794_c7_9cd2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l794_c7_9cd2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l794_c7_9cd2]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l794_c7_9cd2]
signal result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_9cd2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l796_c34_5b32]
signal CONST_SR_8_uxn_opcodes_h_l796_c34_5b32_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l796_c34_5b32_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l798_c15_e598]
signal BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l800_c11_052a]
signal BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l800_c7_654a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l800_c7_654a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l800_c7_654a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l800_c7_654a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_7246( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.pc := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884
BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_left,
BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_right,
BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_return_output);

-- t8_MUX_uxn_opcodes_h_l771_c2_4f45
t8_MUX_uxn_opcodes_h_l771_c2_4f45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l771_c2_4f45_cond,
t8_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue,
t8_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse,
t8_MUX_uxn_opcodes_h_l771_c2_4f45_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45
result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45
result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45
result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45
result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_cond,
result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_return_output);

-- result_pc_MUX_uxn_opcodes_h_l771_c2_4f45
result_pc_MUX_uxn_opcodes_h_l771_c2_4f45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_cond,
result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue,
result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse,
result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45
result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45
result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_return_output);

-- printf_uxn_opcodes_h_l772_c3_31ff_uxn_opcodes_h_l772_c3_31ff
printf_uxn_opcodes_h_l772_c3_31ff_uxn_opcodes_h_l772_c3_31ff : entity work.printf_uxn_opcodes_h_l772_c3_31ff_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l772_c3_31ff_uxn_opcodes_h_l772_c3_31ff_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342
BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_left,
BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_right,
BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_return_output);

-- t8_MUX_uxn_opcodes_h_l776_c7_fd5f
t8_MUX_uxn_opcodes_h_l776_c7_fd5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l776_c7_fd5f_cond,
t8_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue,
t8_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse,
t8_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f
result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f
result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f
result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f
result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_cond,
result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f
result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_cond,
result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue,
result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse,
result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f
result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f
result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c
BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_left,
BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_right,
BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_return_output);

-- t8_MUX_uxn_opcodes_h_l779_c7_197a
t8_MUX_uxn_opcodes_h_l779_c7_197a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l779_c7_197a_cond,
t8_MUX_uxn_opcodes_h_l779_c7_197a_iftrue,
t8_MUX_uxn_opcodes_h_l779_c7_197a_iffalse,
t8_MUX_uxn_opcodes_h_l779_c7_197a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a
result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a
result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a
result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a
result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_cond,
result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l779_c7_197a
result_pc_MUX_uxn_opcodes_h_l779_c7_197a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l779_c7_197a_cond,
result_pc_MUX_uxn_opcodes_h_l779_c7_197a_iftrue,
result_pc_MUX_uxn_opcodes_h_l779_c7_197a_iffalse,
result_pc_MUX_uxn_opcodes_h_l779_c7_197a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a
result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a
result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l782_c32_221a
BIN_OP_AND_uxn_opcodes_h_l782_c32_221a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l782_c32_221a_left,
BIN_OP_AND_uxn_opcodes_h_l782_c32_221a_right,
BIN_OP_AND_uxn_opcodes_h_l782_c32_221a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l782_c32_9160
BIN_OP_GT_uxn_opcodes_h_l782_c32_9160 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l782_c32_9160_left,
BIN_OP_GT_uxn_opcodes_h_l782_c32_9160_right,
BIN_OP_GT_uxn_opcodes_h_l782_c32_9160_return_output);

-- MUX_uxn_opcodes_h_l782_c32_0414
MUX_uxn_opcodes_h_l782_c32_0414 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l782_c32_0414_cond,
MUX_uxn_opcodes_h_l782_c32_0414_iftrue,
MUX_uxn_opcodes_h_l782_c32_0414_iffalse,
MUX_uxn_opcodes_h_l782_c32_0414_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b
BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_left,
BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_right,
BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57
result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_cond,
result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_return_output);

-- result_pc_MUX_uxn_opcodes_h_l784_c7_3b57
result_pc_MUX_uxn_opcodes_h_l784_c7_3b57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_cond,
result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue,
result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse,
result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57
result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2
BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_left,
BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_right,
BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b
result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b
result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b
result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b
result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_cond,
result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b
result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_cond,
result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue,
result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse,
result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b
result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca
BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_left,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_right,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_return_output);

-- result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2
result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_cond,
result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue,
result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse,
result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2
result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_cond,
result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output);

-- CONST_SR_8_uxn_opcodes_h_l796_c34_5b32
CONST_SR_8_uxn_opcodes_h_l796_c34_5b32 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l796_c34_5b32_x,
CONST_SR_8_uxn_opcodes_h_l796_c34_5b32_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598
BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598_left,
BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598_right,
BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a
BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_left,
BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_right,
BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a
result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a
result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a
result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_return_output,
 t8_MUX_uxn_opcodes_h_l771_c2_4f45_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_return_output,
 result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_return_output,
 t8_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output,
 result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_return_output,
 t8_MUX_uxn_opcodes_h_l779_c7_197a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_return_output,
 result_pc_MUX_uxn_opcodes_h_l779_c7_197a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l782_c32_221a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l782_c32_9160_return_output,
 MUX_uxn_opcodes_h_l782_c32_0414_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_return_output,
 result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output,
 result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_return_output,
 result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output,
 CONST_SR_8_uxn_opcodes_h_l796_c34_5b32_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l771_c2_4f45_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l771_c2_4f45_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l773_c3_7e27 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l772_c3_31ff_uxn_opcodes_h_l772_c3_31ff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l779_c7_197a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l776_c7_fd5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l777_c3_5c21 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_197a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l779_c7_197a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l779_c7_197a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l779_c7_197a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_197a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_197a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_197a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l782_c32_0414_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l782_c32_0414_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l782_c32_0414_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l782_c32_221a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l782_c32_221a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l782_c32_221a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l782_c32_9160_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l782_c32_9160_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l782_c32_9160_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l782_c32_0414_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l786_c3_dc96 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l791_c3_b72a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l792_c24_7f26_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_return_output : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l798_c3_d241 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l795_c3_d3e9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l796_c34_5b32_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l796_c34_5b32_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l796_c24_d868_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l798_c20_a99b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l784_l779_l776_l800_l771_DUPLICATE_571b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l776_l788_l771_l784_DUPLICATE_5101_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l788_l784_l779_l776_l800_l771_DUPLICATE_9432_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l784_l779_l776_l771_DUPLICATE_008c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l794_l788_l784_l779_l776_l771_DUPLICATE_7ce8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l776_l771_l784_DUPLICATE_9bdd_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l788_l779_l776_l800_l771_DUPLICATE_cca7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l788_l784_l779_l776_l800_DUPLICATE_ae08_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l794_l779_l784_DUPLICATE_aea2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7246_uxn_opcodes_h_l807_l767_DUPLICATE_8147_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l782_c32_0414_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l782_c32_221a_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l777_c3_5c21 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l777_c3_5c21;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_right := to_unsigned(2, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l782_c32_9160_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l773_c3_7e27 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l773_c3_7e27;
     VAR_MUX_uxn_opcodes_h_l782_c32_0414_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l795_c3_d3e9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l795_c3_d3e9;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l786_c3_dc96 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l786_c3_dc96;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l791_c3_b72a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l791_c3_b72a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l782_c32_221a_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_CONST_SR_8_uxn_opcodes_h_l796_c34_5b32_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l779_c7_197a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l779_c7_197a_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l794_l779_l784_DUPLICATE_aea2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l794_l779_l784_DUPLICATE_aea2_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l782_c32_221a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l782_c32_221a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l782_c32_221a_left;
     BIN_OP_AND_uxn_opcodes_h_l782_c32_221a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l782_c32_221a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l782_c32_221a_return_output := BIN_OP_AND_uxn_opcodes_h_l782_c32_221a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l788_l784_l779_l776_l800_l771_DUPLICATE_9432 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l788_l784_l779_l776_l800_l771_DUPLICATE_9432_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l776_l788_l771_l784_DUPLICATE_5101 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l776_l788_l771_l784_DUPLICATE_5101_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l788_c11_48e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l788_l784_l779_l776_l800_DUPLICATE_ae08 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l788_l784_l779_l776_l800_DUPLICATE_ae08_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l794_c11_ccca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_left;
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_return_output := BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l798_c20_a99b] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l798_c20_a99b_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l784_l779_l776_l771_DUPLICATE_008c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l784_l779_l776_l771_DUPLICATE_008c_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l776_c11_e342] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_left;
     BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_return_output := BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l784_l779_l776_l800_l771_DUPLICATE_571b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l784_l779_l776_l800_l771_DUPLICATE_571b_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l784_c11_874b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_left;
     BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_return_output := BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l771_c6_d884] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_left;
     BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_return_output := BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l788_l779_l776_l800_l771_DUPLICATE_cca7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l788_l779_l776_l800_l771_DUPLICATE_cca7_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l779_c11_ce1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l792_c24_7f26] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l792_c24_7f26_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- BIN_OP_EQ[uxn_opcodes_h_l800_c11_052a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_left;
     BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_return_output := BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l776_l771_l784_DUPLICATE_9bdd LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l776_l771_l784_DUPLICATE_9bdd_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l794_l788_l784_l779_l776_l771_DUPLICATE_7ce8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l794_l788_l784_l779_l776_l771_DUPLICATE_7ce8_return_output := result.pc;

     -- CONST_SR_8[uxn_opcodes_h_l796_c34_5b32] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l796_c34_5b32_x <= VAR_CONST_SR_8_uxn_opcodes_h_l796_c34_5b32_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l796_c34_5b32_return_output := CONST_SR_8_uxn_opcodes_h_l796_c34_5b32_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l782_c32_9160_left := VAR_BIN_OP_AND_uxn_opcodes_h_l782_c32_221a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l771_c2_4f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l771_c6_d884_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l776_c7_fd5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c11_e342_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_197a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l779_c7_197a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_ce1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_874b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l788_c11_48e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_ccca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_052a_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l798_c20_a99b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l792_c24_7f26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l776_l771_l784_DUPLICATE_9bdd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l776_l771_l784_DUPLICATE_9bdd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l776_l771_l784_DUPLICATE_9bdd_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l794_l788_l784_l779_l776_l771_DUPLICATE_7ce8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l794_l788_l784_l779_l776_l771_DUPLICATE_7ce8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_197a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l794_l788_l784_l779_l776_l771_DUPLICATE_7ce8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l794_l788_l784_l779_l776_l771_DUPLICATE_7ce8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l794_l788_l784_l779_l776_l771_DUPLICATE_7ce8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l794_l788_l784_l779_l776_l771_DUPLICATE_7ce8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l788_l784_l779_l776_l800_DUPLICATE_ae08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l788_l784_l779_l776_l800_DUPLICATE_ae08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l788_l784_l779_l776_l800_DUPLICATE_ae08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l788_l784_l779_l776_l800_DUPLICATE_ae08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l788_l784_l779_l776_l800_DUPLICATE_ae08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l788_l784_l779_l776_l800_DUPLICATE_ae08_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l788_l784_l779_l776_l800_l771_DUPLICATE_9432_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l788_l784_l779_l776_l800_l771_DUPLICATE_9432_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l788_l784_l779_l776_l800_l771_DUPLICATE_9432_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l788_l784_l779_l776_l800_l771_DUPLICATE_9432_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l788_l784_l779_l776_l800_l771_DUPLICATE_9432_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l788_l784_l779_l776_l800_l771_DUPLICATE_9432_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l776_l788_l771_l784_DUPLICATE_5101_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l776_l788_l771_l784_DUPLICATE_5101_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l776_l788_l771_l784_DUPLICATE_5101_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l776_l788_l771_l784_DUPLICATE_5101_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l788_l779_l776_l800_l771_DUPLICATE_cca7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l788_l779_l776_l800_l771_DUPLICATE_cca7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l788_l779_l776_l800_l771_DUPLICATE_cca7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l788_l779_l776_l800_l771_DUPLICATE_cca7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l788_l779_l776_l800_l771_DUPLICATE_cca7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l788_l779_l776_l800_l771_DUPLICATE_cca7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l784_l779_l776_l800_l771_DUPLICATE_571b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l784_l779_l776_l800_l771_DUPLICATE_571b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l784_l779_l776_l800_l771_DUPLICATE_571b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l784_l779_l776_l800_l771_DUPLICATE_571b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l784_l779_l776_l800_l771_DUPLICATE_571b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l784_l779_l776_l800_l771_DUPLICATE_571b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l794_l779_l784_DUPLICATE_aea2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l794_l779_l784_DUPLICATE_aea2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l794_l779_l784_DUPLICATE_aea2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l784_l779_l776_l771_DUPLICATE_008c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l784_l779_l776_l771_DUPLICATE_008c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l784_l779_l776_l771_DUPLICATE_008c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l784_l779_l776_l771_DUPLICATE_008c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l794_l784_l779_l776_l771_DUPLICATE_008c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l800_c7_654a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l800_c7_654a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l794_c7_9cd2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l771_c1_c22f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l784_c7_3b57] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l782_c32_9160] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l782_c32_9160_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l782_c32_9160_left;
     BIN_OP_GT_uxn_opcodes_h_l782_c32_9160_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l782_c32_9160_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l782_c32_9160_return_output := BIN_OP_GT_uxn_opcodes_h_l782_c32_9160_return_output;

     -- t8_MUX[uxn_opcodes_h_l779_c7_197a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l779_c7_197a_cond <= VAR_t8_MUX_uxn_opcodes_h_l779_c7_197a_cond;
     t8_MUX_uxn_opcodes_h_l779_c7_197a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l779_c7_197a_iftrue;
     t8_MUX_uxn_opcodes_h_l779_c7_197a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l779_c7_197a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l779_c7_197a_return_output := t8_MUX_uxn_opcodes_h_l779_c7_197a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l798_c15_e598] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598_left;
     BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598_return_output := BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l800_c7_654a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l796_c24_d868] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l796_c24_d868_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l796_c34_5b32_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l800_c7_654a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l788_c7_fa0b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l782_c32_0414_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l782_c32_9160_return_output;
     VAR_result_pc_uxn_opcodes_h_l798_c3_d241 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l798_c15_e598_return_output)),16);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l796_c24_d868_return_output;
     VAR_printf_uxn_opcodes_h_l772_c3_31ff_uxn_opcodes_h_l772_c3_31ff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l771_c1_c22f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_654a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l800_c7_654a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l800_c7_654a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_654a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l784_c7_3b57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l779_c7_197a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue := VAR_result_pc_uxn_opcodes_h_l798_c3_d241;
     -- t8_MUX[uxn_opcodes_h_l776_c7_fd5f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l776_c7_fd5f_cond <= VAR_t8_MUX_uxn_opcodes_h_l776_c7_fd5f_cond;
     t8_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue;
     t8_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output := t8_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output;

     -- printf_uxn_opcodes_h_l772_c3_31ff[uxn_opcodes_h_l772_c3_31ff] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l772_c3_31ff_uxn_opcodes_h_l772_c3_31ff_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l772_c3_31ff_uxn_opcodes_h_l772_c3_31ff_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l794_c7_9cd2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_9cd2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_9cd2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l794_c7_9cd2] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_cond;
     result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue;
     result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output := result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l784_c7_3b57] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_return_output;

     -- MUX[uxn_opcodes_h_l782_c32_0414] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l782_c32_0414_cond <= VAR_MUX_uxn_opcodes_h_l782_c32_0414_cond;
     MUX_uxn_opcodes_h_l782_c32_0414_iftrue <= VAR_MUX_uxn_opcodes_h_l782_c32_0414_iftrue;
     MUX_uxn_opcodes_h_l782_c32_0414_iffalse <= VAR_MUX_uxn_opcodes_h_l782_c32_0414_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l782_c32_0414_return_output := MUX_uxn_opcodes_h_l782_c32_0414_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l794_c7_9cd2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output := result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l794_c7_9cd2] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l788_c7_fa0b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_iftrue := VAR_MUX_uxn_opcodes_h_l782_c32_0414_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3b57_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l794_c7_9cd2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse := VAR_t8_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l788_c7_fa0b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output;

     -- t8_MUX[uxn_opcodes_h_l771_c2_4f45] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l771_c2_4f45_cond <= VAR_t8_MUX_uxn_opcodes_h_l771_c2_4f45_cond;
     t8_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue;
     t8_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l771_c2_4f45_return_output := t8_MUX_uxn_opcodes_h_l771_c2_4f45_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l788_c7_fa0b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_cond;
     result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output := result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l788_c7_fa0b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l779_c7_197a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l779_c7_197a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l788_c7_fa0b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output := result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l788_c7_fa0b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l788_c7_fa0b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l784_c7_3b57] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l779_c7_197a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_197a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3b57_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l788_c7_fa0b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l771_c2_4f45_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l776_c7_fd5f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l784_c7_3b57] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l784_c7_3b57] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_cond;
     result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue;
     result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_return_output := result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l784_c7_3b57] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l784_c7_3b57] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_cond;
     result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_return_output := result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l784_c7_3b57] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l776_c7_fd5f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l779_c7_197a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l784_c7_3b57] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3b57_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3b57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3b57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3b57_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_197a_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_3b57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_197a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_3b57_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l779_c7_197a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l771_c2_4f45] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l779_c7_197a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l779_c7_197a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_197a_cond;
     result_pc_MUX_uxn_opcodes_h_l779_c7_197a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_197a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l779_c7_197a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_197a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_197a_return_output := result_pc_MUX_uxn_opcodes_h_l779_c7_197a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l779_c7_197a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_return_output := result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l779_c7_197a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l779_c7_197a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l779_c7_197a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l776_c7_fd5f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l771_c2_4f45] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_197a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_197a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_197a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_197a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l779_c7_197a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l779_c7_197a_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l776_c7_fd5f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_cond;
     result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output := result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l776_c7_fd5f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l776_c7_fd5f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l771_c2_4f45] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l776_c7_fd5f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l776_c7_fd5f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l776_c7_fd5f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output := result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c7_fd5f_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l771_c2_4f45] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_cond;
     result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue;
     result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_return_output := result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l771_c2_4f45] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l771_c2_4f45] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l771_c2_4f45] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l771_c2_4f45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l771_c2_4f45] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_cond;
     result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_return_output := result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7246_uxn_opcodes_h_l807_l767_DUPLICATE_8147 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7246_uxn_opcodes_h_l807_l767_DUPLICATE_8147_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7246(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l771_c2_4f45_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l771_c2_4f45_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l771_c2_4f45_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l771_c2_4f45_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l771_c2_4f45_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l771_c2_4f45_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l771_c2_4f45_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l771_c2_4f45_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l771_c2_4f45_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7246_uxn_opcodes_h_l807_l767_DUPLICATE_8147_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7246_uxn_opcodes_h_l807_l767_DUPLICATE_8147_return_output;
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
