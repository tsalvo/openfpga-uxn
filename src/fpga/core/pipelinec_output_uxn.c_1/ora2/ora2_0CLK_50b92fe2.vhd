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
-- BIN_OP_EQ[uxn_opcodes_h_l1025_c6_0645]
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1025_c2_b7a2]
signal t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1025_c2_b7a2]
signal n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1025_c2_b7a2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1025_c2_b7a2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1025_c2_b7a2]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1025_c2_b7a2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1025_c2_b7a2]
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1025_c2_b7a2]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1025_c2_b7a2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1025_c2_b7a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1025_c2_b7a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1025_c2_b7a2]
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_aede]
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1038_c7_0900]
signal t16_MUX_uxn_opcodes_h_l1038_c7_0900_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1038_c7_0900]
signal n16_MUX_uxn_opcodes_h_l1038_c7_0900_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1038_c7_0900]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1038_c7_0900]
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1038_c7_0900]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1038_c7_0900]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1038_c7_0900]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1038_c7_0900]
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_430d]
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1041_c7_d3e1]
signal t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1041_c7_d3e1]
signal n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1041_c7_d3e1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1041_c7_d3e1]
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1041_c7_d3e1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1041_c7_d3e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1041_c7_d3e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1041_c7_d3e1]
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_2019]
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1046_c7_3c23]
signal t16_MUX_uxn_opcodes_h_l1046_c7_3c23_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1046_c7_3c23]
signal n16_MUX_uxn_opcodes_h_l1046_c7_3c23_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1046_c7_3c23]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1046_c7_3c23]
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1046_c7_3c23]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1046_c7_3c23]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1046_c7_3c23]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1046_c7_3c23]
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1047_c3_3791]
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_8302]
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1050_c7_f1df]
signal n16_MUX_uxn_opcodes_h_l1050_c7_f1df_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1050_c7_f1df]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1050_c7_f1df]
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1050_c7_f1df]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1050_c7_f1df]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1050_c7_f1df]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1050_c7_f1df]
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_d7f3]
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1054_c7_5b36]
signal n16_MUX_uxn_opcodes_h_l1054_c7_5b36_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1054_c7_5b36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1054_c7_5b36]
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1054_c7_5b36]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1054_c7_5b36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1054_c7_5b36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1054_c7_5b36]
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1055_c3_3093]
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1056_c11_d053]
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1057_c30_d4bc]
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_0b17]
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1062_c7_3836]
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1062_c7_3836]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1062_c7_3836]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1062_c7_3836]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1065_c31_a6fb]
signal CONST_SR_8_uxn_opcodes_h_l1065_c31_a6fb_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1065_c31_a6fb_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d0b4
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d0b4_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d0b4_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_left,
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_right,
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_return_output);

-- t16_MUX_uxn_opcodes_h_l1025_c2_b7a2
t16_MUX_uxn_opcodes_h_l1025_c2_b7a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond,
t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue,
t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse,
t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output);

-- n16_MUX_uxn_opcodes_h_l1025_c2_b7a2
n16_MUX_uxn_opcodes_h_l1025_c2_b7a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond,
n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue,
n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse,
n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2
tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond,
tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_left,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_right,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_return_output);

-- t16_MUX_uxn_opcodes_h_l1038_c7_0900
t16_MUX_uxn_opcodes_h_l1038_c7_0900 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1038_c7_0900_cond,
t16_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue,
t16_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse,
t16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output);

-- n16_MUX_uxn_opcodes_h_l1038_c7_0900
n16_MUX_uxn_opcodes_h_l1038_c7_0900 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1038_c7_0900_cond,
n16_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue,
n16_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse,
n16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_cond,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1038_c7_0900
tmp16_MUX_uxn_opcodes_h_l1038_c7_0900 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_cond,
tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue,
tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse,
tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_left,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_right,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_return_output);

-- t16_MUX_uxn_opcodes_h_l1041_c7_d3e1
t16_MUX_uxn_opcodes_h_l1041_c7_d3e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond,
t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue,
t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse,
t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output);

-- n16_MUX_uxn_opcodes_h_l1041_c7_d3e1
n16_MUX_uxn_opcodes_h_l1041_c7_d3e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond,
n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue,
n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse,
n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1
tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond,
tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_left,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_right,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_return_output);

-- t16_MUX_uxn_opcodes_h_l1046_c7_3c23
t16_MUX_uxn_opcodes_h_l1046_c7_3c23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1046_c7_3c23_cond,
t16_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue,
t16_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse,
t16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output);

-- n16_MUX_uxn_opcodes_h_l1046_c7_3c23
n16_MUX_uxn_opcodes_h_l1046_c7_3c23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1046_c7_3c23_cond,
n16_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue,
n16_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse,
n16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_cond,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23
tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_cond,
tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue,
tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse,
tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791
BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791_left,
BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791_right,
BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_left,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_right,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_return_output);

