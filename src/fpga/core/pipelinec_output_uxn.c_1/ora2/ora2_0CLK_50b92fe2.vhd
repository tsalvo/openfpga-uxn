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
-- BIN_OP_EQ[uxn_opcodes_h_l1025_c6_e2a8]
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1025_c2_a16e]
signal t16_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1025_c2_a16e]
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1025_c2_a16e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1025_c2_a16e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1025_c2_a16e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1025_c2_a16e]
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1025_c2_a16e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1025_c2_a16e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1025_c2_a16e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1025_c2_a16e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1025_c2_a16e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1025_c2_a16e]
signal n16_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_22af]
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1038_c7_f791]
signal t16_MUX_uxn_opcodes_h_l1038_c7_f791_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1038_c7_f791]
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1038_c7_f791]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1038_c7_f791]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1038_c7_f791]
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1038_c7_f791]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1038_c7_f791]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1038_c7_f791]
signal n16_MUX_uxn_opcodes_h_l1038_c7_f791_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_ecf7]
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1041_c7_3f05]
signal t16_MUX_uxn_opcodes_h_l1041_c7_3f05_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1041_c7_3f05]
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1041_c7_3f05]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1041_c7_3f05]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1041_c7_3f05]
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1041_c7_3f05]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1041_c7_3f05]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1041_c7_3f05]
signal n16_MUX_uxn_opcodes_h_l1041_c7_3f05_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_9330]
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1046_c7_713a]
signal t16_MUX_uxn_opcodes_h_l1046_c7_713a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1046_c7_713a]
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1046_c7_713a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1046_c7_713a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1046_c7_713a]
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1046_c7_713a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1046_c7_713a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1046_c7_713a]
signal n16_MUX_uxn_opcodes_h_l1046_c7_713a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1047_c3_3413]
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_d92b]
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1050_c7_2285]
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1050_c7_2285]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1050_c7_2285]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1050_c7_2285]
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1050_c7_2285]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1050_c7_2285]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1050_c7_2285]
signal n16_MUX_uxn_opcodes_h_l1050_c7_2285_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_2285_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_5f8d]
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1054_c7_4940]
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1054_c7_4940]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1054_c7_4940]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1054_c7_4940]
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1054_c7_4940]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1054_c7_4940]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1054_c7_4940]
signal n16_MUX_uxn_opcodes_h_l1054_c7_4940_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_4940_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1055_c3_0749]
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1056_c11_363d]
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1057_c30_cd36]
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_5c78]
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1062_c7_0024]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1062_c7_0024]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1062_c7_0024]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1062_c7_0024]
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1065_c31_f3fe]
signal CONST_SR_8_uxn_opcodes_h_l1065_c31_f3fe_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1065_c31_f3fe_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_a7ae
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_a7ae_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_a7ae_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_71f0( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_left,
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_right,
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_return_output);

-- t16_MUX_uxn_opcodes_h_l1025_c2_a16e
t16_MUX_uxn_opcodes_h_l1025_c2_a16e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1025_c2_a16e_cond,
t16_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue,
t16_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse,
t16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e
tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_cond,
tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output);

-- n16_MUX_uxn_opcodes_h_l1025_c2_a16e
n16_MUX_uxn_opcodes_h_l1025_c2_a16e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1025_c2_a16e_cond,
n16_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue,
n16_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse,
n16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_left,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_right,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_return_output);

-- t16_MUX_uxn_opcodes_h_l1038_c7_f791
t16_MUX_uxn_opcodes_h_l1038_c7_f791 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1038_c7_f791_cond,
t16_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue,
t16_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse,
t16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1038_c7_f791
tmp16_MUX_uxn_opcodes_h_l1038_c7_f791 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_cond,
tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue,
tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse,
tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_cond,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_return_output);

-- n16_MUX_uxn_opcodes_h_l1038_c7_f791
n16_MUX_uxn_opcodes_h_l1038_c7_f791 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1038_c7_f791_cond,
n16_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue,
n16_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse,
n16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_left,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_right,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_return_output);

