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
-- BIN_OP_EQ[uxn_opcodes_h_l767_c6_6e61]
signal BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l767_c1_8a3b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l767_c2_0bae]
signal t8_MUX_uxn_opcodes_h_l767_c2_0bae_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l767_c2_0bae_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l767_c2_0bae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l767_c2_0bae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l767_c2_0bae]
signal result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l767_c2_0bae]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l767_c2_0bae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l767_c2_0bae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l767_c2_0bae]
signal result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l767_c2_0bae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l767_c2_0bae]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l768_c3_37f2[uxn_opcodes_h_l768_c3_37f2]
signal printf_uxn_opcodes_h_l768_c3_37f2_uxn_opcodes_h_l768_c3_37f2_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l772_c11_680e]
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l772_c7_c18e]
signal t8_MUX_uxn_opcodes_h_l772_c7_c18e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l772_c7_c18e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l772_c7_c18e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l772_c7_c18e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l772_c7_c18e]
signal result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l772_c7_c18e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l772_c7_c18e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l772_c7_c18e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l772_c7_c18e]
signal result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l772_c7_c18e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l772_c7_c18e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l775_c11_e159]
signal BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l775_c7_37cc]
signal t8_MUX_uxn_opcodes_h_l775_c7_37cc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l775_c7_37cc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l775_c7_37cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l775_c7_37cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l775_c7_37cc]
signal result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l775_c7_37cc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l775_c7_37cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l775_c7_37cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l775_c7_37cc]
signal result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l775_c7_37cc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l775_c7_37cc]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l778_c32_4fe2]
signal BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l778_c32_64c7]
signal BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l778_c32_c12d]
signal MUX_uxn_opcodes_h_l778_c32_c12d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l778_c32_c12d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l778_c32_c12d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l778_c32_c12d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l780_c11_373e]
signal BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l780_c7_b685]
signal result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l780_c7_b685]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l780_c7_b685]
signal result_pc_MUX_uxn_opcodes_h_l780_c7_b685_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l780_c7_b685_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l780_c7_b685_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l780_c7_b685_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l780_c7_b685]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l780_c7_b685]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l780_c7_b685]
signal result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l780_c7_b685]
signal result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l780_c7_b685]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l780_c7_b685]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l784_c11_8583]
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l784_c7_e567]
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l784_c7_e567]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l784_c7_e567]
signal result_pc_MUX_uxn_opcodes_h_l784_c7_e567_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l784_c7_e567_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l784_c7_e567_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l784_c7_e567_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l784_c7_e567]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l784_c7_e567]
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l784_c7_e567]
signal result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l784_c7_e567]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l784_c7_e567]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l790_c11_9672]
signal BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l790_c7_7705]
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l790_c7_7705]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l790_c7_7705]
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l790_c7_7705]
signal result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l790_c7_7705]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l790_c7_7705]
signal result_pc_MUX_uxn_opcodes_h_l790_c7_7705_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l790_c7_7705_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l790_c7_7705_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l790_c7_7705_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l790_c7_7705]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l792_c34_d921]
signal CONST_SR_8_uxn_opcodes_h_l792_c34_d921_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l792_c34_d921_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l794_c15_a88d]
signal BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l796_c11_5a10]
signal BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l796_c7_a462]
signal result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l796_c7_a462]
signal result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l796_c7_a462]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l796_c7_a462]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_d01b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.pc := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;
      base.is_sp_shift := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61
BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_left,
BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_right,
BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_return_output);

-- t8_MUX_uxn_opcodes_h_l767_c2_0bae
t8_MUX_uxn_opcodes_h_l767_c2_0bae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l767_c2_0bae_cond,
t8_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue,
t8_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse,
t8_MUX_uxn_opcodes_h_l767_c2_0bae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae
result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_return_output);

-- result_pc_MUX_uxn_opcodes_h_l767_c2_0bae
result_pc_MUX_uxn_opcodes_h_l767_c2_0bae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_cond,
result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue,
result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse,
result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae
result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae
result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae
result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae
result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_cond,
result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae
result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_return_output);

