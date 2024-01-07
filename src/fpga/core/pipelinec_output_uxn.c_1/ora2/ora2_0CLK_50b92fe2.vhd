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
-- Submodules: 71
entity ora2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_50b92fe2;
architecture arch of ora2_0CLK_50b92fe2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1025_c6_de90]
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1025_c2_2760]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1025_c2_2760]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1025_c2_2760]
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1025_c2_2760]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1025_c2_2760]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1025_c2_2760]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1025_c2_2760]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1025_c2_2760]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1025_c2_2760]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1025_c2_2760]
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1025_c2_2760]
signal t16_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1025_c2_2760]
signal n16_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_dc0d]
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1038_c7_09d3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1038_c7_09d3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1038_c7_09d3]
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1038_c7_09d3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1038_c7_09d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1038_c7_09d3]
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1038_c7_09d3]
signal t16_MUX_uxn_opcodes_h_l1038_c7_09d3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1038_c7_09d3]
signal n16_MUX_uxn_opcodes_h_l1038_c7_09d3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_54a7]
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1041_c7_c0f2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1041_c7_c0f2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1041_c7_c0f2]
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1041_c7_c0f2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1041_c7_c0f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1041_c7_c0f2]
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1041_c7_c0f2]
signal t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1041_c7_c0f2]
signal n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_474a]
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1046_c7_9b9e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1046_c7_9b9e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1046_c7_9b9e]
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1046_c7_9b9e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1046_c7_9b9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1046_c7_9b9e]
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1046_c7_9b9e]
signal t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1046_c7_9b9e]
signal n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1047_c3_6b66]
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_2ffa]
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1050_c7_cc0a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1050_c7_cc0a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1050_c7_cc0a]
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1050_c7_cc0a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1050_c7_cc0a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1050_c7_cc0a]
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1050_c7_cc0a]
signal n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_7db3]
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1054_c7_d26c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1054_c7_d26c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1054_c7_d26c]
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1054_c7_d26c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1054_c7_d26c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1054_c7_d26c]
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1054_c7_d26c]
signal n16_MUX_uxn_opcodes_h_l1054_c7_d26c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1055_c3_0940]
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1056_c11_0980]
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1057_c30_13f1]
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_3742]
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1062_c7_6815]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1062_c7_6815]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1062_c7_6815]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1062_c7_6815]
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1065_c31_c5ae]
signal CONST_SR_8_uxn_opcodes_h_l1065_c31_c5ae_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1065_c31_c5ae_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_9c27
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_9c27_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_9c27_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6( ref_toks_0 : opcode_result_t;
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
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_left,
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_right,
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_cond,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1025_c2_2760
tmp16_MUX_uxn_opcodes_h_l1025_c2_2760 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_cond,
tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue,
tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse,
tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output);

-- t16_MUX_uxn_opcodes_h_l1025_c2_2760
t16_MUX_uxn_opcodes_h_l1025_c2_2760 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1025_c2_2760_cond,
t16_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue,
t16_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse,
t16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output);

-- n16_MUX_uxn_opcodes_h_l1025_c2_2760
n16_MUX_uxn_opcodes_h_l1025_c2_2760 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1025_c2_2760_cond,
n16_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue,
n16_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse,
n16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_left,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_right,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3
tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_cond,
tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output);

-- t16_MUX_uxn_opcodes_h_l1038_c7_09d3
t16_MUX_uxn_opcodes_h_l1038_c7_09d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1038_c7_09d3_cond,
t16_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue,
t16_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse,
t16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output);

-- n16_MUX_uxn_opcodes_h_l1038_c7_09d3
n16_MUX_uxn_opcodes_h_l1038_c7_09d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1038_c7_09d3_cond,
n16_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue,
n16_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse,
n16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_left,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_right,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2
tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond,
tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output);

-- t16_MUX_uxn_opcodes_h_l1041_c7_c0f2
t16_MUX_uxn_opcodes_h_l1041_c7_c0f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond,
t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue,
t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse,
t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output);

-- n16_MUX_uxn_opcodes_h_l1041_c7_c0f2
n16_MUX_uxn_opcodes_h_l1041_c7_c0f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond,
n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue,
n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse,
n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_left,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_right,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e
tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond,
tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output);