-- t16_MUX_uxn_opcodes_h_l1041_c7_3f05
t16_MUX_uxn_opcodes_h_l1041_c7_3f05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1041_c7_3f05_cond,
t16_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue,
t16_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse,
t16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05
tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_cond,
tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue,
tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse,
tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_cond,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output);

-- n16_MUX_uxn_opcodes_h_l1041_c7_3f05
n16_MUX_uxn_opcodes_h_l1041_c7_3f05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1041_c7_3f05_cond,
n16_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue,
n16_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse,
n16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_left,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_right,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_return_output);

-- t16_MUX_uxn_opcodes_h_l1046_c7_713a
t16_MUX_uxn_opcodes_h_l1046_c7_713a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1046_c7_713a_cond,
t16_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue,
t16_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse,
t16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1046_c7_713a
tmp16_MUX_uxn_opcodes_h_l1046_c7_713a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_cond,
tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_return_output);

-- n16_MUX_uxn_opcodes_h_l1046_c7_713a
n16_MUX_uxn_opcodes_h_l1046_c7_713a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1046_c7_713a_cond,
n16_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue,
n16_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse,
n16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413
BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413_left,
BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413_right,
BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_left,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_right,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1050_c7_2285
tmp16_MUX_uxn_opcodes_h_l1050_c7_2285 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_cond,
tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue,
tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse,
tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_cond,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_return_output);

-- n16_MUX_uxn_opcodes_h_l1050_c7_2285
n16_MUX_uxn_opcodes_h_l1050_c7_2285 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1050_c7_2285_cond,
n16_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue,
n16_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse,
n16_MUX_uxn_opcodes_h_l1050_c7_2285_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_left,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_right,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1054_c7_4940
tmp16_MUX_uxn_opcodes_h_l1054_c7_4940 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_cond,
tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue,
tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse,
tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_cond,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_return_output);

