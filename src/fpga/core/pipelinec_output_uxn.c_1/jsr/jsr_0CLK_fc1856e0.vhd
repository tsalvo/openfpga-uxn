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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 64
entity jsr_0CLK_fc1856e0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr_0CLK_fc1856e0;
architecture arch of jsr_0CLK_fc1856e0 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l767_c6_86c3]
signal BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l767_c2_e6f2]
signal t8_MUX_uxn_opcodes_h_l767_c2_e6f2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l767_c2_e6f2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l767_c2_e6f2]
signal result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l767_c2_e6f2]
signal result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l767_c2_e6f2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l767_c2_e6f2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l767_c2_e6f2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l767_c2_e6f2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l767_c2_e6f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l767_c2_e6f2]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l772_c11_17f1]
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l772_c7_26e2]
signal t8_MUX_uxn_opcodes_h_l772_c7_26e2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l772_c7_26e2_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l772_c7_26e2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l772_c7_26e2]
signal result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l772_c7_26e2]
signal result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l772_c7_26e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l772_c7_26e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l772_c7_26e2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l772_c7_26e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l772_c7_26e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l772_c7_26e2]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l775_c11_860d]
signal BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l775_c7_6180]
signal t8_MUX_uxn_opcodes_h_l775_c7_6180_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l775_c7_6180_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l775_c7_6180_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l775_c7_6180_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l775_c7_6180]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l775_c7_6180]
signal result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l775_c7_6180]
signal result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l775_c7_6180]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l775_c7_6180]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l775_c7_6180]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l775_c7_6180]
signal result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l775_c7_6180]
signal result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l775_c7_6180]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l778_c30_fad2]
signal sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l780_c11_9ca0]
signal BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l780_c7_aaef]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l780_c7_aaef]
signal result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l780_c7_aaef]
signal result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l780_c7_aaef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l780_c7_aaef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l780_c7_aaef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l780_c7_aaef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l780_c7_aaef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l780_c7_aaef]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l787_c11_f896]
signal BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l787_c7_f70d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l787_c7_f70d]
signal result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l787_c7_f70d]
signal result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l787_c7_f70d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l787_c7_f70d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l787_c7_f70d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l787_c7_f70d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l787_c7_f70d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l790_c31_7678]
signal CONST_SR_8_uxn_opcodes_h_l790_c31_7678_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l790_c31_7678_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l792_c22_6b13]
signal BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l794_c11_0491]
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l794_c7_fdec]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_fdec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l794_c7_fdec]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_fdec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_b465( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3
BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_left,
BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_right,
BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_return_output);

-- t8_MUX_uxn_opcodes_h_l767_c2_e6f2
t8_MUX_uxn_opcodes_h_l767_c2_e6f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l767_c2_e6f2_cond,
t8_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue,
t8_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse,
t8_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2
result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2
result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_cond,
result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2
result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_cond,
result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2
result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2
result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2
result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2
result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1
BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_left,
BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_right,
BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_return_output);

-- t8_MUX_uxn_opcodes_h_l772_c7_26e2
t8_MUX_uxn_opcodes_h_l772_c7_26e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l772_c7_26e2_cond,
t8_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue,
t8_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse,
t8_MUX_uxn_opcodes_h_l772_c7_26e2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2
result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2
result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2
result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_cond,
result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2
result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d
BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_left,
BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_right,
BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_return_output);

-- t8_MUX_uxn_opcodes_h_l775_c7_6180
t8_MUX_uxn_opcodes_h_l775_c7_6180 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l775_c7_6180_cond,
t8_MUX_uxn_opcodes_h_l775_c7_6180_iftrue,
t8_MUX_uxn_opcodes_h_l775_c7_6180_iffalse,
t8_MUX_uxn_opcodes_h_l775_c7_6180_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180
result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180
result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_cond,
result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180
result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_cond,
result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180
result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180
result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180
result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180
result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_return_output);

