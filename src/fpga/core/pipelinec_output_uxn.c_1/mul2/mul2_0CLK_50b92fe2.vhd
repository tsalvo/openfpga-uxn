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
entity mul2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul2_0CLK_50b92fe2;
architecture arch of mul2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2027_c6_d6f0]
signal BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2027_c2_4c5e]
signal tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2027_c2_4c5e]
signal t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2027_c2_4c5e]
signal n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2027_c2_4c5e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2027_c2_4c5e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2027_c2_4c5e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2027_c2_4c5e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2027_c2_4c5e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2027_c2_4c5e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2027_c2_4c5e]
signal result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2027_c2_4c5e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2027_c2_4c5e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2040_c11_a057]
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2040_c7_4993]
signal tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2040_c7_4993]
signal t16_MUX_uxn_opcodes_h_l2040_c7_4993_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2040_c7_4993]
signal n16_MUX_uxn_opcodes_h_l2040_c7_4993_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2040_c7_4993]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2040_c7_4993]
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2040_c7_4993]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2040_c7_4993]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2040_c7_4993]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2043_c11_c115]
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2043_c7_756d]
signal tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2043_c7_756d]
signal t16_MUX_uxn_opcodes_h_l2043_c7_756d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2043_c7_756d]
signal n16_MUX_uxn_opcodes_h_l2043_c7_756d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2043_c7_756d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2043_c7_756d]
signal result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2043_c7_756d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2043_c7_756d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2043_c7_756d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_633a]
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2048_c7_ac8e]
signal tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2048_c7_ac8e]
signal t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2048_c7_ac8e]
signal n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2048_c7_ac8e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2048_c7_ac8e]
signal result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2048_c7_ac8e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2048_c7_ac8e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2048_c7_ac8e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2049_c3_46a3]
signal BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2052_c11_b83a]
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2052_c7_8a64]
signal tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2052_c7_8a64]
signal n16_MUX_uxn_opcodes_h_l2052_c7_8a64_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2052_c7_8a64]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2052_c7_8a64]
signal result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2052_c7_8a64]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2052_c7_8a64]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2052_c7_8a64]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2056_c11_f6eb]
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2056_c7_69a6]
signal tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2056_c7_69a6]
signal n16_MUX_uxn_opcodes_h_l2056_c7_69a6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2056_c7_69a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2056_c7_69a6]
signal result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2056_c7_69a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2056_c7_69a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2056_c7_69a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2057_c3_a9e5]
signal BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2058_c11_8a5c]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2059_c30_d32e]
signal sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2064_c11_3c63]
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2064_c7_cba6]
signal result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2064_c7_cba6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2064_c7_cba6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2064_c7_cba6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2067_c31_7fc5]
signal CONST_SR_8_uxn_opcodes_h_l2067_c31_7fc5_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2067_c31_7fc5_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2045_l2054_DUPLICATE_0f2c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2045_l2054_DUPLICATE_0f2c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2045_l2054_DUPLICATE_0f2c_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0
BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_left,
BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_right,
BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e
tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond,
tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output);

-- t16_MUX_uxn_opcodes_h_l2027_c2_4c5e
t16_MUX_uxn_opcodes_h_l2027_c2_4c5e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond,
t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue,
t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse,
t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output);

-- n16_MUX_uxn_opcodes_h_l2027_c2_4c5e
n16_MUX_uxn_opcodes_h_l2027_c2_4c5e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond,
n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue,
n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse,
n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e
result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e
result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e
result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e
result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e
result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e
result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_left,
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_right,
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2040_c7_4993
tmp16_MUX_uxn_opcodes_h_l2040_c7_4993 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_cond,
tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue,
tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse,
tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output);

-- t16_MUX_uxn_opcodes_h_l2040_c7_4993
t16_MUX_uxn_opcodes_h_l2040_c7_4993 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2040_c7_4993_cond,
t16_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue,
t16_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse,
t16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output);

-- n16_MUX_uxn_opcodes_h_l2040_c7_4993
n16_MUX_uxn_opcodes_h_l2040_c7_4993 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2040_c7_4993_cond,
n16_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue,
n16_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse,
n16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_cond,
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_left,
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_right,
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2043_c7_756d
tmp16_MUX_uxn_opcodes_h_l2043_c7_756d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_cond,
tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output);

