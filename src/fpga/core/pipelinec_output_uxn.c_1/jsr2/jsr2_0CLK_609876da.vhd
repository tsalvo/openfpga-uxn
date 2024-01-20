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
-- Submodules: 57
entity jsr2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr2_0CLK_609876da;
architecture arch of jsr2_0CLK_609876da is
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
-- BIN_OP_EQ[uxn_opcodes_h_l773_c6_cc10]
signal BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l773_c2_9376]
signal t16_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l773_c2_9376]
signal result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l773_c2_9376]
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l773_c2_9376]
signal result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l773_c2_9376]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l773_c2_9376]
signal result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l773_c2_9376]
signal result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l773_c2_9376]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l773_c2_9376]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l773_c2_9376]
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l773_c2_9376]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l786_c11_0e1c]
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l786_c7_160a]
signal t16_MUX_uxn_opcodes_h_l786_c7_160a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l786_c7_160a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l786_c7_160a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l786_c7_160a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l786_c7_160a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l786_c7_160a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l786_c7_160a]
signal result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l786_c7_160a]
signal result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l786_c7_160a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l786_c7_160a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l786_c7_160a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l786_c7_160a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l789_c11_002f]
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l789_c7_0ce4]
signal t16_MUX_uxn_opcodes_h_l789_c7_0ce4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l789_c7_0ce4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l789_c7_0ce4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l789_c7_0ce4]
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l789_c7_0ce4]
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l789_c7_0ce4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l789_c7_0ce4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l789_c7_0ce4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c7_0ce4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l791_c3_c9cb]
signal CONST_SL_8_uxn_opcodes_h_l791_c3_c9cb_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l791_c3_c9cb_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l792_c30_d599]
signal sp_relative_shift_uxn_opcodes_h_l792_c30_d599_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l792_c30_d599_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l792_c30_d599_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l792_c30_d599_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l794_c11_14bf]
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l794_c7_ea42]
signal t16_MUX_uxn_opcodes_h_l794_c7_ea42_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l794_c7_ea42_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_ea42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l794_c7_ea42]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l794_c7_ea42]
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l794_c7_ea42]
signal result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l794_c7_ea42]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l794_c7_ea42]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_ea42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l794_c7_ea42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l795_c3_6fdb]
signal BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l802_c11_7200]
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l802_c7_9d1b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l802_c7_9d1b]
signal result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l802_c7_9d1b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l802_c7_9d1b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l802_c7_9d1b]
signal result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l802_c7_9d1b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l805_c31_972d]
signal CONST_SR_8_uxn_opcodes_h_l805_c31_972d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l805_c31_972d_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_6145( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;
      base.stack_address_sp_offset := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10
BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_left,
BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_right,
BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_return_output);

-- t16_MUX_uxn_opcodes_h_l773_c2_9376
t16_MUX_uxn_opcodes_h_l773_c2_9376 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l773_c2_9376_cond,
t16_MUX_uxn_opcodes_h_l773_c2_9376_iftrue,
t16_MUX_uxn_opcodes_h_l773_c2_9376_iffalse,
t16_MUX_uxn_opcodes_h_l773_c2_9376_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376
result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_cond,
result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376
result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_cond,
result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c
BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_left,
BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_right,
BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_return_output);

-- t16_MUX_uxn_opcodes_h_l786_c7_160a
t16_MUX_uxn_opcodes_h_l786_c7_160a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l786_c7_160a_cond,
t16_MUX_uxn_opcodes_h_l786_c7_160a_iftrue,
t16_MUX_uxn_opcodes_h_l786_c7_160a_iffalse,
t16_MUX_uxn_opcodes_h_l786_c7_160a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a
result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_cond,
result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a
result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_cond,
result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f
BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_left,
BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_right,
BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_return_output);

-- t16_MUX_uxn_opcodes_h_l789_c7_0ce4
t16_MUX_uxn_opcodes_h_l789_c7_0ce4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l789_c7_0ce4_cond,
t16_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue,
t16_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse,
t16_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4
result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_cond,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4
result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_cond,
result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output);

-- CONST_SL_8_uxn_opcodes_h_l791_c3_c9cb
CONST_SL_8_uxn_opcodes_h_l791_c3_c9cb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l791_c3_c9cb_x,
CONST_SL_8_uxn_opcodes_h_l791_c3_c9cb_return_output);

-- sp_relative_shift_uxn_opcodes_h_l792_c30_d599
sp_relative_shift_uxn_opcodes_h_l792_c30_d599 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l792_c30_d599_ins,
sp_relative_shift_uxn_opcodes_h_l792_c30_d599_x,
sp_relative_shift_uxn_opcodes_h_l792_c30_d599_y,
sp_relative_shift_uxn_opcodes_h_l792_c30_d599_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf
BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_left,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_right,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_return_output);

