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
entity eor2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_50b92fe2;
architecture arch of eor2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1112_c6_573c]
signal BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1112_c2_4e5a]
signal result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1112_c2_4e5a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1112_c2_4e5a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1112_c2_4e5a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1112_c2_4e5a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1112_c2_4e5a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1112_c2_4e5a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1112_c2_4e5a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1112_c2_4e5a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1112_c2_4e5a]
signal tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1112_c2_4e5a]
signal n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1112_c2_4e5a]
signal t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1125_c11_fc1f]
signal BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1125_c7_4a80]
signal result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1125_c7_4a80]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1125_c7_4a80]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1125_c7_4a80]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1125_c7_4a80]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1125_c7_4a80]
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1125_c7_4a80]
signal n16_MUX_uxn_opcodes_h_l1125_c7_4a80_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1125_c7_4a80]
signal t16_MUX_uxn_opcodes_h_l1125_c7_4a80_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1128_c11_124f]
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1128_c7_94e5]
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1128_c7_94e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1128_c7_94e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1128_c7_94e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1128_c7_94e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1128_c7_94e5]
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1128_c7_94e5]
signal n16_MUX_uxn_opcodes_h_l1128_c7_94e5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1128_c7_94e5]
signal t16_MUX_uxn_opcodes_h_l1128_c7_94e5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1133_c11_6088]
signal BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1133_c7_7010]
signal result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1133_c7_7010]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1133_c7_7010]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1133_c7_7010]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1133_c7_7010]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1133_c7_7010]
signal tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1133_c7_7010]
signal n16_MUX_uxn_opcodes_h_l1133_c7_7010_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1133_c7_7010]
signal t16_MUX_uxn_opcodes_h_l1133_c7_7010_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1134_c3_2f0b]
signal BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1137_c11_77ee]
signal BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1137_c7_0b4a]
signal result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1137_c7_0b4a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1137_c7_0b4a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1137_c7_0b4a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1137_c7_0b4a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1137_c7_0b4a]
signal tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1137_c7_0b4a]
signal n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1141_c11_98d1]
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1141_c7_024b]
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1141_c7_024b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1141_c7_024b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1141_c7_024b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1141_c7_024b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1141_c7_024b]
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1141_c7_024b]
signal n16_MUX_uxn_opcodes_h_l1141_c7_024b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_024b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1142_c3_bf53]
signal BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1143_c11_173f]
signal BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1144_c30_d9f1]
signal sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1149_c11_e40d]
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1149_c7_e28b]
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1149_c7_e28b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1149_c7_e28b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1149_c7_e28b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1152_c31_8e6f]
signal CONST_SR_8_uxn_opcodes_h_l1152_c31_8e6f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1152_c31_8e6f_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1139_l1130_DUPLICATE_5ab8
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1139_l1130_DUPLICATE_5ab8_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1139_l1130_DUPLICATE_5ab8_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_243c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c
BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_left,
BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_right,
BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a
result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a
result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a
result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a
result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a
tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond,
tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output);

-- n16_MUX_uxn_opcodes_h_l1112_c2_4e5a
n16_MUX_uxn_opcodes_h_l1112_c2_4e5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond,
n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue,
n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse,
n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output);

-- t16_MUX_uxn_opcodes_h_l1112_c2_4e5a
t16_MUX_uxn_opcodes_h_l1112_c2_4e5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond,
t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue,
t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse,
t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_left,
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_right,
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80
result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_cond,
result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80
tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_cond,
tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue,
tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse,
tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output);

-- n16_MUX_uxn_opcodes_h_l1125_c7_4a80
n16_MUX_uxn_opcodes_h_l1125_c7_4a80 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1125_c7_4a80_cond,
n16_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue,
n16_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse,
n16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output);

-- t16_MUX_uxn_opcodes_h_l1125_c7_4a80
t16_MUX_uxn_opcodes_h_l1125_c7_4a80 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1125_c7_4a80_cond,
t16_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue,
t16_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse,
t16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_left,
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_right,
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5
result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5
tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_cond,
tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output);

-- n16_MUX_uxn_opcodes_h_l1128_c7_94e5
n16_MUX_uxn_opcodes_h_l1128_c7_94e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1128_c7_94e5_cond,
n16_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue,
n16_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse,
n16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output);

