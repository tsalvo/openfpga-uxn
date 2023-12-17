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
-- BIN_OP_EQ[uxn_opcodes_h_l1048_c6_3345]
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1048_c2_83cb]
signal tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1048_c2_83cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1048_c2_83cb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1048_c2_83cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1048_c2_83cb]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1048_c2_83cb]
signal result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1048_c2_83cb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1048_c2_83cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1048_c2_83cb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1048_c2_83cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1048_c2_83cb]
signal t16_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1048_c2_83cb]
signal n16_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_8f0e]
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1061_c7_be75]
signal tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1061_c7_be75]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1061_c7_be75]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1061_c7_be75]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1061_c7_be75]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1061_c7_be75]
signal result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1061_c7_be75]
signal t16_MUX_uxn_opcodes_h_l1061_c7_be75_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1061_c7_be75]
signal n16_MUX_uxn_opcodes_h_l1061_c7_be75_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_4234]
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1064_c7_c927]
signal tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1064_c7_c927]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1064_c7_c927]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1064_c7_c927]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1064_c7_c927]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1064_c7_c927]
signal result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1064_c7_c927]
signal t16_MUX_uxn_opcodes_h_l1064_c7_c927_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1064_c7_c927]
signal n16_MUX_uxn_opcodes_h_l1064_c7_c927_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_99ee]
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1069_c7_3f15]
signal tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1069_c7_3f15]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1069_c7_3f15]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1069_c7_3f15]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1069_c7_3f15]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1069_c7_3f15]
signal result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1069_c7_3f15]
signal t16_MUX_uxn_opcodes_h_l1069_c7_3f15_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1069_c7_3f15]
signal n16_MUX_uxn_opcodes_h_l1069_c7_3f15_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1070_c3_98b2]
signal BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1073_c11_af25]
signal BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1073_c7_e1dd]
signal tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1073_c7_e1dd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1073_c7_e1dd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1073_c7_e1dd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1073_c7_e1dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1073_c7_e1dd]
signal result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1073_c7_e1dd]
signal n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1077_c11_331a]
signal BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1077_c7_9e0e]
signal tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1077_c7_9e0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1077_c7_9e0e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1077_c7_9e0e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1077_c7_9e0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1077_c7_9e0e]
signal result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1077_c7_9e0e]
signal n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1078_c3_21d4]
signal BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1079_c11_e7ff]
signal BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1080_c30_f25f]
signal sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1085_c11_6aaf]
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1085_c7_83a9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1085_c7_83a9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1085_c7_83a9]
signal result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1085_c7_83a9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1088_c31_eaf4]
signal CONST_SR_8_uxn_opcodes_h_l1088_c31_eaf4_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1088_c31_eaf4_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_d2f1
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_d2f1_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_d2f1_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e848( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
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
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345
BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_left,
BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_right,
BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb
tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_cond,
tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb
result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb
result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb
result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb
result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output);

-- t16_MUX_uxn_opcodes_h_l1048_c2_83cb
t16_MUX_uxn_opcodes_h_l1048_c2_83cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1048_c2_83cb_cond,
t16_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue,
t16_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse,
t16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output);

-- n16_MUX_uxn_opcodes_h_l1048_c2_83cb
n16_MUX_uxn_opcodes_h_l1048_c2_83cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1048_c2_83cb_cond,
n16_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue,
n16_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse,
n16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_left,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_right,
BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1061_c7_be75
tmp16_MUX_uxn_opcodes_h_l1061_c7_be75 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_cond,
tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue,
tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse,
tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75
result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75
result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75
result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75
result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_cond,
result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_return_output);

-- t16_MUX_uxn_opcodes_h_l1061_c7_be75
t16_MUX_uxn_opcodes_h_l1061_c7_be75 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1061_c7_be75_cond,
t16_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue,
t16_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse,
t16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output);

-- n16_MUX_uxn_opcodes_h_l1061_c7_be75
n16_MUX_uxn_opcodes_h_l1061_c7_be75 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1061_c7_be75_cond,
n16_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue,
n16_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse,
n16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_left,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_right,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1064_c7_c927
tmp16_MUX_uxn_opcodes_h_l1064_c7_c927 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_cond,
tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue,
tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse,
tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927
result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_cond,
result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_return_output);