-- printf_uxn_opcodes_h_l768_c3_37f2_uxn_opcodes_h_l768_c3_37f2
printf_uxn_opcodes_h_l768_c3_37f2_uxn_opcodes_h_l768_c3_37f2 : entity work.printf_uxn_opcodes_h_l768_c3_37f2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l768_c3_37f2_uxn_opcodes_h_l768_c3_37f2_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e
BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_left,
BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_right,
BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_return_output);

-- t8_MUX_uxn_opcodes_h_l772_c7_c18e
t8_MUX_uxn_opcodes_h_l772_c7_c18e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l772_c7_c18e_cond,
t8_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue,
t8_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse,
t8_MUX_uxn_opcodes_h_l772_c7_c18e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l772_c7_c18e
result_pc_MUX_uxn_opcodes_h_l772_c7_c18e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_cond,
result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue,
result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse,
result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e
result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e
result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e
result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_cond,
result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e
result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159
BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_left,
BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_right,
BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_return_output);

-- t8_MUX_uxn_opcodes_h_l775_c7_37cc
t8_MUX_uxn_opcodes_h_l775_c7_37cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l775_c7_37cc_cond,
t8_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue,
t8_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse,
t8_MUX_uxn_opcodes_h_l775_c7_37cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc
result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_return_output);

-- result_pc_MUX_uxn_opcodes_h_l775_c7_37cc
result_pc_MUX_uxn_opcodes_h_l775_c7_37cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_cond,
result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue,
result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse,
result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc
result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc
result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc
result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_cond,
result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc
result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2
BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2_left,
BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2_right,
BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7
BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7_left,
BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7_right,
BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7_return_output);

-- MUX_uxn_opcodes_h_l778_c32_c12d
MUX_uxn_opcodes_h_l778_c32_c12d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l778_c32_c12d_cond,
MUX_uxn_opcodes_h_l778_c32_c12d_iftrue,
MUX_uxn_opcodes_h_l778_c32_c12d_iffalse,
MUX_uxn_opcodes_h_l778_c32_c12d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e
BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_left,
BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_right,
BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685
result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_return_output);

-- result_pc_MUX_uxn_opcodes_h_l780_c7_b685
result_pc_MUX_uxn_opcodes_h_l780_c7_b685 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l780_c7_b685_cond,
result_pc_MUX_uxn_opcodes_h_l780_c7_b685_iftrue,
result_pc_MUX_uxn_opcodes_h_l780_c7_b685_iffalse,
result_pc_MUX_uxn_opcodes_h_l780_c7_b685_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685
result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685
result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685
result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685
result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_cond,
result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685
result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583
BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_left,
BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_right,
BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_return_output);

-- result_pc_MUX_uxn_opcodes_h_l784_c7_e567
result_pc_MUX_uxn_opcodes_h_l784_c7_e567 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l784_c7_e567_cond,
result_pc_MUX_uxn_opcodes_h_l784_c7_e567_iftrue,
result_pc_MUX_uxn_opcodes_h_l784_c7_e567_iffalse,
result_pc_MUX_uxn_opcodes_h_l784_c7_e567_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567
result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_cond,
result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672
BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_left,
BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_right,
BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705
result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_cond,
result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_return_output);

-- result_pc_MUX_uxn_opcodes_h_l790_c7_7705
result_pc_MUX_uxn_opcodes_h_l790_c7_7705 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l790_c7_7705_cond,
result_pc_MUX_uxn_opcodes_h_l790_c7_7705_iftrue,
result_pc_MUX_uxn_opcodes_h_l790_c7_7705_iffalse,
result_pc_MUX_uxn_opcodes_h_l790_c7_7705_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_return_output);

