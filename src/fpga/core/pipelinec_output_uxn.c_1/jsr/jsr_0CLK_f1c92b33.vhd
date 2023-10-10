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
-- BIN_OP_EQ[uxn_opcodes_h_l795_c6_1065]
signal BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l795_c1_2f5e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l795_c2_3586]
signal result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l795_c2_3586]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l795_c2_3586]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l795_c2_3586]
signal result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l795_c2_3586]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l795_c2_3586]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l795_c2_3586]
signal result_pc_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l795_c2_3586_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l795_c2_3586]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l795_c2_3586]
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l795_c2_3586]
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l795_c2_3586]
signal t8_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l795_c2_3586_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l796_c3_5a12[uxn_opcodes_h_l796_c3_5a12]
signal printf_uxn_opcodes_h_l796_c3_5a12_uxn_opcodes_h_l796_c3_5a12_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l801_c11_9676]
signal BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l801_c7_9b5c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l801_c7_9b5c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l801_c7_9b5c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l801_c7_9b5c]
signal result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l801_c7_9b5c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l801_c7_9b5c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l801_c7_9b5c]
signal result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l801_c7_9b5c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l801_c7_9b5c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l801_c7_9b5c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l801_c7_9b5c]
signal t8_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l804_c11_6db4]
signal BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l804_c7_8291]
signal result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l804_c7_8291]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l804_c7_8291]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l804_c7_8291]
signal result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l804_c7_8291]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l804_c7_8291]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l804_c7_8291]
signal result_pc_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l804_c7_8291_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l804_c7_8291]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l804_c7_8291]
signal result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l804_c7_8291]
signal result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l804_c7_8291]
signal t8_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l804_c7_8291_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l808_c32_d744]
signal BIN_OP_AND_uxn_opcodes_h_l808_c32_d744_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l808_c32_d744_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l808_c32_d744_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l808_c32_f06d]
signal BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l808_c32_6c39]
signal MUX_uxn_opcodes_h_l808_c32_6c39_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l808_c32_6c39_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l808_c32_6c39_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l808_c32_6c39_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l810_c11_9c66]
signal BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l810_c7_ba3c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l810_c7_ba3c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l810_c7_ba3c]
signal result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l810_c7_ba3c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l810_c7_ba3c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l810_c7_ba3c]
signal result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l810_c7_ba3c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l810_c7_ba3c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l810_c7_ba3c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l814_c11_5843]
signal BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l814_c7_af2d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l814_c7_af2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l814_c7_af2d]
signal result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l814_c7_af2d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l814_c7_af2d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l814_c7_af2d]
signal result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l814_c7_af2d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l814_c7_af2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l820_c11_7d8f]
signal BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l820_c7_e8b1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l820_c7_e8b1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l820_c7_e8b1]
signal result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l820_c7_e8b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l820_c7_e8b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l820_c7_e8b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l820_c7_e8b1]
signal result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l822_c34_52cf]
signal CONST_SR_8_uxn_opcodes_h_l822_c34_52cf_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l822_c34_52cf_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l824_c15_0175]
signal BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l826_c11_62f3]
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l826_c7_969e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l826_c7_969e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l826_c7_969e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l826_c7_969e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065
BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_left,
BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_right,
BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586
result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586
result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_cond,
result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586
result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_return_output);

-- result_pc_MUX_uxn_opcodes_h_l795_c2_3586
result_pc_MUX_uxn_opcodes_h_l795_c2_3586 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l795_c2_3586_cond,
result_pc_MUX_uxn_opcodes_h_l795_c2_3586_iftrue,
result_pc_MUX_uxn_opcodes_h_l795_c2_3586_iffalse,
result_pc_MUX_uxn_opcodes_h_l795_c2_3586_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586
result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586
result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_return_output);

-- t8_MUX_uxn_opcodes_h_l795_c2_3586
t8_MUX_uxn_opcodes_h_l795_c2_3586 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l795_c2_3586_cond,
t8_MUX_uxn_opcodes_h_l795_c2_3586_iftrue,
t8_MUX_uxn_opcodes_h_l795_c2_3586_iffalse,
t8_MUX_uxn_opcodes_h_l795_c2_3586_return_output);