-- t16_MUX_uxn_opcodes_h_l1128_c7_94e5
t16_MUX_uxn_opcodes_h_l1128_c7_94e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1128_c7_94e5_cond,
t16_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue,
t16_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse,
t16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088
BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_left,
BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_right,
BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010
result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_cond,
result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1133_c7_7010
tmp16_MUX_uxn_opcodes_h_l1133_c7_7010 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_cond,
tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue,
tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse,
tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output);

-- n16_MUX_uxn_opcodes_h_l1133_c7_7010
n16_MUX_uxn_opcodes_h_l1133_c7_7010 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1133_c7_7010_cond,
n16_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue,
n16_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse,
n16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output);

-- t16_MUX_uxn_opcodes_h_l1133_c7_7010
t16_MUX_uxn_opcodes_h_l1133_c7_7010 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1133_c7_7010_cond,
t16_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue,
t16_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse,
t16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b
BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b_left,
BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b_right,
BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_left,
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_right,
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a
tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond,
tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output);

-- n16_MUX_uxn_opcodes_h_l1137_c7_0b4a
n16_MUX_uxn_opcodes_h_l1137_c7_0b4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond,
n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue,
n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse,
n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_left,
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_right,
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1141_c7_024b
tmp16_MUX_uxn_opcodes_h_l1141_c7_024b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_cond,
tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_return_output);