-- t16_MUX_uxn_opcodes_h_l2043_c7_756d
t16_MUX_uxn_opcodes_h_l2043_c7_756d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2043_c7_756d_cond,
t16_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue,
t16_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse,
t16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output);

-- n16_MUX_uxn_opcodes_h_l2043_c7_756d
n16_MUX_uxn_opcodes_h_l2043_c7_756d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2043_c7_756d_cond,
n16_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue,
n16_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse,
n16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d
result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_left,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_right,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e
tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond,
tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output);

-- t16_MUX_uxn_opcodes_h_l2048_c7_ac8e
t16_MUX_uxn_opcodes_h_l2048_c7_ac8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond,
t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue,
t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse,
t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output);

-- n16_MUX_uxn_opcodes_h_l2048_c7_ac8e
n16_MUX_uxn_opcodes_h_l2048_c7_ac8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond,
n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue,
n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse,
n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3
BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3_left,
BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3_right,
BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_left,
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_right,
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64
tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_cond,
tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue,
tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse,
tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output);

-- n16_MUX_uxn_opcodes_h_l2052_c7_8a64
n16_MUX_uxn_opcodes_h_l2052_c7_8a64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2052_c7_8a64_cond,
n16_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue,
n16_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse,
n16_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64
result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_cond,
result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_left,
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_right,
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6
tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_cond,
tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output);