-- printf_uxn_opcodes_h_l796_c3_5a12_uxn_opcodes_h_l796_c3_5a12
printf_uxn_opcodes_h_l796_c3_5a12_uxn_opcodes_h_l796_c3_5a12 : entity work.printf_uxn_opcodes_h_l796_c3_5a12_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l796_c3_5a12_uxn_opcodes_h_l796_c3_5a12_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676
BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_left,
BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_right,
BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c
result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c
result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_cond,
result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c
result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_cond,
result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue,
result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse,
result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output);

-- t8_MUX_uxn_opcodes_h_l801_c7_9b5c
t8_MUX_uxn_opcodes_h_l801_c7_9b5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l801_c7_9b5c_cond,
t8_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue,
t8_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse,
t8_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4
BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_left,
BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_right,
BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291
result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291
result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291
result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_cond,
result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291
result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_return_output);

-- result_pc_MUX_uxn_opcodes_h_l804_c7_8291
result_pc_MUX_uxn_opcodes_h_l804_c7_8291 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l804_c7_8291_cond,
result_pc_MUX_uxn_opcodes_h_l804_c7_8291_iftrue,
result_pc_MUX_uxn_opcodes_h_l804_c7_8291_iffalse,
result_pc_MUX_uxn_opcodes_h_l804_c7_8291_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291
result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291
result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291
result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_return_output);

-- t8_MUX_uxn_opcodes_h_l804_c7_8291
t8_MUX_uxn_opcodes_h_l804_c7_8291 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l804_c7_8291_cond,
t8_MUX_uxn_opcodes_h_l804_c7_8291_iftrue,
t8_MUX_uxn_opcodes_h_l804_c7_8291_iffalse,
t8_MUX_uxn_opcodes_h_l804_c7_8291_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l808_c32_d744
BIN_OP_AND_uxn_opcodes_h_l808_c32_d744 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l808_c32_d744_left,
BIN_OP_AND_uxn_opcodes_h_l808_c32_d744_right,
BIN_OP_AND_uxn_opcodes_h_l808_c32_d744_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d
BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d_left,
BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d_right,
BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d_return_output);

-- MUX_uxn_opcodes_h_l808_c32_6c39
MUX_uxn_opcodes_h_l808_c32_6c39 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l808_c32_6c39_cond,
MUX_uxn_opcodes_h_l808_c32_6c39_iftrue,
MUX_uxn_opcodes_h_l808_c32_6c39_iffalse,
MUX_uxn_opcodes_h_l808_c32_6c39_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66
BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_left,
BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_right,
BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c
result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_cond,
result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c
result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_cond,
result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue,
result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse,
result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843
BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_left,
BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_right,
BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d
result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d
result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_cond,
result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d
result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_return_output);