-- n16_MUX_uxn_opcodes_h_l1141_c7_024b
n16_MUX_uxn_opcodes_h_l1141_c7_024b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1141_c7_024b_cond,
n16_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue,
n16_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse,
n16_MUX_uxn_opcodes_h_l1141_c7_024b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53
BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53_left,
BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53_right,
BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f
BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f_left,
BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f_right,
BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1
sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_ins,
sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_x,
sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_y,
sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_left,
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_right,
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1152_c31_8e6f
CONST_SR_8_uxn_opcodes_h_l1152_c31_8e6f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1152_c31_8e6f_x,
CONST_SR_8_uxn_opcodes_h_l1152_c31_8e6f_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1139_l1130_DUPLICATE_5ab8
CONST_SL_8_uint16_t_uxn_opcodes_h_l1139_l1130_DUPLICATE_5ab8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1139_l1130_DUPLICATE_5ab8_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1139_l1130_DUPLICATE_5ab8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output,
 n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output,
 t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output,
 tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output,
 n16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output,
 t16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output,
 n16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output,
 t16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_return_output,
 tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output,
 n16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output,
 t16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output,
 n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_return_output,
 n16_MUX_uxn_opcodes_h_l1141_c7_024b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f_return_output,
 sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output,
 CONST_SR_8_uxn_opcodes_h_l1152_c31_8e6f_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1139_l1130_DUPLICATE_5ab8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1122_c3_1395 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1117_c3_1e08 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1126_c3_5a90 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4a80_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4a80_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1131_c3_0847 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_94e5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c7_94e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1135_c3_3268 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1133_c7_7010_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1133_c7_7010_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_024b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1146_c3_078e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_024b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1147_c21_a43c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1150_c3_bc5e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_bf30 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_8e6f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_8e6f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1152_c21_e90d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1128_l1125_l1112_l1149_l1137_l1133_DUPLICATE_5e81_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1128_l1125_l1141_l1137_l1133_DUPLICATE_9d9d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1128_l1125_l1149_l1137_l1133_DUPLICATE_7245_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1128_l1125_l1149_l1141_l1137_l1133_DUPLICATE_d6ca_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1129_l1142_l1138_l1134_DUPLICATE_ccff_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1139_l1130_DUPLICATE_5ab8_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1139_l1130_DUPLICATE_5ab8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1137_l1149_DUPLICATE_fd44_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1108_l1156_DUPLICATE_fcff_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1146_c3_078e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1146_c3_078e;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1117_c3_1e08 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1117_c3_1e08;
     VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1131_c3_0847 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1131_c3_0847;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_bf30 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_bf30;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1122_c3_1395 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1122_c3_1395;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1150_c3_bc5e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1150_c3_bc5e;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1126_c3_5a90 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1126_c3_5a90;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1135_c3_3268 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1135_c3_3268;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_8e6f_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1128_l1125_l1149_l1141_l1137_l1133_DUPLICATE_d6ca LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1128_l1125_l1149_l1141_l1137_l1133_DUPLICATE_d6ca_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1112_c2_4e5a] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1112_c2_4e5a_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1112_c2_4e5a] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1112_c2_4e5a_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1125_c11_fc1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1112_c6_573c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1128_l1125_l1112_l1149_l1137_l1133_DUPLICATE_5e81 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1128_l1125_l1112_l1149_l1137_l1133_DUPLICATE_5e81_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l1152_c31_8e6f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1152_c31_8e6f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_8e6f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_8e6f_return_output := CONST_SR_8_uxn_opcodes_h_l1152_c31_8e6f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1137_c11_77ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1149_c11_e40d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1128_c11_124f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1112_c2_4e5a] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1112_c2_4e5a_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1141_c11_98d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1133_c11_6088] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_left;
     BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_return_output := BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1128_l1125_l1149_l1137_l1133_DUPLICATE_7245 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1128_l1125_l1149_l1137_l1133_DUPLICATE_7245_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1144_c30_d9f1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_ins;
     sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_x;
     sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_return_output := sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1137_l1149_DUPLICATE_fd44 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1137_l1149_DUPLICATE_fd44_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1128_l1125_l1141_l1137_l1133_DUPLICATE_9d9d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1128_l1125_l1141_l1137_l1133_DUPLICATE_9d9d_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1112_c2_4e5a] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1112_c2_4e5a_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1129_l1142_l1138_l1134_DUPLICATE_ccff LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1129_l1142_l1138_l1134_DUPLICATE_ccff_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_573c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4a80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4a80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_fc1f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_94e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1128_c7_94e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_124f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1133_c7_7010_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1133_c7_7010_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6088_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_77ee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_024b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_98d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e40d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1129_l1142_l1138_l1134_DUPLICATE_ccff_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1129_l1142_l1138_l1134_DUPLICATE_ccff_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1139_l1130_DUPLICATE_5ab8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1129_l1142_l1138_l1134_DUPLICATE_ccff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1128_l1125_l1149_l1137_l1133_DUPLICATE_7245_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1128_l1125_l1149_l1137_l1133_DUPLICATE_7245_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1128_l1125_l1149_l1137_l1133_DUPLICATE_7245_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1128_l1125_l1149_l1137_l1133_DUPLICATE_7245_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1128_l1125_l1149_l1137_l1133_DUPLICATE_7245_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1128_l1125_l1149_l1141_l1137_l1133_DUPLICATE_d6ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1128_l1125_l1149_l1141_l1137_l1133_DUPLICATE_d6ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1128_l1125_l1149_l1141_l1137_l1133_DUPLICATE_d6ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1128_l1125_l1149_l1141_l1137_l1133_DUPLICATE_d6ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1128_l1125_l1149_l1141_l1137_l1133_DUPLICATE_d6ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1128_l1125_l1149_l1141_l1137_l1133_DUPLICATE_d6ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1128_l1125_l1141_l1137_l1133_DUPLICATE_9d9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1128_l1125_l1141_l1137_l1133_DUPLICATE_9d9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1128_l1125_l1141_l1137_l1133_DUPLICATE_9d9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1128_l1125_l1141_l1137_l1133_DUPLICATE_9d9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1128_l1125_l1141_l1137_l1133_DUPLICATE_9d9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1137_l1149_DUPLICATE_fd44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1137_l1149_DUPLICATE_fd44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1128_l1125_l1112_l1149_l1137_l1133_DUPLICATE_5e81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1128_l1125_l1112_l1149_l1137_l1133_DUPLICATE_5e81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1128_l1125_l1112_l1149_l1137_l1133_DUPLICATE_5e81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1128_l1125_l1112_l1149_l1137_l1133_DUPLICATE_5e81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1128_l1125_l1112_l1149_l1137_l1133_DUPLICATE_5e81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1128_l1125_l1112_l1149_l1137_l1133_DUPLICATE_5e81_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1112_c2_4e5a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1112_c2_4e5a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1112_c2_4e5a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1112_c2_4e5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_d9f1_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1134_c3_2f0b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b_left;
     BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b_return_output := BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1112_c2_4e5a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1112_c2_4e5a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1149_c7_e28b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1149_c7_e28b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1112_c2_4e5a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1112_c2_4e5a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1152_c21_e90d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1152_c21_e90d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_8e6f_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1149_c7_e28b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1142_c3_bf53] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53_left;
     BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53_return_output := BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1139_l1130_DUPLICATE_5ab8 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1139_l1130_DUPLICATE_5ab8_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1139_l1130_DUPLICATE_5ab8_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1139_l1130_DUPLICATE_5ab8_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1139_l1130_DUPLICATE_5ab8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1141_c7_024b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_2f0b_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_bf53_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1152_c21_e90d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1139_l1130_DUPLICATE_5ab8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1139_l1130_DUPLICATE_5ab8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_024b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output;
     -- t16_MUX[uxn_opcodes_h_l1133_c7_7010] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1133_c7_7010_cond <= VAR_t16_MUX_uxn_opcodes_h_l1133_c7_7010_cond;
     t16_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue;
     t16_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output := t16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1149_c7_e28b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1141_c7_024b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1141_c7_024b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1143_c11_173f] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f_left;
     BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f_return_output := BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1141_c7_024b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1141_c7_024b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_024b_cond;
     n16_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue;
     n16_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_024b_return_output := n16_MUX_uxn_opcodes_h_l1141_c7_024b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1141_c7_024b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1137_c7_0b4a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1141_c7_024b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_024b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_024b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_024b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_e28b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1133_c7_7010] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1137_c7_0b4a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1137_c7_0b4a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1141_c7_024b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_cond;
     tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_return_output := tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1147_c21_a43c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1147_c21_a43c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_173f_return_output);

     -- n16_MUX[uxn_opcodes_h_l1137_c7_0b4a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond;
     n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue;
     n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output := n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1128_c7_94e5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1128_c7_94e5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1128_c7_94e5_cond;
     t16_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue;
     t16_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output := t16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1137_c7_0b4a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1147_c21_a43c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_7010_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_024b_return_output;
     -- t16_MUX[uxn_opcodes_h_l1125_c7_4a80] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1125_c7_4a80_cond <= VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4a80_cond;
     t16_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue;
     t16_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output := t16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1141_c7_024b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1128_c7_94e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1133_c7_7010] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1133_c7_7010] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_return_output;

     -- n16_MUX[uxn_opcodes_h_l1133_c7_7010] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1133_c7_7010_cond <= VAR_n16_MUX_uxn_opcodes_h_l1133_c7_7010_cond;
     n16_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue;
     n16_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output := n16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1133_c7_7010] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1137_c7_0b4a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond;
     tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output := tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_7010_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_7010_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_7010_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_024b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1137_c7_0b4a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1128_c7_94e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1133_c7_7010] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_cond;
     tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output := tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1128_c7_94e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1112_c2_4e5a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond;
     t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue;
     t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output := t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1128_c7_94e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1128_c7_94e5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1128_c7_94e5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1128_c7_94e5_cond;
     n16_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue;
     n16_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output := n16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1125_c7_4a80] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_0b4a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_7010_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1133_c7_7010] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_return_output := result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1128_c7_94e5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_cond;
     tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output := tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1125_c7_4a80] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1125_c7_4a80_cond <= VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4a80_cond;
     n16_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue;
     n16_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output := n16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1112_c2_4e5a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1125_c7_4a80] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1125_c7_4a80] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1125_c7_4a80] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_7010_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output;
     -- n16_MUX[uxn_opcodes_h_l1112_c2_4e5a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond;
     n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue;
     n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output := n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1112_c2_4e5a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1125_c7_4a80] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_cond;
     tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output := tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1112_c2_4e5a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1112_c2_4e5a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1128_c7_94e5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_94e5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1112_c2_4e5a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond;
     tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output := tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1125_c7_4a80] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output := result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4a80_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1112_c2_4e5a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1108_l1156_DUPLICATE_fcff LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1108_l1156_DUPLICATE_fcff_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_243c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_4e5a_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1108_l1156_DUPLICATE_fcff_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1108_l1156_DUPLICATE_fcff_return_output;
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