-- n16_MUX_uxn_opcodes_h_l1050_c7_f1df
n16_MUX_uxn_opcodes_h_l1050_c7_f1df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1050_c7_f1df_cond,
n16_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue,
n16_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse,
n16_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_cond,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df
tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_cond,
tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue,
tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse,
tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_left,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_right,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_return_output);

-- n16_MUX_uxn_opcodes_h_l1054_c7_5b36
n16_MUX_uxn_opcodes_h_l1054_c7_5b36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1054_c7_5b36_cond,
n16_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue,
n16_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse,
n16_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_cond,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36
tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_cond,
tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue,
tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse,
tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093
BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093_left,
BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093_right,
BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053
BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053_left,
BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053_right,
BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc
sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_ins,
sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_x,
sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_y,
sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_left,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_right,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_cond,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1065_c31_a6fb
CONST_SR_8_uxn_opcodes_h_l1065_c31_a6fb : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1065_c31_a6fb_x,
CONST_SR_8_uxn_opcodes_h_l1065_c31_a6fb_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d0b4
CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d0b4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d0b4_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d0b4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_return_output,
 t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output,
 n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_return_output,
 t16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output,
 n16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_return_output,
 tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_return_output,
 t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output,
 n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_return_output,
 t16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output,
 n16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output,
 tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_return_output,
 n16_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output,
 tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_return_output,
 n16_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output,
 tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053_return_output,
 sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_return_output,
 CONST_SR_8_uxn_opcodes_h_l1065_c31_a6fb_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d0b4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_7b33 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_704f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_0900_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_0900_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_b039 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_ab96 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_3c23_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_3c23_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_2c11 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_f1df_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_5b36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_92ad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_f190_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_a018 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_079d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_a6fb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_a6fb_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_d4b1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1050_l1046_l1041_l1038_l1025_l1062_DUPLICATE_66b6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1050_l1046_l1041_l1038_DUPLICATE_cd84_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1050_l1046_l1041_l1038_l1062_DUPLICATE_4d41_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1050_l1046_l1041_l1038_l1062_DUPLICATE_2a97_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1047_l1051_l1055_l1042_DUPLICATE_339c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d0b4_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d0b4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_72b8_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1069_l1021_DUPLICATE_737b_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_92ad := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_92ad;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_2c11 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_2c11;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_7b33 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_7b33;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_079d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_079d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_a018 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_a018;
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_704f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_704f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_ab96 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_ab96;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_b039 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_b039;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_a6fb_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse := tmp16;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1025_c2_b7a2] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_b7a2_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1025_c6_0645] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_left;
     BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_return_output := BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_72b8 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_72b8_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1050_l1046_l1041_l1038_DUPLICATE_cd84 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1050_l1046_l1041_l1038_DUPLICATE_cd84_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l1065_c31_a6fb] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1065_c31_a6fb_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_a6fb_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_a6fb_return_output := CONST_SR_8_uxn_opcodes_h_l1065_c31_a6fb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_0b17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_left;
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_return_output := BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_8302] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_left;
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_return_output := BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_d7f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_2019] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_left;
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_return_output := BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_430d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1025_c2_b7a2] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_b7a2_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1025_c2_b7a2] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_b7a2_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1050_l1046_l1041_l1038_l1025_l1062_DUPLICATE_66b6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1050_l1046_l1041_l1038_l1025_l1062_DUPLICATE_66b6_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1050_l1046_l1041_l1038_l1062_DUPLICATE_4d41 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1050_l1046_l1041_l1038_l1062_DUPLICATE_4d41_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1025_c2_b7a2] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_b7a2_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_aede] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_left;
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_return_output := BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1047_l1051_l1055_l1042_DUPLICATE_339c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1047_l1051_l1055_l1042_DUPLICATE_339c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1050_l1046_l1041_l1038_l1062_DUPLICATE_2a97 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1050_l1046_l1041_l1038_l1062_DUPLICATE_2a97_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l1057_c30_d4bc] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_ins;
     sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_x;
     sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_return_output := sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_0645_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_0900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_0900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_aede_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_430d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_3c23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_3c23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_2019_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_f1df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_8302_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_5b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_d7f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_0b17_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1047_l1051_l1055_l1042_DUPLICATE_339c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1047_l1051_l1055_l1042_DUPLICATE_339c_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d0b4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1047_l1051_l1055_l1042_DUPLICATE_339c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1050_l1046_l1041_l1038_l1062_DUPLICATE_4d41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1050_l1046_l1041_l1038_l1062_DUPLICATE_4d41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1050_l1046_l1041_l1038_l1062_DUPLICATE_4d41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1050_l1046_l1041_l1038_l1062_DUPLICATE_4d41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1050_l1046_l1041_l1038_l1062_DUPLICATE_4d41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1050_l1046_l1041_l1038_l1062_DUPLICATE_2a97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1050_l1046_l1041_l1038_l1062_DUPLICATE_2a97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1050_l1046_l1041_l1038_l1062_DUPLICATE_2a97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1050_l1046_l1041_l1038_l1062_DUPLICATE_2a97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1050_l1046_l1041_l1038_l1062_DUPLICATE_2a97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1050_l1046_l1041_l1038_l1062_DUPLICATE_2a97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1050_l1046_l1041_l1038_DUPLICATE_cd84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1050_l1046_l1041_l1038_DUPLICATE_cd84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1050_l1046_l1041_l1038_DUPLICATE_cd84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1050_l1046_l1041_l1038_DUPLICATE_cd84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1050_l1046_l1041_l1038_DUPLICATE_cd84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_72b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_72b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1050_l1046_l1041_l1038_l1025_l1062_DUPLICATE_66b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1050_l1046_l1041_l1038_l1025_l1062_DUPLICATE_66b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1050_l1046_l1041_l1038_l1025_l1062_DUPLICATE_66b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1050_l1046_l1041_l1038_l1025_l1062_DUPLICATE_66b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1050_l1046_l1041_l1038_l1025_l1062_DUPLICATE_66b6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1050_l1046_l1041_l1038_l1025_l1062_DUPLICATE_66b6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_b7a2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_b7a2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_b7a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_b7a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_d4bc_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d0b4 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d0b4_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d0b4_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d0b4_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d0b4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1054_c7_5b36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1065_c21_d4b1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_d4b1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_a6fb_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1025_c2_b7a2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1055_c3_3093] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093_left;
     BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093_return_output := BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1062_c7_3836] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1025_c2_b7a2] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1025_c2_b7a2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1062_c7_3836] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1025_c2_b7a2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1062_c7_3836] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1047_c3_3791] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791_left;
     BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791_return_output := BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_3791_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_3093_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_d4b1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d0b4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d0b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_3836_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_3836_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_3836_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1056_c11_d053] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053_left;
     BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053_return_output := BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1054_c7_5b36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1050_c7_f1df] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1062_c7_3836] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_return_output := result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1054_c7_5b36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output;

     -- t16_MUX[uxn_opcodes_h_l1046_c7_3c23] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1046_c7_3c23_cond <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_3c23_cond;
     t16_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue;
     t16_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output := t16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output;

     -- n16_MUX[uxn_opcodes_h_l1054_c7_5b36] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1054_c7_5b36_cond <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_5b36_cond;
     n16_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue;
     n16_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output := n16_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1054_c7_5b36] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_3836_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1050_c7_f1df] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output;

     -- t16_MUX[uxn_opcodes_h_l1041_c7_d3e1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond;
     t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue;
     t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output := t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1046_c7_3c23] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1050_c7_f1df] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output;

     -- n16_MUX[uxn_opcodes_h_l1050_c7_f1df] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1050_c7_f1df_cond <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_f1df_cond;
     n16_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue;
     n16_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output := n16_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1060_c21_f190] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_f190_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_d053_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1050_c7_f1df] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1054_c7_5b36] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_cond;
     tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output := tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_f190_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1046_c7_3c23] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1050_c7_f1df] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_cond;
     tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output := tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1046_c7_3c23] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1041_c7_d3e1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1038_c7_0900] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1038_c7_0900_cond <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_0900_cond;
     t16_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue;
     t16_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output := t16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1046_c7_3c23] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output;

     -- n16_MUX[uxn_opcodes_h_l1046_c7_3c23] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1046_c7_3c23_cond <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_3c23_cond;
     n16_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue;
     n16_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output := n16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1054_c7_5b36] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output := result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_5b36_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output;
     -- t16_MUX[uxn_opcodes_h_l1025_c2_b7a2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond;
     t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue;
     t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output := t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1041_c7_d3e1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1050_c7_f1df] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output := result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1038_c7_0900] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_return_output;

     -- n16_MUX[uxn_opcodes_h_l1041_c7_d3e1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond;
     n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue;
     n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output := n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1041_c7_d3e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1046_c7_3c23] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_cond;
     tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output := tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1041_c7_d3e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_0900_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_f1df_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1046_c7_3c23] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output := result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1025_c2_b7a2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1038_c7_0900] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1041_c7_d3e1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond;
     tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output := tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1038_c7_0900] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1038_c7_0900_cond <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_0900_cond;
     n16_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue;
     n16_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output := n16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1038_c7_0900] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1038_c7_0900] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_0900_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_0900_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_0900_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_3c23_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output;
     -- n16_MUX[uxn_opcodes_h_l1025_c2_b7a2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond;
     n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue;
     n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output := n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1025_c2_b7a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1041_c7_d3e1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1025_c2_b7a2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1038_c7_0900] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_cond;
     tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output := tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1025_c2_b7a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d3e1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_0900_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1025_c2_b7a2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond;
     tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output := tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1038_c7_0900] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_return_output := result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_0900_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1025_c2_b7a2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1069_l1021_DUPLICATE_737b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1069_l1021_DUPLICATE_737b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_b7a2_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1069_l1021_DUPLICATE_737b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1069_l1021_DUPLICATE_737b_return_output;
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
