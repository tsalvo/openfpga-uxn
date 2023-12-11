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
-- BIN_OP_EQ[uxn_opcodes_h_l1048_c6_c84e]
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1048_c2_c71c]
signal tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1048_c2_c71c]
signal t16_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1048_c2_c71c]
signal n16_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1048_c2_c71c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1048_c2_c71c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1048_c2_c71c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1048_c2_c71c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1048_c2_c71c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1048_c2_c71c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1048_c2_c71c]
signal result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1048_c2_c71c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1048_c2_c71c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_85e5]
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1061_c7_763f]
signal tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1061_c7_763f]
signal t16_MUX_uxn_opcodes_h_l1061_c7_763f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1061_c7_763f]
signal n16_MUX_uxn_opcodes_h_l1061_c7_763f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1061_c7_763f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1061_c7_763f]
signal result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1061_c7_763f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1061_c7_763f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1061_c7_763f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_6a6d]
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1064_c7_548f]
signal tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1064_c7_548f]
signal t16_MUX_uxn_opcodes_h_l1064_c7_548f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1064_c7_548f]
signal n16_MUX_uxn_opcodes_h_l1064_c7_548f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1064_c7_548f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1064_c7_548f]
signal result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1064_c7_548f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1064_c7_548f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1064_c7_548f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_c0e1]
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1069_c7_c3ee]
signal tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1069_c7_c3ee]
signal t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1069_c7_c3ee]
signal n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1069_c7_c3ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1069_c7_c3ee]
signal result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1069_c7_c3ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1069_c7_c3ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1069_c7_c3ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1070_c3_91f1]
signal BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1073_c11_287b]
signal BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1073_c7_cd81]
signal tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1073_c7_cd81]
signal n16_MUX_uxn_opcodes_h_l1073_c7_cd81_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1073_c7_cd81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1073_c7_cd81]
signal result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1073_c7_cd81]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1073_c7_cd81]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1073_c7_cd81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1077_c11_b978]
signal BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1077_c7_9124]
signal tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1077_c7_9124]
signal n16_MUX_uxn_opcodes_h_l1077_c7_9124_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1077_c7_9124_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1077_c7_9124]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1077_c7_9124]
signal result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1077_c7_9124]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1077_c7_9124]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1077_c7_9124]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1078_c3_579a]
signal BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1079_c11_311e]
signal BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1080_c30_eede]
signal sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1085_c11_3f2f]
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1085_c7_ae3a]
signal result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1085_c7_ae3a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1085_c7_ae3a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1085_c7_ae3a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1088_c31_2c4f]
signal CONST_SR_8_uxn_opcodes_h_l1088_c31_2c4f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1088_c31_2c4f_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_6c91
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_6c91_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_6c91_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_84a2( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e
BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_left,
BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_right,
BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c
tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_cond,
tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output);

-- t16_MUX_uxn_opcodes_h_l1048_c2_c71c
t16_MUX_uxn_opcodes_h_l1048_c2_c71c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1048_c2_c71c_cond,
t16_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue,
t16_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse,
t16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output);

-- n16_MUX_uxn_opcodes_h_l1048_c2_c71c
n16_MUX_uxn_opcodes_h_l1048_c2_c71c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1048_c2_c71c_cond,
n16_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue,
n16_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse,
n16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c
result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c
result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c
result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c
result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_left,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_right,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1061_c7_763f
tmp16_MUX_uxn_opcodes_h_l1061_c7_763f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_cond,
tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output);

-- t16_MUX_uxn_opcodes_h_l1061_c7_763f
t16_MUX_uxn_opcodes_h_l1061_c7_763f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1061_c7_763f_cond,
t16_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue,
t16_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse,
t16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output);

-- n16_MUX_uxn_opcodes_h_l1061_c7_763f
n16_MUX_uxn_opcodes_h_l1061_c7_763f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1061_c7_763f_cond,
n16_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue,
n16_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse,
n16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f
result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f
result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f
result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_left,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_right,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1064_c7_548f
tmp16_MUX_uxn_opcodes_h_l1064_c7_548f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_cond,
tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output);

