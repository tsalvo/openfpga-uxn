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
-- BIN_OP_EQ[uxn_opcodes_h_l1025_c6_1f38]
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1025_c2_a284]
signal n16_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1025_c2_a284]
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1025_c2_a284]
signal t16_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1025_c2_a284]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1025_c2_a284]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1025_c2_a284]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1025_c2_a284]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1025_c2_a284]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1025_c2_a284]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1025_c2_a284]
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1025_c2_a284]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1025_c2_a284]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_945f]
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1038_c7_07af]
signal n16_MUX_uxn_opcodes_h_l1038_c7_07af_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1038_c7_07af]
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1038_c7_07af]
signal t16_MUX_uxn_opcodes_h_l1038_c7_07af_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1038_c7_07af]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1038_c7_07af]
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1038_c7_07af]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1038_c7_07af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1038_c7_07af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_6991]
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1041_c7_07c7]
signal n16_MUX_uxn_opcodes_h_l1041_c7_07c7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1041_c7_07c7]
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1041_c7_07c7]
signal t16_MUX_uxn_opcodes_h_l1041_c7_07c7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1041_c7_07c7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1041_c7_07c7]
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1041_c7_07c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1041_c7_07c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1041_c7_07c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_3000]
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1046_c7_399d]
signal n16_MUX_uxn_opcodes_h_l1046_c7_399d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1046_c7_399d]
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1046_c7_399d]
signal t16_MUX_uxn_opcodes_h_l1046_c7_399d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1046_c7_399d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1046_c7_399d]
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1046_c7_399d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1046_c7_399d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1046_c7_399d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1047_c3_6821]
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_d77b]
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1050_c7_4a2b]
signal n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1050_c7_4a2b]
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1050_c7_4a2b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1050_c7_4a2b]
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1050_c7_4a2b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1050_c7_4a2b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1050_c7_4a2b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_1489]
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1054_c7_8ec7]
signal n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1054_c7_8ec7]
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1054_c7_8ec7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1054_c7_8ec7]
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1054_c7_8ec7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1054_c7_8ec7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1054_c7_8ec7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1055_c3_0d2f]
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1056_c11_7967]
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1057_c30_606b]
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_bf3e]
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1062_c7_d5a1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1062_c7_d5a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1062_c7_d5a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1062_c7_d5a1]
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1065_c31_b5c2]
signal CONST_SR_8_uxn_opcodes_h_l1065_c31_b5c2_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1065_c31_b5c2_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_82f4
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_82f4_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_82f4_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_ee25( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_left,
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_right,
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_return_output);

-- n16_MUX_uxn_opcodes_h_l1025_c2_a284
n16_MUX_uxn_opcodes_h_l1025_c2_a284 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1025_c2_a284_cond,
n16_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue,
n16_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse,
n16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1025_c2_a284
tmp16_MUX_uxn_opcodes_h_l1025_c2_a284 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_cond,
tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue,
tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse,
tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output);

-- t16_MUX_uxn_opcodes_h_l1025_c2_a284
t16_MUX_uxn_opcodes_h_l1025_c2_a284 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1025_c2_a284_cond,
t16_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue,
t16_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse,
t16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_cond,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_left,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_right,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_return_output);

-- n16_MUX_uxn_opcodes_h_l1038_c7_07af
n16_MUX_uxn_opcodes_h_l1038_c7_07af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1038_c7_07af_cond,
n16_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue,
n16_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse,
n16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1038_c7_07af
tmp16_MUX_uxn_opcodes_h_l1038_c7_07af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_cond,
tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue,
tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse,
tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output);

-- t16_MUX_uxn_opcodes_h_l1038_c7_07af
t16_MUX_uxn_opcodes_h_l1038_c7_07af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1038_c7_07af_cond,
t16_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue,
t16_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse,
t16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_cond,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_left,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_right,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_return_output);

-- n16_MUX_uxn_opcodes_h_l1041_c7_07c7
n16_MUX_uxn_opcodes_h_l1041_c7_07c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1041_c7_07c7_cond,
n16_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue,
n16_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse,
n16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7
tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_cond,
tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output);

-- t16_MUX_uxn_opcodes_h_l1041_c7_07c7
t16_MUX_uxn_opcodes_h_l1041_c7_07c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1041_c7_07c7_cond,
t16_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue,
t16_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse,
t16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_left,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_right,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_return_output);