-- n16_MUX_uxn_opcodes_h_l2056_c7_69a6
n16_MUX_uxn_opcodes_h_l2056_c7_69a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2056_c7_69a6_cond,
n16_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue,
n16_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse,
n16_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5
BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5_left,
BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5_right,
BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e
sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_ins,
sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_x,
sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_y,
sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_left,
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_right,
BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6
result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6
result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2067_c31_7fc5
CONST_SR_8_uxn_opcodes_h_l2067_c31_7fc5 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2067_c31_7fc5_x,
CONST_SR_8_uxn_opcodes_h_l2067_c31_7fc5_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2045_l2054_DUPLICATE_0f2c
CONST_SL_8_uint16_t_uxn_opcodes_h_l2045_l2054_DUPLICATE_0f2c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2045_l2054_DUPLICATE_0f2c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2045_l2054_DUPLICATE_0f2c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output,
 t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output,
 n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_return_output,
 tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output,
 t16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output,
 n16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_return_output,
 tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output,
 t16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output,
 n16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output,
 t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output,
 n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output,
 n16_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_return_output,
 tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output,
 n16_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c_return_output,
 sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output,
 CONST_SR_8_uxn_opcodes_h_l2067_c31_7fc5_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2045_l2054_DUPLICATE_0f2c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2032_c3_08a2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2037_c3_1eb0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2040_c7_4993_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2040_c7_4993_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2041_c3_3d54 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2043_c7_756d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2043_c7_756d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2046_c3_2465 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2050_c3_6164 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2052_c7_8a64_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2058_c3_cda9 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2056_c7_69a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_0960 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2062_c21_9f7f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2065_c3_da18 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_3fcb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2067_c31_7fc5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2067_c31_7fc5_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2067_c21_6901_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2027_l2064_l2052_l2048_l2043_DUPLICATE_f37b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2064_l2056_l2052_l2048_l2043_DUPLICATE_e4ae_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2064_l2052_l2048_l2043_DUPLICATE_78f5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2040_l2056_l2052_l2048_l2043_DUPLICATE_501e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2044_l2057_l2049_l2053_DUPLICATE_ad94_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2045_l2054_DUPLICATE_0f2c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2045_l2054_DUPLICATE_0f2c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2064_l2052_DUPLICATE_b9d6_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2023_l2071_DUPLICATE_555c_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2032_c3_08a2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2032_c3_08a2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2046_c3_2465 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2046_c3_2465;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2065_c3_da18 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2065_c3_da18;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_0960 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_0960;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2050_c3_6164 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2050_c3_6164;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_3fcb := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_3fcb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2041_c3_3d54 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2041_c3_3d54;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2037_c3_1eb0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2037_c3_1eb0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_right := to_unsigned(3, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_right := to_unsigned(5, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2067_c31_7fc5_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2040_l2056_l2052_l2048_l2043_DUPLICATE_501e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2040_l2056_l2052_l2048_l2043_DUPLICATE_501e_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2056_c11_f6eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_633a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2027_c2_4c5e] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2027_c2_4c5e_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2027_c2_4c5e] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2027_c2_4c5e_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2040_c11_a057] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_left;
     BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_return_output := BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2027_c2_4c5e] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2027_c2_4c5e_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2064_l2052_l2048_l2043_DUPLICATE_78f5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2064_l2052_l2048_l2043_DUPLICATE_78f5_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2064_l2052_DUPLICATE_b9d6 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2064_l2052_DUPLICATE_b9d6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2064_c11_3c63] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_left;
     BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_return_output := BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2027_l2064_l2052_l2048_l2043_DUPLICATE_f37b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2027_l2064_l2052_l2048_l2043_DUPLICATE_f37b_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l2059_c30_d32e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_ins;
     sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_x;
     sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_return_output := sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2027_c2_4c5e] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2027_c2_4c5e_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2027_c6_d6f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2044_l2057_l2049_l2053_DUPLICATE_ad94 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2044_l2057_l2049_l2053_DUPLICATE_ad94_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2043_c11_c115] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_left;
     BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_return_output := BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2064_l2056_l2052_l2048_l2043_DUPLICATE_e4ae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2064_l2056_l2052_l2048_l2043_DUPLICATE_e4ae_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l2067_c31_7fc5] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2067_c31_7fc5_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2067_c31_7fc5_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2067_c31_7fc5_return_output := CONST_SR_8_uxn_opcodes_h_l2067_c31_7fc5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2052_c11_b83a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2027_c6_d6f0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2040_c7_4993_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2040_c7_4993_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_a057_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2043_c7_756d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2043_c7_756d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_c115_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_633a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2052_c7_8a64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_b83a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2056_c7_69a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_f6eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2064_c11_3c63_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2044_l2057_l2049_l2053_DUPLICATE_ad94_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2044_l2057_l2049_l2053_DUPLICATE_ad94_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2045_l2054_DUPLICATE_0f2c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2044_l2057_l2049_l2053_DUPLICATE_ad94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2064_l2052_l2048_l2043_DUPLICATE_78f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2064_l2052_l2048_l2043_DUPLICATE_78f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2064_l2052_l2048_l2043_DUPLICATE_78f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2064_l2052_l2048_l2043_DUPLICATE_78f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2064_l2052_l2048_l2043_DUPLICATE_78f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2064_l2056_l2052_l2048_l2043_DUPLICATE_e4ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2064_l2056_l2052_l2048_l2043_DUPLICATE_e4ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2064_l2056_l2052_l2048_l2043_DUPLICATE_e4ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2064_l2056_l2052_l2048_l2043_DUPLICATE_e4ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2064_l2056_l2052_l2048_l2043_DUPLICATE_e4ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2064_l2056_l2052_l2048_l2043_DUPLICATE_e4ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2040_l2056_l2052_l2048_l2043_DUPLICATE_501e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2040_l2056_l2052_l2048_l2043_DUPLICATE_501e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2040_l2056_l2052_l2048_l2043_DUPLICATE_501e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2040_l2056_l2052_l2048_l2043_DUPLICATE_501e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2040_l2056_l2052_l2048_l2043_DUPLICATE_501e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2064_l2052_DUPLICATE_b9d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2064_l2052_DUPLICATE_b9d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2027_l2064_l2052_l2048_l2043_DUPLICATE_f37b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2027_l2064_l2052_l2048_l2043_DUPLICATE_f37b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2027_l2064_l2052_l2048_l2043_DUPLICATE_f37b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2027_l2064_l2052_l2048_l2043_DUPLICATE_f37b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2027_l2064_l2052_l2048_l2043_DUPLICATE_f37b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2027_l2064_l2052_l2048_l2043_DUPLICATE_f37b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2027_c2_4c5e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2027_c2_4c5e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2027_c2_4c5e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2027_c2_4c5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2059_c30_d32e_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2027_c2_4c5e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2049_c3_46a3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3_left;
     BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3_return_output := BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2056_c7_69a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2027_c2_4c5e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2027_c2_4c5e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2067_c21_6901] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2067_c21_6901_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2067_c31_7fc5_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2064_c7_cba6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2064_c7_cba6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2057_c3_a9e5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5_left;
     BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5_return_output := BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2027_c2_4c5e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2064_c7_cba6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2045_l2054_DUPLICATE_0f2c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2045_l2054_DUPLICATE_0f2c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2045_l2054_DUPLICATE_0f2c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2045_l2054_DUPLICATE_0f2c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2045_l2054_DUPLICATE_0f2c_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2049_c3_46a3_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2057_c3_a9e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2067_c21_6901_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2045_l2054_DUPLICATE_0f2c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2045_l2054_DUPLICATE_0f2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2064_c7_cba6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2056_c7_69a6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2056_c7_69a6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2056_c7_69a6_cond;
     n16_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue;
     n16_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output := n16_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output;

     -- t16_MUX[uxn_opcodes_h_l2048_c7_ac8e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond;
     t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue;
     t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output := t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2056_c7_69a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2052_c7_8a64] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2058_c11_8a5c] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2056_c7_69a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2056_c7_69a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2058_c3_cda9 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2058_c11_8a5c_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2064_c7_cba6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue := VAR_tmp16_uxn_opcodes_h_l2058_c3_cda9;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2048_c7_ac8e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2052_c7_8a64] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2052_c7_8a64_cond <= VAR_n16_MUX_uxn_opcodes_h_l2052_c7_8a64_cond;
     n16_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue;
     n16_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output := n16_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2052_c7_8a64] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2056_c7_69a6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_cond;
     tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output := tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2052_c7_8a64] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2062_c21_9f7f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2062_c21_9f7f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l2058_c3_cda9);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2052_c7_8a64] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output;

     -- t16_MUX[uxn_opcodes_h_l2043_c7_756d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2043_c7_756d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2043_c7_756d_cond;
     t16_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue;
     t16_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output := t16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2062_c21_9f7f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output;
     -- n16_MUX[uxn_opcodes_h_l2048_c7_ac8e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond;
     n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue;
     n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output := n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2043_c7_756d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2048_c7_ac8e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2056_c7_69a6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2048_c7_ac8e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2040_c7_4993] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2040_c7_4993_cond <= VAR_t16_MUX_uxn_opcodes_h_l2040_c7_4993_cond;
     t16_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue;
     t16_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output := t16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2048_c7_ac8e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2052_c7_8a64] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_cond;
     tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output := tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_756d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_69a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2043_c7_756d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2048_c7_ac8e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond;
     tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output := tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2040_c7_4993] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2043_c7_756d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2043_c7_756d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2027_c2_4c5e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond;
     t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue;
     t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output := t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2043_c7_756d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2043_c7_756d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2043_c7_756d_cond;
     n16_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue;
     n16_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output := n16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2052_c7_8a64] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output := result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_756d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_4993_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_756d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_756d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2052_c7_8a64_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output;
     -- n16_MUX[uxn_opcodes_h_l2040_c7_4993] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2040_c7_4993_cond <= VAR_n16_MUX_uxn_opcodes_h_l2040_c7_4993_cond;
     n16_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue;
     n16_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output := n16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2027_c2_4c5e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2040_c7_4993] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2040_c7_4993] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2048_c7_ac8e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2040_c7_4993] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2043_c7_756d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_cond;
     tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output := tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_4993_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_4993_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_4993_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_ac8e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_756d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2027_c2_4c5e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2043_c7_756d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2027_c2_4c5e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2040_c7_4993] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_cond;
     tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output := tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2027_c2_4c5e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2027_c2_4c5e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond;
     n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue;
     n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output := n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_756d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2040_c7_4993_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2027_c2_4c5e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond;
     tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output := tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2040_c7_4993] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_return_output := result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_4993_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2027_c2_4c5e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2023_l2071_DUPLICATE_555c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2023_l2071_DUPLICATE_555c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_84a2(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2027_c2_4c5e_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2023_l2071_DUPLICATE_555c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2023_l2071_DUPLICATE_555c_return_output;
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