-- t16_MUX_uxn_opcodes_h_l794_c7_ea42
t16_MUX_uxn_opcodes_h_l794_c7_ea42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l794_c7_ea42_cond,
t16_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue,
t16_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse,
t16_MUX_uxn_opcodes_h_l794_c7_ea42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42
result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_cond,
result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42
result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_cond,
result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb
BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb_left,
BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb_right,
BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200
BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_left,
BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_right,
BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b
result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_cond,
result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b
result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_cond,
result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l805_c31_972d
CONST_SR_8_uxn_opcodes_h_l805_c31_972d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l805_c31_972d_x,
CONST_SR_8_uxn_opcodes_h_l805_c31_972d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_return_output,
 t16_MUX_uxn_opcodes_h_l773_c2_9376_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_return_output,
 t16_MUX_uxn_opcodes_h_l786_c7_160a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_return_output,
 t16_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output,
 CONST_SL_8_uxn_opcodes_h_l791_c3_c9cb_return_output,
 sp_relative_shift_uxn_opcodes_h_l792_c30_d599_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_return_output,
 t16_MUX_uxn_opcodes_h_l794_c7_ea42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_return_output,
 BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output,
 CONST_SR_8_uxn_opcodes_h_l805_c31_972d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_160a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l778_c3_d861 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l783_c3_1ac9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_160a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_160a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_160a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l787_c3_08b3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_ea42_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l789_c7_0ce4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_c9cb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_c9cb_x : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_d599_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_d599_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_d599_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_d599_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_ea42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l797_c3_6232 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_20d8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l800_c21_4f5d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l803_c3_659f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_f88e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_972d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_972d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l805_c21_d92a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_faea_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l802_l794_l789_l786_l773_DUPLICATE_6a79_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_f2c8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_f27b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_ecfc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l802_l786_DUPLICATE_80aa_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5440_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_b066_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l802_l789_DUPLICATE_09dc_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l769_l811_DUPLICATE_82b4_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l778_c3_d861 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l778_c3_d861;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l797_c3_6232 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l797_c3_6232;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l803_c3_659f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l803_c3_659f;
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_d599_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_f88e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_f88e;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_20d8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_20d8;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_d599_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l783_c3_1ac9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l783_c3_1ac9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l787_c3_08b3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l787_c3_08b3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_d599_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_972d_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l773_c2_9376_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_160a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_f27b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_f27b_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l789_c11_002f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_left;
     BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_return_output := BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_ecfc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_ecfc_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l794_c11_14bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_b066 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_b066_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l805_c31_972d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l805_c31_972d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_972d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_972d_return_output := CONST_SR_8_uxn_opcodes_h_l805_c31_972d_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l773_c2_9376] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l773_c2_9376_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l802_c11_7200] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_left;
     BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_return_output := BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5440 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5440_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l802_l794_l789_l786_l773_DUPLICATE_6a79 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l802_l794_l789_l786_l773_DUPLICATE_6a79_return_output := result.u16_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l802_l789_DUPLICATE_09dc LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l802_l789_DUPLICATE_09dc_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l800_c21_4f5d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l800_c21_4f5d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- BIN_OP_EQ[uxn_opcodes_h_l773_c6_cc10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_left;
     BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_return_output := BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l786_c11_0e1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l802_l786_DUPLICATE_80aa LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l802_l786_DUPLICATE_80aa_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l792_c30_d599] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l792_c30_d599_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_d599_ins;
     sp_relative_shift_uxn_opcodes_h_l792_c30_d599_x <= VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_d599_x;
     sp_relative_shift_uxn_opcodes_h_l792_c30_d599_y <= VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_d599_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_d599_return_output := sp_relative_shift_uxn_opcodes_h_l792_c30_d599_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_f2c8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_f2c8_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_faea LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_faea_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l773_c2_9376] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l773_c2_9376_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l773_c2_9376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_cc10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_160a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_0e1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l789_c7_0ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_002f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_ea42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_14bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_7200_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_b066_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_c9cb_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_b066_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l800_c21_4f5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l802_l786_DUPLICATE_80aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l802_l786_DUPLICATE_80aa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l802_l794_l789_l786_l773_DUPLICATE_6a79_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l802_l794_l789_l786_l773_DUPLICATE_6a79_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l802_l794_l789_l786_l773_DUPLICATE_6a79_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l802_l794_l789_l786_l773_DUPLICATE_6a79_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l802_l794_l789_l786_l773_DUPLICATE_6a79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5440_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5440_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5440_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_5440_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_f27b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_f27b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_f27b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l802_l789_l794_l786_DUPLICATE_f27b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_ecfc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_ecfc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_ecfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_f2c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_f2c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l789_l794_l786_DUPLICATE_f2c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l802_l789_DUPLICATE_09dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l802_l789_DUPLICATE_09dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_faea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_faea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_faea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l802_l789_l773_l786_DUPLICATE_faea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l773_c2_9376_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l773_c2_9376_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_d599_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l795_c3_6fdb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb_left;
     BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb_return_output := BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_ea42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l802_c7_9d1b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l773_c2_9376] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l773_c2_9376] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l794_c7_ea42] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l791_c3_c9cb] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l791_c3_c9cb_x <= VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_c9cb_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_c9cb_return_output := CONST_SL_8_uxn_opcodes_h_l791_c3_c9cb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l805_c21_d92a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l805_c21_d92a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_972d_return_output);

     -- result_u16_value_MUX[uxn_opcodes_h_l802_c7_9d1b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output := result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l802_c7_9d1b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l802_c7_9d1b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l802_c7_9d1b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_6fdb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l805_c21_d92a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_c9cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_ea42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_ea42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l802_c7_9d1b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output := result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l789_c7_0ce4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l794_c7_ea42] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l794_c7_ea42] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_cond;
     result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_return_output := result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l789_c7_0ce4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_ea42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l794_c7_ea42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_return_output;

     -- t16_MUX[uxn_opcodes_h_l794_c7_ea42] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l794_c7_ea42_cond <= VAR_t16_MUX_uxn_opcodes_h_l794_c7_ea42_cond;
     t16_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue;
     t16_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_ea42_return_output := t16_MUX_uxn_opcodes_h_l794_c7_ea42_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l794_c7_ea42] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_ea42_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_ea42_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_ea42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_ea42_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_ea42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d1b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l794_c7_ea42_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l786_c7_160a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l789_c7_0ce4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output := result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l789_c7_0ce4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l789_c7_0ce4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output;

     -- t16_MUX[uxn_opcodes_h_l789_c7_0ce4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l789_c7_0ce4_cond <= VAR_t16_MUX_uxn_opcodes_h_l789_c7_0ce4_cond;
     t16_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue;
     t16_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output := t16_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l786_c7_160a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l789_c7_0ce4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l794_c7_ea42] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_cond;
     result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_return_output := result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c7_0ce4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_160a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_160a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_ea42_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_160a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l786_c7_160a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l773_c2_9376] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l786_c7_160a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l789_c7_0ce4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output := result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output;

     -- t16_MUX[uxn_opcodes_h_l786_c7_160a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l786_c7_160a_cond <= VAR_t16_MUX_uxn_opcodes_h_l786_c7_160a_cond;
     t16_MUX_uxn_opcodes_h_l786_c7_160a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l786_c7_160a_iftrue;
     t16_MUX_uxn_opcodes_h_l786_c7_160a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l786_c7_160a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_160a_return_output := t16_MUX_uxn_opcodes_h_l786_c7_160a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l786_c7_160a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l773_c2_9376] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l786_c7_160a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l786_c7_160a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_return_output := result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_160a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_160a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_160a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_160a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_160a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_0ce4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l773_c2_9376_iffalse := VAR_t16_MUX_uxn_opcodes_h_l786_c7_160a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l773_c2_9376] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l773_c2_9376] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l773_c2_9376] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_cond;
     result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_return_output := result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l773_c2_9376] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l773_c2_9376] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l786_c7_160a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_return_output := result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_return_output;

     -- t16_MUX[uxn_opcodes_h_l773_c2_9376] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l773_c2_9376_cond <= VAR_t16_MUX_uxn_opcodes_h_l773_c2_9376_cond;
     t16_MUX_uxn_opcodes_h_l773_c2_9376_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l773_c2_9376_iftrue;
     t16_MUX_uxn_opcodes_h_l773_c2_9376_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l773_c2_9376_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l773_c2_9376_return_output := t16_MUX_uxn_opcodes_h_l773_c2_9376_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_160a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l773_c2_9376_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l773_c2_9376] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_cond;
     result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_return_output := result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l769_l811_DUPLICATE_82b4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l769_l811_DUPLICATE_82b4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6145(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_9376_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_9376_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_9376_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_9376_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_9376_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_9376_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_9376_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_9376_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l769_l811_DUPLICATE_82b4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l769_l811_DUPLICATE_82b4_return_output;
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