-- n16_MUX_uxn_opcodes_h_l1046_c7_399d
n16_MUX_uxn_opcodes_h_l1046_c7_399d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1046_c7_399d_cond,
n16_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue,
n16_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse,
n16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1046_c7_399d
tmp16_MUX_uxn_opcodes_h_l1046_c7_399d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_cond,
tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output);

-- t16_MUX_uxn_opcodes_h_l1046_c7_399d
t16_MUX_uxn_opcodes_h_l1046_c7_399d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1046_c7_399d_cond,
t16_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue,
t16_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse,
t16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821
BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821_left,
BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821_right,
BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_left,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_right,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_return_output);

-- n16_MUX_uxn_opcodes_h_l1050_c7_4a2b
n16_MUX_uxn_opcodes_h_l1050_c7_4a2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond,
n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue,
n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse,
n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b
tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond,
tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_left,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_right,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_return_output);

-- n16_MUX_uxn_opcodes_h_l1054_c7_8ec7
n16_MUX_uxn_opcodes_h_l1054_c7_8ec7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond,
n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue,
n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse,
n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7
tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond,
tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f
BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f_left,
BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f_right,
BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967
BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967_left,
BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967_right,
BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1057_c30_606b
sp_relative_shift_uxn_opcodes_h_l1057_c30_606b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_ins,
sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_x,
sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_y,
sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_left,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_right,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1065_c31_b5c2
CONST_SR_8_uxn_opcodes_h_l1065_c31_b5c2 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1065_c31_b5c2_x,
CONST_SR_8_uxn_opcodes_h_l1065_c31_b5c2_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_82f4
CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_82f4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_82f4_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_82f4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_return_output,
 n16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output,
 tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output,
 t16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_return_output,
 n16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output,
 tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output,
 t16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_return_output,
 n16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output,
 t16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_return_output,
 n16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output,
 t16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_return_output,
 n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_return_output,
 n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967_return_output,
 sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output,
 CONST_SR_8_uxn_opcodes_h_l1065_c31_b5c2_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_82f4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_2385 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_fa92 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_07af_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_07af_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_07a9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_07c7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_07c7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_53ec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_399d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_399d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_ba47 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_e943 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_543f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_6517 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_cc10 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_b5c2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_b5c2_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_dfae_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1025_l1062_DUPLICATE_3339_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1062_DUPLICATE_e0a6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_DUPLICATE_3b19_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_l1062_DUPLICATE_be68_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1042_l1051_l1047_l1055_DUPLICATE_03e9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_82f4_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_82f4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_aec3_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1069_l1021_DUPLICATE_e4e5_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_2385 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_2385;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_y := resize(to_signed(-2, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_6517 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_6517;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_ba47 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_ba47;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_07a9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_07a9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_fa92 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_fa92;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_e943 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_e943;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_cc10 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_cc10;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_53ec := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_53ec;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_right := to_unsigned(5, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_b5c2_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_l1062_DUPLICATE_be68 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_l1062_DUPLICATE_be68_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1025_c2_a284] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_a284_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_d77b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1025_c2_a284] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_a284_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1025_c6_1f38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_left;
     BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_return_output := BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1042_l1051_l1047_l1055_DUPLICATE_03e9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1042_l1051_l1047_l1055_DUPLICATE_03e9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1025_c2_a284] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_a284_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1025_l1062_DUPLICATE_3339 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1025_l1062_DUPLICATE_3339_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1057_c30_606b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_ins;
     sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_x;
     sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_return_output := sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1062_DUPLICATE_e0a6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1062_DUPLICATE_e0a6_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_bf3e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1025_c2_a284] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_a284_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_aec3 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_aec3_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_945f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_1489] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_left;
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_return_output := BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_6991] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_left;
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_return_output := BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1065_c31_b5c2] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1065_c31_b5c2_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_b5c2_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_b5c2_return_output := CONST_SR_8_uxn_opcodes_h_l1065_c31_b5c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_3000] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_left;
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_return_output := BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_DUPLICATE_3b19 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_DUPLICATE_3b19_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_1f38_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_07af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_07af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_945f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_07c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_07c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_6991_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_399d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_399d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_3000_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_d77b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_1489_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_bf3e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1042_l1051_l1047_l1055_DUPLICATE_03e9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1042_l1051_l1047_l1055_DUPLICATE_03e9_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_82f4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1042_l1051_l1047_l1055_DUPLICATE_03e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1062_DUPLICATE_e0a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1062_DUPLICATE_e0a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1062_DUPLICATE_e0a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1062_DUPLICATE_e0a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1062_DUPLICATE_e0a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_l1062_DUPLICATE_be68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_l1062_DUPLICATE_be68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_l1062_DUPLICATE_be68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_l1062_DUPLICATE_be68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_l1062_DUPLICATE_be68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_l1062_DUPLICATE_be68_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_DUPLICATE_3b19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_DUPLICATE_3b19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_DUPLICATE_3b19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_DUPLICATE_3b19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1054_l1046_l1050_l1041_l1038_DUPLICATE_3b19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_aec3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_aec3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1025_l1062_DUPLICATE_3339_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1025_l1062_DUPLICATE_3339_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1025_l1062_DUPLICATE_3339_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1025_l1062_DUPLICATE_3339_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1025_l1062_DUPLICATE_3339_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1050_l1041_l1038_l1025_l1062_DUPLICATE_3339_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_a284_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_a284_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_a284_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_a284_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_606b_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1025_c2_a284] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1065_c21_dfae] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_dfae_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_b5c2_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1047_c3_6821] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821_left;
     BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821_return_output := BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_82f4 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_82f4_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_82f4_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_82f4_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_82f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1054_c7_8ec7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1062_c7_d5a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1025_c2_a284] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1025_c2_a284] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1025_c2_a284] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1062_c7_d5a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1055_c3_0d2f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f_left;
     BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f_return_output := BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1062_c7_d5a1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_6821_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_0d2f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_dfae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_82f4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_82f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1062_c7_d5a1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1046_c7_399d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1046_c7_399d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_399d_cond;
     t16_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue;
     t16_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output := t16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1054_c7_8ec7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1054_c7_8ec7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond;
     n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue;
     n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output := n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1056_c11_7967] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967_left;
     BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967_return_output := BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1050_c7_4a2b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1054_c7_8ec7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1054_c7_8ec7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_d5a1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1050_c7_4a2b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1060_c21_543f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_543f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_7967_return_output);

     -- n16_MUX[uxn_opcodes_h_l1050_c7_4a2b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond;
     n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue;
     n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output := n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1050_c7_4a2b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1054_c7_8ec7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond;
     tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output := tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1050_c7_4a2b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1046_c7_399d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1041_c7_07c7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1041_c7_07c7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_07c7_cond;
     t16_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue;
     t16_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output := t16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_543f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_399d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1046_c7_399d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1050_c7_4a2b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond;
     tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output := tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1046_c7_399d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1054_c7_8ec7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1041_c7_07c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1046_c7_399d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1046_c7_399d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_399d_cond;
     n16_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue;
     n16_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output := n16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1038_c7_07af] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1038_c7_07af_cond <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_07af_cond;
     t16_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue;
     t16_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output := t16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1046_c7_399d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_399d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_399d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_399d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_8ec7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1046_c7_399d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_cond;
     tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output := tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1050_c7_4a2b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1041_c7_07c7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1041_c7_07c7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_07c7_cond;
     n16_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue;
     n16_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output := n16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1025_c2_a284] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1025_c2_a284_cond <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a284_cond;
     t16_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue;
     t16_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output := t16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1041_c7_07c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1038_c7_07af] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1041_c7_07c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1041_c7_07c7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_07af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_4a2b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_399d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1038_c7_07af] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_return_output;

     -- n16_MUX[uxn_opcodes_h_l1038_c7_07af] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1038_c7_07af_cond <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_07af_cond;
     n16_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue;
     n16_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output := n16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1038_c7_07af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1025_c2_a284] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1041_c7_07c7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_cond;
     tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output := tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1046_c7_399d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1038_c7_07af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_07af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_07af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_07af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_399d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1025_c2_a284] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1025_c2_a284] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1041_c7_07c7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1025_c2_a284] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1038_c7_07af] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_cond;
     tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output := tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output;

     -- n16_MUX[uxn_opcodes_h_l1025_c2_a284] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1025_c2_a284_cond <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a284_cond;
     n16_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue;
     n16_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output := n16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_07c7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_07af_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1025_c2_a284] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_cond;
     tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output := tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1038_c7_07af] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_return_output := result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_07af_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_a284_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1025_c2_a284] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_return_output := result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1069_l1021_DUPLICATE_e4e5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1069_l1021_DUPLICATE_e4e5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee25(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_a284_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_a284_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_a284_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_a284_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_a284_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_a284_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_a284_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1069_l1021_DUPLICATE_e4e5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1069_l1021_DUPLICATE_e4e5_return_output;
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