-- t16_MUX_uxn_opcodes_h_l1064_c7_548f
t16_MUX_uxn_opcodes_h_l1064_c7_548f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1064_c7_548f_cond,
t16_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue,
t16_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse,
t16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output);

-- n16_MUX_uxn_opcodes_h_l1064_c7_548f
n16_MUX_uxn_opcodes_h_l1064_c7_548f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1064_c7_548f_cond,
n16_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue,
n16_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse,
n16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f
result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_left,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_right,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee
tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond,
tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue,
tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse,
tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output);

-- t16_MUX_uxn_opcodes_h_l1069_c7_c3ee
t16_MUX_uxn_opcodes_h_l1069_c7_c3ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond,
t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue,
t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse,
t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output);

-- n16_MUX_uxn_opcodes_h_l1069_c7_c3ee
n16_MUX_uxn_opcodes_h_l1069_c7_c3ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond,
n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue,
n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse,
n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee
result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee
result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond,
result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee
result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1
BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1_left,
BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1_right,
BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b
BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_left,
BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_right,
BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81
tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_cond,
tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue,
tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse,
tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output);

-- n16_MUX_uxn_opcodes_h_l1073_c7_cd81
n16_MUX_uxn_opcodes_h_l1073_c7_cd81 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1073_c7_cd81_cond,
n16_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue,
n16_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse,
n16_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81
result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81
result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_cond,
result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81
result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81
result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978
BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_left,
BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_right,
BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1077_c7_9124
tmp16_MUX_uxn_opcodes_h_l1077_c7_9124 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_cond,
tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue,
tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse,
tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_return_output);