-- sp_relative_shift_uxn_opcodes_h_l778_c30_fad2
sp_relative_shift_uxn_opcodes_h_l778_c30_fad2 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_ins,
sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_x,
sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_y,
sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0
BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_left,
BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_right,
BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef
result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef
result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_cond,
result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef
result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_cond,
result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef
result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef
result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef
result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef
result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896
BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_left,
BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_right,
BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d
result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_cond,
result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d
result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_cond,
result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d
result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l790_c31_7678
CONST_SR_8_uxn_opcodes_h_l790_c31_7678 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l790_c31_7678_x,
CONST_SR_8_uxn_opcodes_h_l790_c31_7678_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13
BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13_left,
BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13_right,
BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491
BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_left,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_right,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_return_output,
 t8_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_return_output,
 t8_MUX_uxn_opcodes_h_l772_c7_26e2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_return_output,
 t8_MUX_uxn_opcodes_h_l775_c7_6180_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_return_output,
 sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_return_output,
 CONST_SR_8_uxn_opcodes_h_l790_c31_7678_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l772_c7_26e2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l767_c2_e6f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_da0e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l775_c7_6180_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l772_c7_26e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l773_c3_0beb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l775_c7_6180_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l775_c7_6180_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l775_c7_6180_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_5772 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l782_c3_78be : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l785_c21_bd7b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l792_c3_b099 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l789_c3_b681 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l790_c31_7678_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l790_c31_7678_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l790_c21_a4b9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l792_c27_d96e_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l767_l775_l794_l780_l772_DUPLICATE_b5eb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l767_l772_l775_DUPLICATE_6c8e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l767_l775_l787_l780_l772_DUPLICATE_7ed0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l780_l767_l772_DUPLICATE_8734_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l780_l767_l772_l787_DUPLICATE_41ae_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l767_l775_l787_l794_l772_DUPLICATE_cf48_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l767_l775_l787_l794_l772_DUPLICATE_2d08_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l775_l787_l794_l780_l772_DUPLICATE_5bca_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l787_l775_DUPLICATE_259e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b465_uxn_opcodes_h_l801_l763_DUPLICATE_57bb_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l789_c3_b681 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l789_c3_b681;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l773_c3_0beb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l773_c3_0beb;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l782_c3_78be := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l782_c3_78be;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_da0e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l769_c3_da0e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_5772 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_5772;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_CONST_SR_8_uxn_opcodes_h_l790_c31_7678_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l775_c7_6180_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l775_c7_6180_iffalse := t8;
     -- CAST_TO_int8_t[uxn_opcodes_h_l792_c27_d96e] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l792_c27_d96e_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- sp_relative_shift[uxn_opcodes_h_l778_c30_fad2] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_ins;
     sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_x <= VAR_sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_x;
     sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_y <= VAR_sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_return_output := sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l794_c11_0491] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_left;
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_return_output := BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l790_c31_7678] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l790_c31_7678_x <= VAR_CONST_SR_8_uxn_opcodes_h_l790_c31_7678_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l790_c31_7678_return_output := CONST_SR_8_uxn_opcodes_h_l790_c31_7678_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l772_c11_17f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l767_c6_86c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l775_c11_860d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_left;
     BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_return_output := BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l780_l767_l772_l787_DUPLICATE_41ae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l780_l767_l772_l787_DUPLICATE_41ae_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l767_l775_l794_l780_l772_DUPLICATE_b5eb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l767_l775_l794_l780_l772_DUPLICATE_b5eb_return_output := result.is_pc_updated;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l785_c21_bd7b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l785_c21_bd7b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- BIN_OP_EQ[uxn_opcodes_h_l787_c11_f896] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_left;
     BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_return_output := BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l787_l775_DUPLICATE_259e LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l787_l775_DUPLICATE_259e_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l767_l775_l787_l794_l772_DUPLICATE_2d08 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l767_l775_l787_l794_l772_DUPLICATE_2d08_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l767_l775_l787_l794_l772_DUPLICATE_cf48 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l767_l775_l787_l794_l772_DUPLICATE_cf48_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l767_l775_l787_l780_l772_DUPLICATE_7ed0 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l767_l775_l787_l780_l772_DUPLICATE_7ed0_return_output := result.u16_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l780_l767_l772_DUPLICATE_8734 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l780_l767_l772_DUPLICATE_8734_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l767_l772_l775_DUPLICATE_6c8e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l767_l772_l775_DUPLICATE_6c8e_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l775_l787_l794_l780_l772_DUPLICATE_5bca LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l775_l787_l794_l780_l772_DUPLICATE_5bca_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l780_c11_9ca0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_left;
     BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_return_output := BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l767_c2_e6f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c6_86c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l772_c7_26e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_17f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l775_c7_6180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l775_c11_860d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l780_c11_9ca0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_f896_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_0491_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l792_c27_d96e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l785_c21_bd7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l780_l767_l772_DUPLICATE_8734_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l780_l767_l772_DUPLICATE_8734_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l780_l767_l772_DUPLICATE_8734_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l767_l775_l787_l780_l772_DUPLICATE_7ed0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l767_l775_l787_l780_l772_DUPLICATE_7ed0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l767_l775_l787_l780_l772_DUPLICATE_7ed0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l767_l775_l787_l780_l772_DUPLICATE_7ed0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l767_l775_l787_l780_l772_DUPLICATE_7ed0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l775_l787_l794_l780_l772_DUPLICATE_5bca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l775_l787_l794_l780_l772_DUPLICATE_5bca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l775_l787_l794_l780_l772_DUPLICATE_5bca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l775_l787_l794_l780_l772_DUPLICATE_5bca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l775_l787_l794_l780_l772_DUPLICATE_5bca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l767_l775_l794_l780_l772_DUPLICATE_b5eb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l767_l775_l794_l780_l772_DUPLICATE_b5eb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l767_l775_l794_l780_l772_DUPLICATE_b5eb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l767_l775_l794_l780_l772_DUPLICATE_b5eb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l767_l775_l794_l780_l772_DUPLICATE_b5eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l780_l767_l772_l787_DUPLICATE_41ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l780_l767_l772_l787_DUPLICATE_41ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l780_l767_l772_l787_DUPLICATE_41ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l780_l767_l772_l787_DUPLICATE_41ae_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l767_l775_l787_l794_l772_DUPLICATE_2d08_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l767_l775_l787_l794_l772_DUPLICATE_2d08_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l767_l775_l787_l794_l772_DUPLICATE_2d08_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l767_l775_l787_l794_l772_DUPLICATE_2d08_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l767_l775_l787_l794_l772_DUPLICATE_2d08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l767_l775_l787_l794_l772_DUPLICATE_cf48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l767_l775_l787_l794_l772_DUPLICATE_cf48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l767_l775_l787_l794_l772_DUPLICATE_cf48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l767_l775_l787_l794_l772_DUPLICATE_cf48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l767_l775_l787_l794_l772_DUPLICATE_cf48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l787_l775_DUPLICATE_259e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l787_l775_DUPLICATE_259e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l767_l772_l775_DUPLICATE_6c8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l767_l772_l775_DUPLICATE_6c8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l767_l772_l775_DUPLICATE_6c8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l767_l772_l775_DUPLICATE_6c8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l778_c30_fad2_return_output;
     -- t8_MUX[uxn_opcodes_h_l775_c7_6180] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l775_c7_6180_cond <= VAR_t8_MUX_uxn_opcodes_h_l775_c7_6180_cond;
     t8_MUX_uxn_opcodes_h_l775_c7_6180_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l775_c7_6180_iftrue;
     t8_MUX_uxn_opcodes_h_l775_c7_6180_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l775_c7_6180_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l775_c7_6180_return_output := t8_MUX_uxn_opcodes_h_l775_c7_6180_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l794_c7_fdec] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_fdec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l794_c7_fdec] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l780_c7_aaef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l792_c22_6b13] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13_left;
     BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13_return_output := BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_fdec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l787_c7_f70d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l790_c21_a4b9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l790_c21_a4b9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l790_c31_7678_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l787_c7_f70d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l792_c3_b099 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l792_c22_6b13_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l790_c21_a4b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_fdec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_fdec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l787_c7_f70d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_fdec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_fdec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l780_c7_aaef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_f70d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l775_c7_6180_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue := VAR_result_u16_value_uxn_opcodes_h_l792_c3_b099;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l775_c7_6180] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_return_output;

     -- t8_MUX[uxn_opcodes_h_l772_c7_26e2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l772_c7_26e2_cond <= VAR_t8_MUX_uxn_opcodes_h_l772_c7_26e2_cond;
     t8_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue;
     t8_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l772_c7_26e2_return_output := t8_MUX_uxn_opcodes_h_l772_c7_26e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l787_c7_f70d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l787_c7_f70d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l780_c7_aaef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l787_c7_f70d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_return_output := result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l787_c7_f70d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l787_c7_f70d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l787_c7_f70d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_return_output := result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l780_c7_aaef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_f70d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_f70d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l780_c7_aaef_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_f70d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_f70d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l775_c7_6180_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l780_c7_aaef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_f70d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_f70d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l772_c7_26e2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l780_c7_aaef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_return_output := result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l775_c7_6180] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l772_c7_26e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l775_c7_6180] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l780_c7_aaef] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l780_c7_aaef] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_cond;
     result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_return_output := result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l780_c7_aaef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_return_output;

     -- t8_MUX[uxn_opcodes_h_l767_c2_e6f2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l767_c2_e6f2_cond <= VAR_t8_MUX_uxn_opcodes_h_l767_c2_e6f2_cond;
     t8_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue;
     t8_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output := t8_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l780_c7_aaef] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l780_c7_aaef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l780_c7_aaef_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l780_c7_aaef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l775_c7_6180_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l780_c7_aaef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l780_c7_aaef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_26e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l775_c7_6180_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l780_c7_aaef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l780_c7_aaef_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l767_c2_e6f2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l775_c7_6180] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l775_c7_6180] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_cond;
     result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_return_output := result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l775_c7_6180] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_cond;
     result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_return_output := result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l772_c7_26e2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l775_c7_6180] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l775_c7_6180] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l772_c7_26e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l775_c7_6180] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l775_c7_6180_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l775_c7_6180_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_26e2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l775_c7_6180_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l775_c7_6180_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_26e2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l775_c7_6180_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l775_c7_6180_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l767_c2_e6f2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l772_c7_26e2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_return_output := result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l772_c7_26e2] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l772_c7_26e2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l767_c2_e6f2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l772_c7_26e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l772_c7_26e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l772_c7_26e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_26e2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_26e2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_26e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_26e2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_26e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_26e2_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l767_c2_e6f2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output := result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l767_c2_e6f2] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l767_c2_e6f2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l767_c2_e6f2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l767_c2_e6f2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output := result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l767_c2_e6f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b465_uxn_opcodes_h_l801_l763_DUPLICATE_57bb LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b465_uxn_opcodes_h_l801_l763_DUPLICATE_57bb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b465(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l767_c2_e6f2_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b465_uxn_opcodes_h_l801_l763_DUPLICATE_57bb_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b465_uxn_opcodes_h_l801_l763_DUPLICATE_57bb_return_output;
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