-- n16_MUX_uxn_opcodes_h_l1054_c7_4940
n16_MUX_uxn_opcodes_h_l1054_c7_4940 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1054_c7_4940_cond,
n16_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue,
n16_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse,
n16_MUX_uxn_opcodes_h_l1054_c7_4940_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749
BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749_left,
BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749_right,
BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d
BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d_left,
BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d_right,
BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36
sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_ins,
sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_x,
sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_y,
sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_left,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_right,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_cond,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1065_c31_f3fe
CONST_SR_8_uxn_opcodes_h_l1065_c31_f3fe : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1065_c31_f3fe_x,
CONST_SR_8_uxn_opcodes_h_l1065_c31_f3fe_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_a7ae
CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_a7ae : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_a7ae_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_a7ae_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_return_output,
 t16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output,
 n16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_return_output,
 t16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output,
 tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_return_output,
 n16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_return_output,
 t16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output,
 tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output,
 n16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_return_output,
 t16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_return_output,
 n16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_return_output,
 n16_MUX_uxn_opcodes_h_l1050_c7_2285_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_return_output,
 n16_MUX_uxn_opcodes_h_l1054_c7_4940_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d_return_output,
 sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_return_output,
 CONST_SR_8_uxn_opcodes_h_l1065_c31_f3fe_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_a7ae_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_ef9f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_2f1d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a16e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f791_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_253a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f791_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_3f05_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_5fe2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_3f05_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_713a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_83b6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_2285_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_713a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_4940_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_2285_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_d417 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_4940_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_109f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_3d4d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_d1cc : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_f3fe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_f3fe_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_4a2d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1025_l1062_l1050_l1046_l1041_DUPLICATE_5c5a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1054_l1050_l1046_l1041_DUPLICATE_5d5e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1062_l1050_l1046_l1041_DUPLICATE_0f61_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1062_l1054_l1050_l1046_l1041_DUPLICATE_b7ab_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1051_l1055_l1042_l1047_DUPLICATE_c2ae_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_a7ae_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_a7ae_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1050_l1062_DUPLICATE_75e4_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1021_l1069_DUPLICATE_3a9f_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_3d4d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_3d4d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_2f1d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_2f1d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_d1cc := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_d1cc;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_253a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_253a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_ef9f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_ef9f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_d417 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_d417;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_83b6 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_83b6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_5fe2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_5fe2;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_f3fe_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse := tmp16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1025_c2_a16e] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_a16e_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_ecf7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1051_l1055_l1042_l1047_DUPLICATE_c2ae LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1051_l1055_l1042_l1047_DUPLICATE_c2ae_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1062_l1050_l1046_l1041_DUPLICATE_0f61 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1062_l1050_l1046_l1041_DUPLICATE_0f61_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1025_c2_a16e] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_a16e_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1025_c2_a16e] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_a16e_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1025_l1062_l1050_l1046_l1041_DUPLICATE_5c5a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1025_l1062_l1050_l1046_l1041_DUPLICATE_5c5a_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_22af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_left;
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_return_output := BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_d92b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_9330] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_left;
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_return_output := BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1065_c31_f3fe] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1065_c31_f3fe_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_f3fe_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_f3fe_return_output := CONST_SR_8_uxn_opcodes_h_l1065_c31_f3fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1025_c6_e2a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_5c78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_left;
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_return_output := BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1054_l1050_l1046_l1041_DUPLICATE_5d5e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1054_l1050_l1046_l1041_DUPLICATE_5d5e_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1025_c2_a16e] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_a16e_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1050_l1062_DUPLICATE_75e4 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1050_l1062_DUPLICATE_75e4_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_5f8d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1057_c30_cd36] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_ins;
     sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_x;
     sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_return_output := sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1062_l1054_l1050_l1046_l1041_DUPLICATE_b7ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1062_l1054_l1050_l1046_l1041_DUPLICATE_b7ab_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_e2a8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_22af_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_3f05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_3f05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ecf7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_713a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_713a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9330_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_2285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d92b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_4940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_5f8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_5c78_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1051_l1055_l1042_l1047_DUPLICATE_c2ae_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1051_l1055_l1042_l1047_DUPLICATE_c2ae_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_a7ae_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1051_l1055_l1042_l1047_DUPLICATE_c2ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1062_l1050_l1046_l1041_DUPLICATE_0f61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1062_l1050_l1046_l1041_DUPLICATE_0f61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1062_l1050_l1046_l1041_DUPLICATE_0f61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1062_l1050_l1046_l1041_DUPLICATE_0f61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1062_l1050_l1046_l1041_DUPLICATE_0f61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1062_l1054_l1050_l1046_l1041_DUPLICATE_b7ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1062_l1054_l1050_l1046_l1041_DUPLICATE_b7ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1062_l1054_l1050_l1046_l1041_DUPLICATE_b7ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1062_l1054_l1050_l1046_l1041_DUPLICATE_b7ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1062_l1054_l1050_l1046_l1041_DUPLICATE_b7ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1062_l1054_l1050_l1046_l1041_DUPLICATE_b7ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1054_l1050_l1046_l1041_DUPLICATE_5d5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1054_l1050_l1046_l1041_DUPLICATE_5d5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1054_l1050_l1046_l1041_DUPLICATE_5d5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1054_l1050_l1046_l1041_DUPLICATE_5d5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1054_l1050_l1046_l1041_DUPLICATE_5d5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1050_l1062_DUPLICATE_75e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1050_l1062_DUPLICATE_75e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1025_l1062_l1050_l1046_l1041_DUPLICATE_5c5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1025_l1062_l1050_l1046_l1041_DUPLICATE_5c5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1025_l1062_l1050_l1046_l1041_DUPLICATE_5c5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1025_l1062_l1050_l1046_l1041_DUPLICATE_5c5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1025_l1062_l1050_l1046_l1041_DUPLICATE_5c5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1025_l1062_l1050_l1046_l1041_DUPLICATE_5c5a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_a16e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_a16e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_a16e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_a16e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_cd36_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1062_c7_0024] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1047_c3_3413] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413_left;
     BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413_return_output := BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1025_c2_a16e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1065_c21_4a2d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_4a2d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_f3fe_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1054_c7_4940] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1025_c2_a16e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_a7ae LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_a7ae_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_a7ae_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_a7ae_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_a7ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1062_c7_0024] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1055_c3_0749] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749_left;
     BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749_return_output := BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1025_c2_a16e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1062_c7_0024] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1025_c2_a16e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_3413_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0749_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_4a2d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_a7ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_a7ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_0024_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_4940_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_0024_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_0024_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1054_c7_4940] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1054_c7_4940] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1056_c11_363d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d_left;
     BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d_return_output := BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1046_c7_713a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1046_c7_713a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_713a_cond;
     t16_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue;
     t16_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output := t16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1050_c7_2285] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_return_output;

     -- n16_MUX[uxn_opcodes_h_l1054_c7_4940] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1054_c7_4940_cond <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_4940_cond;
     n16_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue;
     n16_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_4940_return_output := n16_MUX_uxn_opcodes_h_l1054_c7_4940_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1054_c7_4940] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1062_c7_0024] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_return_output := result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1054_c7_4940_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_4940_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_2285_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_4940_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_4940_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_0024_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output;
     -- n16_MUX[uxn_opcodes_h_l1050_c7_2285] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1050_c7_2285_cond <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_2285_cond;
     n16_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue;
     n16_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_2285_return_output := n16_MUX_uxn_opcodes_h_l1050_c7_2285_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1060_c21_109f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_109f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_363d_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1050_c7_2285] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1050_c7_2285] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_return_output;

     -- t16_MUX[uxn_opcodes_h_l1041_c7_3f05] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1041_c7_3f05_cond <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_3f05_cond;
     t16_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue;
     t16_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output := t16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1050_c7_2285] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1046_c7_713a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1054_c7_4940] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_cond;
     tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_return_output := tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_109f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1050_c7_2285_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_2285_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_713a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_2285_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_2285_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_4940_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1046_c7_713a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1046_c7_713a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1054_c7_4940] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_return_output := result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_return_output;

     -- t16_MUX[uxn_opcodes_h_l1038_c7_f791] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1038_c7_f791_cond <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f791_cond;
     t16_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue;
     t16_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output := t16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output;

     -- n16_MUX[uxn_opcodes_h_l1046_c7_713a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1046_c7_713a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_713a_cond;
     n16_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue;
     n16_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output := n16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1050_c7_2285] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_cond;
     tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_return_output := tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1046_c7_713a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1041_c7_3f05] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_713a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_713a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_713a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_4940_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_2285_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1041_c7_3f05] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1041_c7_3f05] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1050_c7_2285] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_return_output := result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_return_output;

     -- n16_MUX[uxn_opcodes_h_l1041_c7_3f05] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1041_c7_3f05_cond <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_3f05_cond;
     n16_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue;
     n16_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output := n16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1041_c7_3f05] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1038_c7_f791] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1046_c7_713a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_cond;
     tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output := tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1025_c2_a16e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1025_c2_a16e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a16e_cond;
     t16_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue;
     t16_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output := t16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f791_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_2285_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_713a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1038_c7_f791] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_return_output;

     -- n16_MUX[uxn_opcodes_h_l1038_c7_f791] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1038_c7_f791_cond <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f791_cond;
     n16_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue;
     n16_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output := n16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1038_c7_f791] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1025_c2_a16e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1046_c7_713a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1041_c7_3f05] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_cond;
     tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output := tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1038_c7_f791] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f791_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f791_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f791_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_713a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1025_c2_a16e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1038_c7_f791] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_cond;
     tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output := tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1025_c2_a16e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1041_c7_3f05] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output := result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output;

     -- n16_MUX[uxn_opcodes_h_l1025_c2_a16e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1025_c2_a16e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a16e_cond;
     n16_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue;
     n16_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output := n16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1025_c2_a16e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_3f05_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f791_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1025_c2_a16e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_cond;
     tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output := tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1038_c7_f791] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_return_output := result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f791_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1025_c2_a16e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1021_l1069_DUPLICATE_3a9f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1021_l1069_DUPLICATE_3a9f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_71f0(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a16e_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1021_l1069_DUPLICATE_3a9f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1021_l1069_DUPLICATE_3a9f_return_output;
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