-- t16_MUX_uxn_opcodes_h_l1064_c7_c927
t16_MUX_uxn_opcodes_h_l1064_c7_c927 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1064_c7_c927_cond,
t16_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue,
t16_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse,
t16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output);

-- n16_MUX_uxn_opcodes_h_l1064_c7_c927
n16_MUX_uxn_opcodes_h_l1064_c7_c927 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1064_c7_c927_cond,
n16_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue,
n16_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse,
n16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_left,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_right,
BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15
tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_cond,
tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue,
tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse,
tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15
result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15
result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15
result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15
result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_cond,
result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output);

-- t16_MUX_uxn_opcodes_h_l1069_c7_3f15
t16_MUX_uxn_opcodes_h_l1069_c7_3f15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1069_c7_3f15_cond,
t16_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue,
t16_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse,
t16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output);

-- n16_MUX_uxn_opcodes_h_l1069_c7_3f15
n16_MUX_uxn_opcodes_h_l1069_c7_3f15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1069_c7_3f15_cond,
n16_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue,
n16_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse,
n16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2
BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2_left,
BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2_right,
BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25
BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_left,
BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_right,
BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd
tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond,
tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue,
tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse,
tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd
result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd
result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd
result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output);

-- n16_MUX_uxn_opcodes_h_l1073_c7_e1dd
n16_MUX_uxn_opcodes_h_l1073_c7_e1dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond,
n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue,
n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse,
n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a
BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_left,
BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_right,
BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e
tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond,
tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e
result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e
result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e
result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output);