-- result_pc_MUX_uxn_opcodes_h_l814_c7_af2d
result_pc_MUX_uxn_opcodes_h_l814_c7_af2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_cond,
result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue,
result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse,
result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d
result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d
result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f
BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_left,
BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_right,
BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1
result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1
result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_cond,
result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue,
result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse,
result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1
result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1
result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1
result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_cond,
result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l822_c34_52cf
CONST_SR_8_uxn_opcodes_h_l822_c34_52cf : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l822_c34_52cf_x,
CONST_SR_8_uxn_opcodes_h_l822_c34_52cf_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175
BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175_left,
BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175_right,
BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3
BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_left,
BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_right,
BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_return_output,
 result_pc_MUX_uxn_opcodes_h_l795_c2_3586_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_return_output,
 t8_MUX_uxn_opcodes_h_l795_c2_3586_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output,
 result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output,
 t8_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_return_output,
 result_pc_MUX_uxn_opcodes_h_l804_c7_8291_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_return_output,
 t8_MUX_uxn_opcodes_h_l804_c7_8291_return_output,
 BIN_OP_AND_uxn_opcodes_h_l808_c32_d744_return_output,
 BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d_return_output,
 MUX_uxn_opcodes_h_l808_c32_6c39_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output,
 result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_return_output,
 result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output,
 result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output,
 CONST_SR_8_uxn_opcodes_h_l822_c34_52cf_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l798_c3_14b1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l795_c2_3586_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l795_c2_3586_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l795_c2_3586_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l795_c2_3586_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l795_c2_3586_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l796_c3_5a12_uxn_opcodes_h_l796_c3_5a12_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l802_c3_0025 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l804_c7_8291_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l804_c7_8291_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l801_c7_9b5c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l804_c7_8291_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l804_c7_8291_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l804_c7_8291_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l808_c32_6c39_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l808_c32_6c39_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l808_c32_6c39_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l808_c32_d744_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l808_c32_d744_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l808_c32_d744_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l808_c32_6c39_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l812_c3_699d : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l817_c3_3c23 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l818_c24_e2dd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l824_c3_cbc4 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_3633 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l822_c34_52cf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l822_c34_52cf_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l822_c24_b44b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l824_c20_8ec4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l814_l810_l804_l801_l795_l826_DUPLICATE_b054_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l820_l810_l804_l801_l795_DUPLICATE_4937_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l801_l814_l795_l810_DUPLICATE_0d2d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l820_l814_l804_l801_l795_l826_DUPLICATE_3b5a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l820_l814_l810_l804_l801_l795_DUPLICATE_6ab4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l801_l795_l810_DUPLICATE_6c53_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l820_l810_l804_l801_l795_l826_DUPLICATE_9fb4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l801_l804_DUPLICATE_c65d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l820_l814_l810_l804_l801_l826_DUPLICATE_3dc6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l804_l820_l810_DUPLICATE_0626_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4929_uxn_opcodes_h_l833_l791_DUPLICATE_b8cd_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l808_c32_d744_right := to_unsigned(128, 8);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l812_c3_699d := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l812_c3_699d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l798_c3_14b1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l798_c3_14b1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l802_c3_0025 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l802_c3_0025;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_3633 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l821_c3_3633;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l817_c3_3c23 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l817_c3_3c23;
     VAR_BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l808_c32_6c39_iffalse := resize(to_signed(-1, 2), 8);
     VAR_MUX_uxn_opcodes_h_l808_c32_6c39_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l808_c32_d744_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_CONST_SR_8_uxn_opcodes_h_l822_c34_52cf_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l804_c7_8291_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l795_c2_3586_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l804_c7_8291_iffalse := t8;
     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l820_l814_l810_l804_l801_l795_DUPLICATE_6ab4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l820_l814_l810_l804_l801_l795_DUPLICATE_6ab4_return_output := result.pc;

     -- CONST_SR_8[uxn_opcodes_h_l822_c34_52cf] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l822_c34_52cf_x <= VAR_CONST_SR_8_uxn_opcodes_h_l822_c34_52cf_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l822_c34_52cf_return_output := CONST_SR_8_uxn_opcodes_h_l822_c34_52cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l820_c11_7d8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_left;
     BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_return_output := BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l808_c32_d744] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l808_c32_d744_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l808_c32_d744_left;
     BIN_OP_AND_uxn_opcodes_h_l808_c32_d744_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l808_c32_d744_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l808_c32_d744_return_output := BIN_OP_AND_uxn_opcodes_h_l808_c32_d744_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l810_c11_9c66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_left;
     BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_return_output := BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l801_c11_9676] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_left;
     BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_return_output := BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l804_l820_l810_DUPLICATE_0626 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l804_l820_l810_DUPLICATE_0626_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l801_l795_l810_DUPLICATE_6c53 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l801_l795_l810_DUPLICATE_6c53_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l814_c11_5843] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_left;
     BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_return_output := BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l801_l814_l795_l810_DUPLICATE_0d2d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l801_l814_l795_l810_DUPLICATE_0d2d_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l814_l810_l804_l801_l795_l826_DUPLICATE_b054 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l814_l810_l804_l801_l795_l826_DUPLICATE_b054_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l820_l814_l804_l801_l795_l826_DUPLICATE_3b5a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l820_l814_l804_l801_l795_l826_DUPLICATE_3b5a_return_output := result.is_stack_index_flipped;

     -- CAST_TO_int8_t[uxn_opcodes_h_l824_c20_8ec4] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l824_c20_8ec4_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l820_l814_l810_l804_l801_l826_DUPLICATE_3dc6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l820_l814_l810_l804_l801_l826_DUPLICATE_3dc6_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l820_l810_l804_l801_l795_DUPLICATE_4937 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l820_l810_l804_l801_l795_DUPLICATE_4937_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l795_c6_1065] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_left;
     BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_return_output := BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l818_c24_e2dd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l818_c24_e2dd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- BIN_OP_EQ[uxn_opcodes_h_l804_c11_6db4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_left;
     BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_return_output := BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l801_l804_DUPLICATE_c65d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l801_l804_DUPLICATE_c65d_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l820_l810_l804_l801_l795_l826_DUPLICATE_9fb4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l820_l810_l804_l801_l795_l826_DUPLICATE_9fb4_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l826_c11_62f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l808_c32_d744_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l795_c2_3586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l795_c2_3586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c6_1065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l801_c7_9b5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l801_c11_9676_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l804_c7_8291_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l804_c7_8291_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l804_c11_6db4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l810_c11_9c66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c11_5843_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l820_c11_7d8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l826_c11_62f3_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l824_c20_8ec4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l818_c24_e2dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l801_l795_l810_DUPLICATE_6c53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l801_l795_l810_DUPLICATE_6c53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l801_l795_l810_DUPLICATE_6c53_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l795_c2_3586_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l820_l814_l810_l804_l801_l795_DUPLICATE_6ab4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l820_l814_l810_l804_l801_l795_DUPLICATE_6ab4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l804_c7_8291_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l820_l814_l810_l804_l801_l795_DUPLICATE_6ab4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l820_l814_l810_l804_l801_l795_DUPLICATE_6ab4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l820_l814_l810_l804_l801_l795_DUPLICATE_6ab4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l820_l814_l810_l804_l801_l795_DUPLICATE_6ab4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l820_l814_l810_l804_l801_l826_DUPLICATE_3dc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l820_l814_l810_l804_l801_l826_DUPLICATE_3dc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l820_l814_l810_l804_l801_l826_DUPLICATE_3dc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l820_l814_l810_l804_l801_l826_DUPLICATE_3dc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l820_l814_l810_l804_l801_l826_DUPLICATE_3dc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l820_l814_l810_l804_l801_l826_DUPLICATE_3dc6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l814_l810_l804_l801_l795_l826_DUPLICATE_b054_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l814_l810_l804_l801_l795_l826_DUPLICATE_b054_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l814_l810_l804_l801_l795_l826_DUPLICATE_b054_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l814_l810_l804_l801_l795_l826_DUPLICATE_b054_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l814_l810_l804_l801_l795_l826_DUPLICATE_b054_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l814_l810_l804_l801_l795_l826_DUPLICATE_b054_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l801_l814_l795_l810_DUPLICATE_0d2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l801_l814_l795_l810_DUPLICATE_0d2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l801_l814_l795_l810_DUPLICATE_0d2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l801_l814_l795_l810_DUPLICATE_0d2d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l820_l814_l804_l801_l795_l826_DUPLICATE_3b5a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l820_l814_l804_l801_l795_l826_DUPLICATE_3b5a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l820_l814_l804_l801_l795_l826_DUPLICATE_3b5a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l820_l814_l804_l801_l795_l826_DUPLICATE_3b5a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l820_l814_l804_l801_l795_l826_DUPLICATE_3b5a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l820_l814_l804_l801_l795_l826_DUPLICATE_3b5a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l801_l804_DUPLICATE_c65d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l801_l804_DUPLICATE_c65d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l820_l810_l804_l801_l795_l826_DUPLICATE_9fb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l820_l810_l804_l801_l795_l826_DUPLICATE_9fb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l820_l810_l804_l801_l795_l826_DUPLICATE_9fb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l820_l810_l804_l801_l795_l826_DUPLICATE_9fb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l820_l810_l804_l801_l795_l826_DUPLICATE_9fb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l820_l810_l804_l801_l795_l826_DUPLICATE_9fb4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l804_l820_l810_DUPLICATE_0626_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l804_l820_l810_DUPLICATE_0626_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l804_l820_l810_DUPLICATE_0626_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l820_l810_l804_l801_l795_DUPLICATE_4937_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l820_l810_l804_l801_l795_DUPLICATE_4937_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l820_l810_l804_l801_l795_DUPLICATE_4937_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l820_l810_l804_l801_l795_DUPLICATE_4937_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l820_l810_l804_l801_l795_DUPLICATE_4937_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l820_c7_e8b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l810_c7_ba3c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l808_c32_f06d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d_left;
     BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d_return_output := BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l804_c7_8291] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l822_c24_b44b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l822_c24_b44b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l822_c34_52cf_return_output);

     -- BIN_OP_PLUS[uxn_opcodes_h_l824_c15_0175] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175_left;
     BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175_return_output := BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l826_c7_969e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l795_c1_2f5e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l826_c7_969e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l826_c7_969e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l826_c7_969e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_return_output;

     -- t8_MUX[uxn_opcodes_h_l804_c7_8291] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l804_c7_8291_cond <= VAR_t8_MUX_uxn_opcodes_h_l804_c7_8291_cond;
     t8_MUX_uxn_opcodes_h_l804_c7_8291_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l804_c7_8291_iftrue;
     t8_MUX_uxn_opcodes_h_l804_c7_8291_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l804_c7_8291_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l804_c7_8291_return_output := t8_MUX_uxn_opcodes_h_l804_c7_8291_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l814_c7_af2d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l808_c32_6c39_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l808_c32_f06d_return_output;
     VAR_result_pc_uxn_opcodes_h_l824_c3_cbc4 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l824_c15_0175_return_output)),16);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l822_c24_b44b_return_output;
     VAR_printf_uxn_opcodes_h_l796_c3_5a12_uxn_opcodes_h_l796_c3_5a12_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l795_c1_2f5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l826_c7_969e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l826_c7_969e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c7_af2d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l826_c7_969e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l804_c7_8291_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l826_c7_969e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l804_c7_8291_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue := VAR_result_pc_uxn_opcodes_h_l824_c3_cbc4;
     -- printf_uxn_opcodes_h_l796_c3_5a12[uxn_opcodes_h_l796_c3_5a12] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l796_c3_5a12_uxn_opcodes_h_l796_c3_5a12_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l796_c3_5a12_uxn_opcodes_h_l796_c3_5a12_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_pc_MUX[uxn_opcodes_h_l820_c7_e8b1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_cond;
     result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output := result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l820_c7_e8b1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output;

     -- t8_MUX[uxn_opcodes_h_l801_c7_9b5c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l801_c7_9b5c_cond <= VAR_t8_MUX_uxn_opcodes_h_l801_c7_9b5c_cond;
     t8_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue;
     t8_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output := t8_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l820_c7_e8b1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output := result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l820_c7_e8b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l820_c7_e8b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l814_c7_af2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l810_c7_ba3c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l820_c7_e8b1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l801_c7_9b5c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;

     -- MUX[uxn_opcodes_h_l808_c32_6c39] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l808_c32_6c39_cond <= VAR_MUX_uxn_opcodes_h_l808_c32_6c39_cond;
     MUX_uxn_opcodes_h_l808_c32_6c39_iftrue <= VAR_MUX_uxn_opcodes_h_l808_c32_6c39_iftrue;
     MUX_uxn_opcodes_h_l808_c32_6c39_iffalse <= VAR_MUX_uxn_opcodes_h_l808_c32_6c39_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l808_c32_6c39_return_output := MUX_uxn_opcodes_h_l808_c32_6c39_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_iftrue := VAR_MUX_uxn_opcodes_h_l808_c32_6c39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c7_af2d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l820_c7_e8b1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l795_c2_3586_iffalse := VAR_t8_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l814_c7_af2d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l810_c7_ba3c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l814_c7_af2d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l804_c7_8291] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l814_c7_af2d] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_cond;
     result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue;
     result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_return_output := result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l814_c7_af2d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l814_c7_af2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l795_c2_3586] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_return_output;

     -- t8_MUX[uxn_opcodes_h_l795_c2_3586] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l795_c2_3586_cond <= VAR_t8_MUX_uxn_opcodes_h_l795_c2_3586_cond;
     t8_MUX_uxn_opcodes_h_l795_c2_3586_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l795_c2_3586_iftrue;
     t8_MUX_uxn_opcodes_h_l795_c2_3586_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l795_c2_3586_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l795_c2_3586_return_output := t8_MUX_uxn_opcodes_h_l795_c2_3586_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l814_c7_af2d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_return_output := result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l804_c7_8291] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c7_af2d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c7_af2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l804_c7_8291_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c7_af2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c7_af2d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l814_c7_af2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l804_c7_8291_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c7_af2d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l795_c2_3586_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l810_c7_ba3c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l801_c7_9b5c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l810_c7_ba3c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l810_c7_ba3c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_cond;
     result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output := result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l810_c7_ba3c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l801_c7_9b5c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l810_c7_ba3c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l810_c7_ba3c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output := result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l804_c7_8291] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l804_c7_8291_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l804_c7_8291_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l810_c7_ba3c_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l804_c7_8291] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l804_c7_8291] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l804_c7_8291] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_cond;
     result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_return_output := result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l804_c7_8291] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l804_c7_8291_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l804_c7_8291_cond;
     result_pc_MUX_uxn_opcodes_h_l804_c7_8291_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l804_c7_8291_iftrue;
     result_pc_MUX_uxn_opcodes_h_l804_c7_8291_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l804_c7_8291_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l804_c7_8291_return_output := result_pc_MUX_uxn_opcodes_h_l804_c7_8291_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l795_c2_3586] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l804_c7_8291] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l804_c7_8291] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l801_c7_9b5c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l795_c2_3586] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l804_c7_8291_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l804_c7_8291_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l804_c7_8291_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l804_c7_8291_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l804_c7_8291_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l804_c7_8291_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l801_c7_9b5c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_cond;
     result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output := result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l795_c2_3586] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l801_c7_9b5c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output := result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l801_c7_9b5c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l801_c7_9b5c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l801_c7_9b5c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l801_c7_9b5c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l795_c2_3586_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l801_c7_9b5c_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l795_c2_3586] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l795_c2_3586_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l795_c2_3586_cond;
     result_pc_MUX_uxn_opcodes_h_l795_c2_3586_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l795_c2_3586_iftrue;
     result_pc_MUX_uxn_opcodes_h_l795_c2_3586_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l795_c2_3586_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l795_c2_3586_return_output := result_pc_MUX_uxn_opcodes_h_l795_c2_3586_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l795_c2_3586] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l795_c2_3586] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l795_c2_3586] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l795_c2_3586] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_cond;
     result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_return_output := result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l795_c2_3586] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4929_uxn_opcodes_h_l833_l791_DUPLICATE_b8cd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4929_uxn_opcodes_h_l833_l791_DUPLICATE_b8cd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4929(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c2_3586_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c2_3586_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c2_3586_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c2_3586_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c2_3586_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c2_3586_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l795_c2_3586_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c2_3586_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c2_3586_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c2_3586_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4929_uxn_opcodes_h_l833_l791_DUPLICATE_b8cd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4929_uxn_opcodes_h_l833_l791_DUPLICATE_b8cd_return_output;
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