-- n16_MUX_uxn_opcodes_h_l1077_c7_9124
n16_MUX_uxn_opcodes_h_l1077_c7_9124 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1077_c7_9124_cond,
n16_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue,
n16_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse,
n16_MUX_uxn_opcodes_h_l1077_c7_9124_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124
result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124
result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_cond,
result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124
result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124
result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a
BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a_left,
BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a_right,
BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e
BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e_left,
BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e_right,
BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1080_c30_eede
sp_relative_shift_uxn_opcodes_h_l1080_c30_eede : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_ins,
sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_x,
sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_y,
sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_left,
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_right,
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a
result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1088_c31_2c4f
CONST_SR_8_uxn_opcodes_h_l1088_c31_2c4f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1088_c31_2c4f_x,
CONST_SR_8_uxn_opcodes_h_l1088_c31_2c4f_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_6c91
CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_6c91 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_6c91_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_6c91_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output,
 t16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output,
 n16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output,
 t16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output,
 n16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output,
 t16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output,
 n16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output,
 t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output,
 n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output,
 n16_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_return_output,
 tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_return_output,
 n16_MUX_uxn_opcodes_h_l1077_c7_9124_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e_return_output,
 sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output,
 CONST_SR_8_uxn_opcodes_h_l1088_c31_2c4f_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_6c91_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1053_c3_b3ac : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1058_c3_4cf4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1061_c7_763f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1061_c7_763f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1062_c3_6a8a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1064_c7_548f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1064_c7_548f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1067_c3_462b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1071_c3_cbad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9124_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1073_c7_cd81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9124_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_4aa1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1083_c21_cb3b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1086_c3_aa8a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_cfa0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1088_c31_2c4f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1088_c31_2c4f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1088_c21_0048_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1069_l1048_l1085_DUPLICATE_c568_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1077_l1069_l1085_DUPLICATE_ae9e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1069_l1085_DUPLICATE_e3ce_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1077_l1069_DUPLICATE_2cae_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1065_l1070_l1078_l1074_DUPLICATE_cec8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_6c91_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_6c91_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1073_l1085_DUPLICATE_7a8b_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1092_l1044_DUPLICATE_7542_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1053_c3_b3ac := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1053_c3_b3ac;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1058_c3_4cf4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1058_c3_4cf4;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1071_c3_cbad := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1071_c3_cbad;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1067_c3_462b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1067_c3_462b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_4aa1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_4aa1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1062_c3_6a8a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1062_c3_6a8a;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_cfa0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_cfa0;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1086_c3_aa8a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1086_c3_aa8a;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1088_c31_2c4f_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1073_c11_287b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1048_c2_c71c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1048_c2_c71c_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1048_c2_c71c] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1048_c2_c71c_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1073_l1085_DUPLICATE_7a8b LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1073_l1085_DUPLICATE_7a8b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1048_c6_c84e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_6a6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1069_l1085_DUPLICATE_e3ce LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1069_l1085_DUPLICATE_e3ce_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1080_c30_eede] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_ins;
     sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_x;
     sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_return_output := sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1048_c2_c71c] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1048_c2_c71c_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1077_l1069_DUPLICATE_2cae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1077_l1069_DUPLICATE_2cae_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1077_c11_b978] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_left;
     BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_return_output := BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1065_l1070_l1078_l1074_DUPLICATE_cec8 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1065_l1070_l1078_l1074_DUPLICATE_cec8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1048_c2_c71c] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1048_c2_c71c_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1085_c11_3f2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1069_l1048_l1085_DUPLICATE_c568 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1069_l1048_l1085_DUPLICATE_c568_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_c0e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_85e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1077_l1069_l1085_DUPLICATE_ae9e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1077_l1069_l1085_DUPLICATE_ae9e_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l1088_c31_2c4f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1088_c31_2c4f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1088_c31_2c4f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1088_c31_2c4f_return_output := CONST_SR_8_uxn_opcodes_h_l1088_c31_2c4f_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1048_c2_c71c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1048_c2_c71c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_c84e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1061_c7_763f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1061_c7_763f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_85e5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1064_c7_548f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1064_c7_548f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_6a6d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_c0e1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1073_c7_cd81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_287b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_b978_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_3f2f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1065_l1070_l1078_l1074_DUPLICATE_cec8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1065_l1070_l1078_l1074_DUPLICATE_cec8_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_6c91_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1065_l1070_l1078_l1074_DUPLICATE_cec8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1069_l1085_DUPLICATE_e3ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1069_l1085_DUPLICATE_e3ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1069_l1085_DUPLICATE_e3ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1069_l1085_DUPLICATE_e3ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1069_l1085_DUPLICATE_e3ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1077_l1069_l1085_DUPLICATE_ae9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1077_l1069_l1085_DUPLICATE_ae9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1077_l1069_l1085_DUPLICATE_ae9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1077_l1069_l1085_DUPLICATE_ae9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1077_l1069_l1085_DUPLICATE_ae9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1077_l1069_l1085_DUPLICATE_ae9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1077_l1069_DUPLICATE_2cae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1077_l1069_DUPLICATE_2cae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1077_l1069_DUPLICATE_2cae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1077_l1069_DUPLICATE_2cae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1077_l1069_DUPLICATE_2cae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1073_l1085_DUPLICATE_7a8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1073_l1085_DUPLICATE_7a8b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1069_l1048_l1085_DUPLICATE_c568_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1069_l1048_l1085_DUPLICATE_c568_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1069_l1048_l1085_DUPLICATE_c568_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1069_l1048_l1085_DUPLICATE_c568_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1069_l1048_l1085_DUPLICATE_c568_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1064_l1073_l1061_l1069_l1048_l1085_DUPLICATE_c568_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1048_c2_c71c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1048_c2_c71c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1048_c2_c71c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1048_c2_c71c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_eede_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1048_c2_c71c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_6c91 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_6c91_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_6c91_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_6c91_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_6c91_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1070_c3_91f1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1_left;
     BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1_return_output := BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1088_c21_0048] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1088_c21_0048_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1088_c31_2c4f_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1048_c2_c71c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1078_c3_579a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a_left;
     BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a_return_output := BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1048_c2_c71c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1085_c7_ae3a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1048_c2_c71c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1085_c7_ae3a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1077_c7_9124] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1085_c7_ae3a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1070_c3_91f1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1078_c3_579a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1088_c21_0048_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_6c91_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_6c91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9124_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1073_c7_cd81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output;

     -- n16_MUX[uxn_opcodes_h_l1077_c7_9124] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1077_c7_9124_cond <= VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9124_cond;
     n16_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue;
     n16_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9124_return_output := n16_MUX_uxn_opcodes_h_l1077_c7_9124_return_output;

     -- t16_MUX[uxn_opcodes_h_l1069_c7_c3ee] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond <= VAR_t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond;
     t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue;
     t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output := t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1077_c7_9124] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1085_c7_ae3a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1077_c7_9124] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1077_c7_9124] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1079_c11_311e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e_left;
     BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e_return_output := BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9124_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9124_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9124_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_ae3a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1069_c7_c3ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1077_c7_9124] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_cond;
     tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_return_output := tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1073_c7_cd81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output;

     -- t16_MUX[uxn_opcodes_h_l1064_c7_548f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1064_c7_548f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1064_c7_548f_cond;
     t16_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue;
     t16_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output := t16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1083_c21_cb3b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1083_c21_cb3b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c11_311e_return_output);

     -- n16_MUX[uxn_opcodes_h_l1073_c7_cd81] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1073_c7_cd81_cond <= VAR_n16_MUX_uxn_opcodes_h_l1073_c7_cd81_cond;
     n16_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue;
     n16_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output := n16_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1073_c7_cd81] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1073_c7_cd81] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1083_c21_cb3b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9124_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1077_c7_9124] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_return_output := result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1073_c7_cd81] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_cond;
     tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output := tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output;

     -- n16_MUX[uxn_opcodes_h_l1069_c7_c3ee] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond <= VAR_n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond;
     n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue;
     n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output := n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1069_c7_c3ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output;

     -- t16_MUX[uxn_opcodes_h_l1061_c7_763f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1061_c7_763f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1061_c7_763f_cond;
     t16_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue;
     t16_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output := t16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1069_c7_c3ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1064_c7_548f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1069_c7_c3ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_548f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9124_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1064_c7_548f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1061_c7_763f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1048_c2_c71c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1048_c2_c71c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1048_c2_c71c_cond;
     t16_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue;
     t16_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output := t16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1069_c7_c3ee] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond;
     tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output := tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output;

     -- n16_MUX[uxn_opcodes_h_l1064_c7_548f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1064_c7_548f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1064_c7_548f_cond;
     n16_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue;
     n16_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output := n16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1073_c7_cd81] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output := result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1064_c7_548f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1064_c7_548f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_548f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_763f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_548f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_548f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_cd81_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1069_c7_c3ee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output := result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1061_c7_763f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1061_c7_763f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1064_c7_548f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_cond;
     tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output := tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1048_c2_c71c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1061_c7_763f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1061_c7_763f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1061_c7_763f_cond;
     n16_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue;
     n16_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output := n16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1061_c7_763f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_763f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_763f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_763f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_c3ee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_548f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1064_c7_548f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1048_c2_c71c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1048_c2_c71c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1048_c2_c71c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1048_c2_c71c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1048_c2_c71c_cond;
     n16_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue;
     n16_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output := n16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1061_c7_763f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_cond;
     tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output := tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1048_c2_c71c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_548f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_763f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1061_c7_763f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1048_c2_c71c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_cond;
     tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output := tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_763f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1048_c2_c71c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1092_l1044_DUPLICATE_7542 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1092_l1044_DUPLICATE_7542_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_84a2(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_c71c_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1092_l1044_DUPLICATE_7542_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1092_l1044_DUPLICATE_7542_return_output;
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