-- n16_MUX_uxn_opcodes_h_l1077_c7_9e0e
n16_MUX_uxn_opcodes_h_l1077_c7_9e0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond,
n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue,
n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse,
n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4
BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4_left,
BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4_right,
BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff
BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff_left,
BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff_right,
BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f
sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_ins,
sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_x,
sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_y,
sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_left,
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_right,
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9
result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1088_c31_eaf4
CONST_SR_8_uxn_opcodes_h_l1088_c31_eaf4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1088_c31_eaf4_x,
CONST_SR_8_uxn_opcodes_h_l1088_c31_eaf4_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_d2f1
CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_d2f1 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_d2f1_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_d2f1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_return_output,
 tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output,
 t16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output,
 n16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_return_output,
 t16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output,
 n16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_return_output,
 tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_return_output,
 t16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output,
 n16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_return_output,
 tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output,
 t16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output,
 n16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_return_output,
 tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output,
 n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output,
 n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff_return_output,
 sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output,
 CONST_SR_8_uxn_opcodes_h_l1088_c31_eaf4_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_d2f1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1053_c3_47da : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1058_c3_393f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1048_c2_83cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1062_c3_54df : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1061_c7_be75_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1061_c7_be75_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1067_c3_09ad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1064_c7_c927_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1064_c7_c927_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1071_c3_7af9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1069_c7_3f15_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1069_c7_3f15_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_a3f6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1083_c21_8a39_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_4098 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1086_c3_9630 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1088_c31_eaf4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1088_c31_eaf4_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1088_c21_c981_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1073_l1048_l1061_l1085_l1064_l1069_DUPLICATE_a3a7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1073_l1077_l1061_l1064_l1069_DUPLICATE_79b2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1073_l1061_l1085_l1064_l1069_DUPLICATE_32d0_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1073_l1077_l1061_l1085_l1064_l1069_DUPLICATE_c3fd_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1074_l1070_l1078_l1065_DUPLICATE_fbb2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_d2f1_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_d2f1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1073_l1085_DUPLICATE_3b84_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1092_l1044_DUPLICATE_0fe6_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1053_c3_47da := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1053_c3_47da;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_4098 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_4098;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1062_c3_54df := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1062_c3_54df;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1058_c3_393f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1058_c3_393f;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1086_c3_9630 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1086_c3_9630;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1067_c3_09ad := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1067_c3_09ad;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1071_c3_7af9 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1071_c3_7af9;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_a3f6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_a3f6;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1088_c31_eaf4_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse := tmp16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1073_l1061_l1085_l1064_l1069_DUPLICATE_32d0 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1073_l1061_l1085_l1064_l1069_DUPLICATE_32d0_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1085_c11_6aaf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1073_l1077_l1061_l1064_l1069_DUPLICATE_79b2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1073_l1077_l1061_l1064_l1069_DUPLICATE_79b2_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1048_c2_83cb] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1048_c2_83cb_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1061_c11_8f0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1048_c6_3345] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_left;
     BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_return_output := BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1073_c11_af25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_left;
     BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_return_output := BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1073_l1048_l1061_l1085_l1064_l1069_DUPLICATE_a3a7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1073_l1048_l1061_l1085_l1064_l1069_DUPLICATE_a3a7_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1048_c2_83cb] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1048_c2_83cb_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_4234] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_left;
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_return_output := BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1048_c2_83cb] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1048_c2_83cb_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1080_c30_f25f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_ins;
     sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_x;
     sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_return_output := sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1088_c31_eaf4] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1088_c31_eaf4_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1088_c31_eaf4_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1088_c31_eaf4_return_output := CONST_SR_8_uxn_opcodes_h_l1088_c31_eaf4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1077_c11_331a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1069_c11_99ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1073_l1077_l1061_l1085_l1064_l1069_DUPLICATE_c3fd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1073_l1077_l1061_l1085_l1064_l1069_DUPLICATE_c3fd_return_output := result.is_opc_done;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1048_c2_83cb] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1048_c2_83cb_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1074_l1070_l1078_l1065_DUPLICATE_fbb2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1074_l1070_l1078_l1065_DUPLICATE_fbb2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1073_l1085_DUPLICATE_3b84 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1073_l1085_DUPLICATE_3b84_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1048_c2_83cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1048_c2_83cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c6_3345_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1061_c7_be75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1061_c7_be75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1061_c11_8f0e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1064_c7_c927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1064_c7_c927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_4234_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1069_c7_3f15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1069_c7_3f15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1069_c11_99ee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_af25_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1077_c11_331a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_6aaf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1074_l1070_l1078_l1065_DUPLICATE_fbb2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1074_l1070_l1078_l1065_DUPLICATE_fbb2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_d2f1_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1074_l1070_l1078_l1065_DUPLICATE_fbb2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1073_l1061_l1085_l1064_l1069_DUPLICATE_32d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1073_l1061_l1085_l1064_l1069_DUPLICATE_32d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1073_l1061_l1085_l1064_l1069_DUPLICATE_32d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1073_l1061_l1085_l1064_l1069_DUPLICATE_32d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1073_l1061_l1085_l1064_l1069_DUPLICATE_32d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1073_l1077_l1061_l1085_l1064_l1069_DUPLICATE_c3fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1073_l1077_l1061_l1085_l1064_l1069_DUPLICATE_c3fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1073_l1077_l1061_l1085_l1064_l1069_DUPLICATE_c3fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1073_l1077_l1061_l1085_l1064_l1069_DUPLICATE_c3fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1073_l1077_l1061_l1085_l1064_l1069_DUPLICATE_c3fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1073_l1077_l1061_l1085_l1064_l1069_DUPLICATE_c3fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1073_l1077_l1061_l1064_l1069_DUPLICATE_79b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1073_l1077_l1061_l1064_l1069_DUPLICATE_79b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1073_l1077_l1061_l1064_l1069_DUPLICATE_79b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1073_l1077_l1061_l1064_l1069_DUPLICATE_79b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1073_l1077_l1061_l1064_l1069_DUPLICATE_79b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1073_l1085_DUPLICATE_3b84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1073_l1085_DUPLICATE_3b84_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1073_l1048_l1061_l1085_l1064_l1069_DUPLICATE_a3a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1073_l1048_l1061_l1085_l1064_l1069_DUPLICATE_a3a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1073_l1048_l1061_l1085_l1064_l1069_DUPLICATE_a3a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1073_l1048_l1061_l1085_l1064_l1069_DUPLICATE_a3a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1073_l1048_l1061_l1085_l1064_l1069_DUPLICATE_a3a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1073_l1048_l1061_l1085_l1064_l1069_DUPLICATE_a3a7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1048_c2_83cb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1048_c2_83cb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1048_c2_83cb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1048_c2_83cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1080_c30_f25f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1085_c7_83a9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1070_c3_98b2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2_left;
     BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2_return_output := BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_d2f1 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_d2f1_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_d2f1_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_d2f1_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_d2f1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1085_c7_83a9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1048_c2_83cb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1048_c2_83cb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1078_c3_21d4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4_left;
     BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4_return_output := BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1085_c7_83a9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1088_c21_c981] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1088_c21_c981_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1088_c31_eaf4_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1048_c2_83cb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1048_c2_83cb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1077_c7_9e0e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1070_c3_98b2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1078_c3_21d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1088_c21_c981_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_d2f1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1066_l1075_DUPLICATE_d2f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1077_c7_9e0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1069_c7_3f15] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1069_c7_3f15_cond <= VAR_t16_MUX_uxn_opcodes_h_l1069_c7_3f15_cond;
     t16_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue;
     t16_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output := t16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1085_c7_83a9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1077_c7_9e0e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1073_c7_e1dd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1077_c7_9e0e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond;
     n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue;
     n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output := n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1079_c11_e7ff] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff_left;
     BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff_return_output := BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1077_c7_9e0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1085_c7_83a9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1083_c21_8a39] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1083_c21_8a39_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c11_e7ff_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l1077_c7_9e0e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond;
     tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output := tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1073_c7_e1dd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond;
     n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue;
     n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output := n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1073_c7_e1dd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1073_c7_e1dd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1073_c7_e1dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1069_c7_3f15] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output;

     -- t16_MUX[uxn_opcodes_h_l1064_c7_c927] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1064_c7_c927_cond <= VAR_t16_MUX_uxn_opcodes_h_l1064_c7_c927_cond;
     t16_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue;
     t16_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output := t16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1083_c21_8a39_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1069_c7_3f15] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output;

     -- n16_MUX[uxn_opcodes_h_l1069_c7_3f15] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1069_c7_3f15_cond <= VAR_n16_MUX_uxn_opcodes_h_l1069_c7_3f15_cond;
     n16_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue;
     n16_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output := n16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1064_c7_c927] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1069_c7_3f15] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output;

     -- t16_MUX[uxn_opcodes_h_l1061_c7_be75] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1061_c7_be75_cond <= VAR_t16_MUX_uxn_opcodes_h_l1061_c7_be75_cond;
     t16_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue;
     t16_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output := t16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1077_c7_9e0e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1073_c7_e1dd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond;
     tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output := tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1069_c7_3f15] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_c927_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1077_c7_9e0e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output;
     -- n16_MUX[uxn_opcodes_h_l1064_c7_c927] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1064_c7_c927_cond <= VAR_n16_MUX_uxn_opcodes_h_l1064_c7_c927_cond;
     n16_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue;
     n16_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output := n16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1064_c7_c927] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1064_c7_c927] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1064_c7_c927] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1073_c7_e1dd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1061_c7_be75] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1069_c7_3f15] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_cond;
     tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output := tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output;

     -- t16_MUX[uxn_opcodes_h_l1048_c2_83cb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1048_c2_83cb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1048_c2_83cb_cond;
     t16_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue;
     t16_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output := t16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_c927_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1061_c7_be75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_c927_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_c927_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1073_c7_e1dd_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1064_c7_c927] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_cond;
     tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output := tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1048_c2_83cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1061_c7_be75] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_return_output;

     -- n16_MUX[uxn_opcodes_h_l1061_c7_be75] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1061_c7_be75_cond <= VAR_n16_MUX_uxn_opcodes_h_l1061_c7_be75_cond;
     n16_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue;
     n16_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output := n16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1061_c7_be75] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1061_c7_be75] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1069_c7_3f15] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output := result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1061_c7_be75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1061_c7_be75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1061_c7_be75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1069_c7_3f15_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_c927_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1061_c7_be75] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_cond;
     tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output := tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output;

     -- n16_MUX[uxn_opcodes_h_l1048_c2_83cb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1048_c2_83cb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1048_c2_83cb_cond;
     n16_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue;
     n16_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output := n16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1048_c2_83cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1048_c2_83cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1048_c2_83cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1064_c7_c927] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_return_output := result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_c927_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1061_c7_be75_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1061_c7_be75] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_return_output := result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1048_c2_83cb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_cond;
     tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output := tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1061_c7_be75_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1048_c2_83cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1092_l1044_DUPLICATE_0fe6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1092_l1044_DUPLICATE_0fe6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e848(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c2_83cb_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1092_l1044_DUPLICATE_0fe6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1092_l1044_DUPLICATE_0fe6_return_output;
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