-- t16_MUX_uxn_opcodes_h_l1046_c7_9b9e
t16_MUX_uxn_opcodes_h_l1046_c7_9b9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond,
t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue,
t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse,
t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output);

-- n16_MUX_uxn_opcodes_h_l1046_c7_9b9e
n16_MUX_uxn_opcodes_h_l1046_c7_9b9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond,
n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue,
n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse,
n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66
BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66_left,
BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66_right,
BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_left,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_right,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a
tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond,
tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output);

-- n16_MUX_uxn_opcodes_h_l1050_c7_cc0a
n16_MUX_uxn_opcodes_h_l1050_c7_cc0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond,
n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue,
n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse,
n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_left,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_right,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c
tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_cond,
tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output);

-- n16_MUX_uxn_opcodes_h_l1054_c7_d26c
n16_MUX_uxn_opcodes_h_l1054_c7_d26c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1054_c7_d26c_cond,
n16_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue,
n16_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse,
n16_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940
BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940_left,
BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940_right,
BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980
BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980_left,
BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980_right,
BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1
sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_ins,
sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_x,
sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_y,
sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_left,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_right,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_cond,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1065_c31_c5ae
CONST_SR_8_uxn_opcodes_h_l1065_c31_c5ae : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1065_c31_c5ae_x,
CONST_SR_8_uxn_opcodes_h_l1065_c31_c5ae_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_9c27
CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_9c27 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_9c27_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_9c27_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_return_output,
 tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output,
 t16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output,
 n16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output,
 t16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output,
 n16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output,
 t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output,
 n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output,
 t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output,
 n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output,
 n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output,
 n16_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980_return_output,
 sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_return_output,
 CONST_SR_8_uxn_opcodes_h_l1065_c31_c5ae_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_9c27_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_1131 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_9ffd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_2760_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_93b0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_09d3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_09d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_eb18 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_9730 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_ee4b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d26c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_63d4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_46c6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_d3aa : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_c5ae_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_c5ae_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_9ea1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1025_l1062_DUPLICATE_eb3f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1062_DUPLICATE_7f02_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_DUPLICATE_f0a0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_l1062_DUPLICATE_39f2_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1042_l1051_l1047_l1055_DUPLICATE_1fd2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_9c27_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_9c27_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_8d54_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1021_l1069_DUPLICATE_070e_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_46c6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_46c6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_eb18 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_eb18;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_ee4b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_ee4b;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_y := resize(to_signed(-2, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_1131 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_1131;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_9ffd := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_9ffd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_9730 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_9730;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_d3aa := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_d3aa;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_93b0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_93b0;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_c5ae_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l1065_c31_c5ae] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1065_c31_c5ae_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_c5ae_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_c5ae_return_output := CONST_SR_8_uxn_opcodes_h_l1065_c31_c5ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1025_c6_de90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_left;
     BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_return_output := BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1042_l1051_l1047_l1055_DUPLICATE_1fd2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1042_l1051_l1047_l1055_DUPLICATE_1fd2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_474a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_3742] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_left;
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_return_output := BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1025_c2_2760] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_2760_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_dc0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_2ffa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1025_c2_2760] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_2760_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_7db3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1025_c2_2760] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_2760_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_DUPLICATE_f0a0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_DUPLICATE_f0a0_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_8d54 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_8d54_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1025_c2_2760] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_2760_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_l1062_DUPLICATE_39f2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_l1062_DUPLICATE_39f2_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1025_l1062_DUPLICATE_eb3f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1025_l1062_DUPLICATE_eb3f_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_54a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1057_c30_13f1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_ins;
     sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_x;
     sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_return_output := sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1062_DUPLICATE_7f02 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1062_DUPLICATE_7f02_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_2760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_2760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_de90_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_09d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_09d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_dc0d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_54a7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_474a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_2ffa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_7db3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_3742_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1042_l1051_l1047_l1055_DUPLICATE_1fd2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1042_l1051_l1047_l1055_DUPLICATE_1fd2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_9c27_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1042_l1051_l1047_l1055_DUPLICATE_1fd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1062_DUPLICATE_7f02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1062_DUPLICATE_7f02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1062_DUPLICATE_7f02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1062_DUPLICATE_7f02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1062_DUPLICATE_7f02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_l1062_DUPLICATE_39f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_l1062_DUPLICATE_39f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_l1062_DUPLICATE_39f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_l1062_DUPLICATE_39f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_l1062_DUPLICATE_39f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_l1062_DUPLICATE_39f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_DUPLICATE_f0a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_DUPLICATE_f0a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_DUPLICATE_f0a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_DUPLICATE_f0a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_DUPLICATE_f0a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_8d54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_8d54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1025_l1062_DUPLICATE_eb3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1025_l1062_DUPLICATE_eb3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1025_l1062_DUPLICATE_eb3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1025_l1062_DUPLICATE_eb3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1025_l1062_DUPLICATE_eb3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1025_l1062_DUPLICATE_eb3f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_2760_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_2760_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_2760_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_2760_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_13f1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1054_c7_d26c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1025_c2_2760] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1025_c2_2760] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1062_c7_6815] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1025_c2_2760] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1047_c3_6b66] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66_left;
     BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66_return_output := BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1065_c21_9ea1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_9ea1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_c5ae_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1062_c7_6815] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1025_c2_2760] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1062_c7_6815] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1055_c3_0940] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940_left;
     BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940_return_output := BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_9c27 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_9c27_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_9c27_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_9c27_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_9c27_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_6b66_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0940_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_9ea1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_9c27_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_9c27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_6815_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_6815_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_6815_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1056_c11_0980] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980_left;
     BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980_return_output := BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1062_c7_6815] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_return_output := result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1050_c7_cc0a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1054_c7_d26c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1054_c7_d26c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1054_c7_d26c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1054_c7_d26c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d26c_cond;
     n16_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue;
     n16_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output := n16_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1046_c7_9b9e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond;
     t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue;
     t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output := t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1054_c7_d26c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_6815_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1050_c7_cc0a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1050_c7_cc0a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1050_c7_cc0a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond;
     n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue;
     n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output := n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1054_c7_d26c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_cond;
     tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output := tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1046_c7_9b9e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1050_c7_cc0a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1060_c21_63d4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_63d4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_0980_return_output);

     -- t16_MUX[uxn_opcodes_h_l1041_c7_c0f2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond;
     t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue;
     t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output := t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_63d4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1041_c7_c0f2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1046_c7_9b9e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond;
     n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue;
     n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output := n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1046_c7_9b9e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1038_c7_09d3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1038_c7_09d3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_09d3_cond;
     t16_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue;
     t16_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output := t16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1050_c7_cc0a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond;
     tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output := tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1054_c7_d26c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1046_c7_9b9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1046_c7_9b9e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d26c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output;
     -- n16_MUX[uxn_opcodes_h_l1041_c7_c0f2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond;
     n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue;
     n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output := n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1050_c7_cc0a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1046_c7_9b9e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond;
     tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output := tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1041_c7_c0f2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1041_c7_c0f2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1038_c7_09d3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1025_c2_2760] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1025_c2_2760_cond <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_2760_cond;
     t16_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue;
     t16_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output := t16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1041_c7_c0f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_cc0a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output;
     -- n16_MUX[uxn_opcodes_h_l1038_c7_09d3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1038_c7_09d3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_09d3_cond;
     n16_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue;
     n16_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output := n16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1038_c7_09d3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1038_c7_09d3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1025_c2_2760] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1038_c7_09d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1041_c7_c0f2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond;
     tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output := tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1046_c7_9b9e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_9b9e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1025_c2_2760] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1025_c2_2760] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1038_c7_09d3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_cond;
     tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output := tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1025_c2_2760] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1025_c2_2760_cond <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_2760_cond;
     n16_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue;
     n16_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output := n16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1025_c2_2760] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1041_c7_c0f2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_c0f2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1025_c2_2760] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_cond;
     tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output := tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1038_c7_09d3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_09d3_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_2760_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1025_c2_2760] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_return_output := result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1021_l1069_DUPLICATE_070e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1021_l1069_DUPLICATE_070e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_2760_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_2760_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_2760_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_2760_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_2760_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_2760_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_2760_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1021_l1069_DUPLICATE_070e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1021_l1069_DUPLICATE_070e_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