-- CONST_SR_8_uxn_opcodes_h_l792_c34_d921
CONST_SR_8_uxn_opcodes_h_l792_c34_d921 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l792_c34_d921_x,
CONST_SR_8_uxn_opcodes_h_l792_c34_d921_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d
BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d_left,
BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d_right,
BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10
BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_left,
BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_right,
BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462
result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462
result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462
result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_return_output,
 t8_MUX_uxn_opcodes_h_l767_c2_0bae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_return_output,
 result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_return_output,
 t8_MUX_uxn_opcodes_h_l772_c7_c18e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_return_output,
 result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_return_output,
 t8_MUX_uxn_opcodes_h_l775_c7_37cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_return_output,
 result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_return_output,
 BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2_return_output,
 BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7_return_output,
 MUX_uxn_opcodes_h_l778_c32_c12d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_return_output,
 result_pc_MUX_uxn_opcodes_h_l780_c7_b685_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_return_output,
 result_pc_MUX_uxn_opcodes_h_l784_c7_e567_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_return_output,
 result_pc_MUX_uxn_opcodes_h_l790_c7_7705_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_return_output,
 CONST_SR_8_uxn_opcodes_h_l792_c34_d921_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l772_c7_c18e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l767_c2_0bae_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l767_c2_0bae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_85b1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l768_c3_37f2_uxn_opcodes_h_l768_c3_37f2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l775_c7_37cc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l772_c7_c18e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l773_c3_6612 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l775_c7_37cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l780_c7_b685_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l778_c32_c12d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l778_c32_c12d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l778_c32_c12d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l778_c32_c12d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l780_c7_b685_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l780_c7_b685_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_e567_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l780_c7_b685_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l782_c3_2ec0 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l787_c3_e2ef : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_e567_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_e567_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l790_c7_7705_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_e567_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l788_c24_eb61_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l791_c3_9929 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l790_c7_7705_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l794_c3_0606 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l790_c7_7705_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l790_c7_7705_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l792_c34_d921_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l792_c34_d921_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l792_c24_9e1b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l794_c20_7f88_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l790_l780_l775_l772_l767_l796_DUPLICATE_7b67_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l790_l784_l780_l775_l772_l767_DUPLICATE_e60e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l784_l780_l775_l772_l767_l796_DUPLICATE_a4d5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l767_l780_l772_DUPLICATE_0934_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l790_l780_l775_l772_l767_DUPLICATE_4468_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l784_l767_l780_l772_DUPLICATE_1668_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l790_l784_l775_l772_l767_l796_DUPLICATE_5e2c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l790_l784_l780_l775_l772_l796_DUPLICATE_a26d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l775_l790_l780_DUPLICATE_155b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d01b_uxn_opcodes_h_l803_l763_DUPLICATE_3e31_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l791_c3_9929 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l791_c3_9929;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l787_c3_e2ef := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l787_c3_e2ef;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_right := to_unsigned(6, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l778_c32_c12d_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l773_c3_6612 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l773_c3_6612;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_85b1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_85b1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l778_c32_c12d_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l782_c3_2ec0 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l782_c3_2ec0;
     VAR_BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_CONST_SR_8_uxn_opcodes_h_l792_c34_d921_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l784_c11_8583] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_left;
     BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_return_output := BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l790_l780_l775_l772_l767_DUPLICATE_4468 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l790_l780_l775_l772_l767_DUPLICATE_4468_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l780_c11_373e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_left;
     BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_return_output := BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l775_l790_l780_DUPLICATE_155b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l775_l790_l780_DUPLICATE_155b_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l784_l780_l775_l772_l767_l796_DUPLICATE_a4d5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l784_l780_l775_l772_l767_l796_DUPLICATE_a4d5_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l790_l784_l775_l772_l767_l796_DUPLICATE_5e2c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l790_l784_l775_l772_l767_l796_DUPLICATE_5e2c_return_output := result.is_stack_index_flipped;

     -- CONST_SR_8[uxn_opcodes_h_l792_c34_d921] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l792_c34_d921_x <= VAR_CONST_SR_8_uxn_opcodes_h_l792_c34_d921_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l792_c34_d921_return_output := CONST_SR_8_uxn_opcodes_h_l792_c34_d921_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l796_c11_5a10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_left;
     BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_return_output := BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l772_c11_680e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_left;
     BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_return_output := BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l788_c24_eb61] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l788_c24_eb61_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- CAST_TO_int8_t[uxn_opcodes_h_l794_c20_7f88] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l794_c20_7f88_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l790_l780_l775_l772_l767_l796_DUPLICATE_7b67 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l790_l780_l775_l772_l767_l796_DUPLICATE_7b67_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l775_c11_e159] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_left;
     BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_return_output := BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l790_l784_l780_l775_l772_l796_DUPLICATE_a26d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l790_l784_l780_l775_l772_l796_DUPLICATE_a26d_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l790_l784_l780_l775_l772_l767_DUPLICATE_e60e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l790_l784_l780_l775_l772_l767_DUPLICATE_e60e_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l767_c6_6e61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_left;
     BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_return_output := BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l778_c32_4fe2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2_left;
     BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2_return_output := BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l784_l767_l780_l772_DUPLICATE_1668 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l784_l767_l780_l772_DUPLICATE_1668_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l790_c11_9672] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_left;
     BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_return_output := BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l767_l780_l772_DUPLICATE_0934 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l767_l780_l772_DUPLICATE_0934_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7_left := VAR_BIN_OP_AND_uxn_opcodes_h_l778_c32_4fe2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l767_c2_0bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_6e61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l772_c7_c18e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_680e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l775_c7_37cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_e159_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l780_c7_b685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_373e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_e567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_8583_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l790_c7_7705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_9672_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l796_c11_5a10_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l794_c20_7f88_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l788_c24_eb61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l767_l780_l772_DUPLICATE_0934_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l767_l780_l772_DUPLICATE_0934_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l767_l780_l772_DUPLICATE_0934_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l790_l784_l780_l775_l772_l767_DUPLICATE_e60e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l790_l784_l780_l775_l772_l767_DUPLICATE_e60e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l790_l784_l780_l775_l772_l767_DUPLICATE_e60e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l780_c7_b685_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l790_l784_l780_l775_l772_l767_DUPLICATE_e60e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_e567_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l790_l784_l780_l775_l772_l767_DUPLICATE_e60e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l790_c7_7705_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l790_l784_l780_l775_l772_l767_DUPLICATE_e60e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l790_l784_l780_l775_l772_l796_DUPLICATE_a26d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l790_l784_l780_l775_l772_l796_DUPLICATE_a26d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l790_l784_l780_l775_l772_l796_DUPLICATE_a26d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l790_l784_l780_l775_l772_l796_DUPLICATE_a26d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l790_l784_l780_l775_l772_l796_DUPLICATE_a26d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l790_l784_l780_l775_l772_l796_DUPLICATE_a26d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l784_l780_l775_l772_l767_l796_DUPLICATE_a4d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l784_l780_l775_l772_l767_l796_DUPLICATE_a4d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l784_l780_l775_l772_l767_l796_DUPLICATE_a4d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l784_l780_l775_l772_l767_l796_DUPLICATE_a4d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l784_l780_l775_l772_l767_l796_DUPLICATE_a4d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l784_l780_l775_l772_l767_l796_DUPLICATE_a4d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l784_l767_l780_l772_DUPLICATE_1668_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l784_l767_l780_l772_DUPLICATE_1668_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l784_l767_l780_l772_DUPLICATE_1668_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l784_l767_l780_l772_DUPLICATE_1668_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l790_l784_l775_l772_l767_l796_DUPLICATE_5e2c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l790_l784_l775_l772_l767_l796_DUPLICATE_5e2c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l790_l784_l775_l772_l767_l796_DUPLICATE_5e2c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l790_l784_l775_l772_l767_l796_DUPLICATE_5e2c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l790_l784_l775_l772_l767_l796_DUPLICATE_5e2c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l790_l784_l775_l772_l767_l796_DUPLICATE_5e2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l790_l780_l775_l772_l767_l796_DUPLICATE_7b67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l790_l780_l775_l772_l767_l796_DUPLICATE_7b67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l790_l780_l775_l772_l767_l796_DUPLICATE_7b67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l790_l780_l775_l772_l767_l796_DUPLICATE_7b67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l790_l780_l775_l772_l767_l796_DUPLICATE_7b67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l790_l780_l775_l772_l767_l796_DUPLICATE_7b67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l775_l790_l780_DUPLICATE_155b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l775_l790_l780_DUPLICATE_155b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l775_l790_l780_DUPLICATE_155b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l790_l780_l775_l772_l767_DUPLICATE_4468_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l790_l780_l775_l772_l767_DUPLICATE_4468_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l790_l780_l775_l772_l767_DUPLICATE_4468_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l790_l780_l775_l772_l767_DUPLICATE_4468_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l790_l780_l775_l772_l767_DUPLICATE_4468_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l796_c7_a462] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l778_c32_64c7] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7_left;
     BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7_return_output := BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l790_c7_7705] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l794_c15_a88d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l792_c24_9e1b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l792_c24_9e1b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l792_c34_d921_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l796_c7_a462] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l767_c1_8a3b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l796_c7_a462] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l784_c7_e567] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l780_c7_b685] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_return_output;

     -- t8_MUX[uxn_opcodes_h_l775_c7_37cc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l775_c7_37cc_cond <= VAR_t8_MUX_uxn_opcodes_h_l775_c7_37cc_cond;
     t8_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue;
     t8_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l775_c7_37cc_return_output := t8_MUX_uxn_opcodes_h_l775_c7_37cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l796_c7_a462] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l778_c32_c12d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l778_c32_64c7_return_output;
     VAR_result_pc_uxn_opcodes_h_l794_c3_0606 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l794_c15_a88d_return_output)),16);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l792_c24_9e1b_return_output;
     VAR_printf_uxn_opcodes_h_l768_c3_37f2_uxn_opcodes_h_l768_c3_37f2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l767_c1_8a3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l796_c7_a462_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l796_c7_a462_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_e567_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l796_c7_a462_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l796_c7_a462_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_b685_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_7705_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l775_c7_37cc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l790_c7_7705_iftrue := VAR_result_pc_uxn_opcodes_h_l794_c3_0606;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l790_c7_7705] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_return_output;

     -- printf_uxn_opcodes_h_l768_c3_37f2[uxn_opcodes_h_l768_c3_37f2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l768_c3_37f2_uxn_opcodes_h_l768_c3_37f2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l768_c3_37f2_uxn_opcodes_h_l768_c3_37f2_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l780_c7_b685] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_return_output;

     -- t8_MUX[uxn_opcodes_h_l772_c7_c18e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l772_c7_c18e_cond <= VAR_t8_MUX_uxn_opcodes_h_l772_c7_c18e_cond;
     t8_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue;
     t8_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l772_c7_c18e_return_output := t8_MUX_uxn_opcodes_h_l772_c7_c18e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l790_c7_7705] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l790_c7_7705] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l790_c7_7705_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l790_c7_7705_cond;
     result_pc_MUX_uxn_opcodes_h_l790_c7_7705_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l790_c7_7705_iftrue;
     result_pc_MUX_uxn_opcodes_h_l790_c7_7705_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l790_c7_7705_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l790_c7_7705_return_output := result_pc_MUX_uxn_opcodes_h_l790_c7_7705_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l784_c7_e567] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l790_c7_7705] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_cond;
     result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_return_output := result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l790_c7_7705] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l790_c7_7705] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_return_output;

     -- MUX[uxn_opcodes_h_l778_c32_c12d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l778_c32_c12d_cond <= VAR_MUX_uxn_opcodes_h_l778_c32_c12d_cond;
     MUX_uxn_opcodes_h_l778_c32_c12d_iftrue <= VAR_MUX_uxn_opcodes_h_l778_c32_c12d_iftrue;
     MUX_uxn_opcodes_h_l778_c32_c12d_iffalse <= VAR_MUX_uxn_opcodes_h_l778_c32_c12d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l778_c32_c12d_return_output := MUX_uxn_opcodes_h_l778_c32_c12d_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue := VAR_MUX_uxn_opcodes_h_l778_c32_c12d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_7705_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_7705_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_b685_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_7705_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_7705_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_e567_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l790_c7_7705_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_e567_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_7705_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse := VAR_t8_MUX_uxn_opcodes_h_l772_c7_c18e_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l784_c7_e567] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l784_c7_e567] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l784_c7_e567] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l784_c7_e567_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_e567_cond;
     result_pc_MUX_uxn_opcodes_h_l784_c7_e567_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_e567_iftrue;
     result_pc_MUX_uxn_opcodes_h_l784_c7_e567_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_e567_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_e567_return_output := result_pc_MUX_uxn_opcodes_h_l784_c7_e567_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l775_c7_37cc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l780_c7_b685] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l784_c7_e567] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l775_c7_37cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l784_c7_e567] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_cond;
     result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_return_output := result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l784_c7_e567] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_return_output;

     -- t8_MUX[uxn_opcodes_h_l767_c2_0bae] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l767_c2_0bae_cond <= VAR_t8_MUX_uxn_opcodes_h_l767_c2_0bae_cond;
     t8_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue;
     t8_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l767_c2_0bae_return_output := t8_MUX_uxn_opcodes_h_l767_c2_0bae_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_e567_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_e567_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_37cc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_e567_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_e567_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l780_c7_b685_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l784_c7_e567_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_37cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_b685_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l784_c7_e567_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l767_c2_0bae_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l772_c7_c18e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l780_c7_b685] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l780_c7_b685] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_cond;
     result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_return_output := result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l780_c7_b685] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l780_c7_b685_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l780_c7_b685_cond;
     result_pc_MUX_uxn_opcodes_h_l780_c7_b685_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l780_c7_b685_iftrue;
     result_pc_MUX_uxn_opcodes_h_l780_c7_b685_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l780_c7_b685_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l780_c7_b685_return_output := result_pc_MUX_uxn_opcodes_h_l780_c7_b685_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l775_c7_37cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l780_c7_b685] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l772_c7_c18e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l780_c7_b685] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l780_c7_b685] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_b685_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_b685_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_c18e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_b685_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_b685_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l780_c7_b685_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_c18e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_37cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l780_c7_b685_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l775_c7_37cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l767_c2_0bae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l775_c7_37cc] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l775_c7_37cc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l775_c7_37cc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_return_output := result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l775_c7_37cc] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_cond;
     result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue;
     result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_return_output := result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l775_c7_37cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l772_c7_c18e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l767_c2_0bae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_37cc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_37cc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_37cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_37cc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l775_c7_37cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_c18e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l775_c7_37cc_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l767_c2_0bae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l772_c7_c18e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l772_c7_c18e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l772_c7_c18e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_return_output := result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l772_c7_c18e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_cond;
     result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_return_output := result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l772_c7_c18e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l772_c7_c18e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_c18e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_c18e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_c18e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_c18e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l772_c7_c18e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l772_c7_c18e_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l767_c2_0bae] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l767_c2_0bae] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_cond;
     result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_return_output := result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l767_c2_0bae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l767_c2_0bae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l767_c2_0bae] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l767_c2_0bae] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_cond;
     result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_iftrue;
     result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_return_output := result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d01b_uxn_opcodes_h_l803_l763_DUPLICATE_3e31 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d01b_uxn_opcodes_h_l803_l763_DUPLICATE_3e31_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d01b(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_0bae_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_0bae_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l767_c2_0bae_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_0bae_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_0bae_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_0bae_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c2_0bae_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_0bae_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_0bae_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d01b_uxn_opcodes_h_l803_l763_DUPLICATE_3e31_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d01b_uxn_opcodes_h_l803_l763_DUPLICATE_3e31_return_output;
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
