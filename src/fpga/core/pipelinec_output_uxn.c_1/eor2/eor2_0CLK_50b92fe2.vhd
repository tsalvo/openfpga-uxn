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
-- BIN_OP_EQ[uxn_opcodes_h_l1112_c6_0344]
signal BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1112_c2_f90a]
signal t16_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1112_c2_f90a]
signal n16_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1112_c2_f90a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1112_c2_f90a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1112_c2_f90a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1112_c2_f90a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1112_c2_f90a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1112_c2_f90a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1112_c2_f90a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1112_c2_f90a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1112_c2_f90a]
signal result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1112_c2_f90a]
signal tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1125_c11_1e74]
signal BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1125_c7_4816]
signal t16_MUX_uxn_opcodes_h_l1125_c7_4816_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1125_c7_4816]
signal n16_MUX_uxn_opcodes_h_l1125_c7_4816_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1125_c7_4816]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1125_c7_4816]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1125_c7_4816]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1125_c7_4816]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1125_c7_4816]
signal result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1125_c7_4816]
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1128_c11_1ad1]
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1128_c7_3705]
signal t16_MUX_uxn_opcodes_h_l1128_c7_3705_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1128_c7_3705]
signal n16_MUX_uxn_opcodes_h_l1128_c7_3705_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1128_c7_3705]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1128_c7_3705]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1128_c7_3705]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1128_c7_3705]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1128_c7_3705]
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1128_c7_3705]
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1133_c11_6f3a]
signal BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1133_c7_df55]
signal t16_MUX_uxn_opcodes_h_l1133_c7_df55_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1133_c7_df55]
signal n16_MUX_uxn_opcodes_h_l1133_c7_df55_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1133_c7_df55]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1133_c7_df55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1133_c7_df55]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1133_c7_df55]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1133_c7_df55]
signal result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1133_c7_df55]
signal tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1134_c3_0d7f]
signal BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1137_c11_1160]
signal BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1137_c7_dfa3]
signal n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1137_c7_dfa3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1137_c7_dfa3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1137_c7_dfa3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1137_c7_dfa3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1137_c7_dfa3]
signal result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1137_c7_dfa3]
signal tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1141_c11_857d]
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1141_c7_3141]
signal n16_MUX_uxn_opcodes_h_l1141_c7_3141_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_3141_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1141_c7_3141]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1141_c7_3141]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1141_c7_3141]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1141_c7_3141]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1141_c7_3141]
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1141_c7_3141]
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1142_c3_dfa9]
signal BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1143_c11_ef9b]
signal BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1144_c30_23a2]
signal sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1149_c11_bd0c]
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1149_c7_64a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1149_c7_64a8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1149_c7_64a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1149_c7_64a8]
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1152_c31_541e]
signal CONST_SR_8_uxn_opcodes_h_l1152_c31_541e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1152_c31_541e_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_a838
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_a838_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_a838_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_04b4( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344
BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_left,
BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_right,
BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_return_output);

-- t16_MUX_uxn_opcodes_h_l1112_c2_f90a
t16_MUX_uxn_opcodes_h_l1112_c2_f90a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1112_c2_f90a_cond,
t16_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue,
t16_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse,
t16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output);

-- n16_MUX_uxn_opcodes_h_l1112_c2_f90a
n16_MUX_uxn_opcodes_h_l1112_c2_f90a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1112_c2_f90a_cond,
n16_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue,
n16_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse,
n16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a
result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a
result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a
result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a
result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a
tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_cond,
tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_left,
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_right,
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_return_output);

-- t16_MUX_uxn_opcodes_h_l1125_c7_4816
t16_MUX_uxn_opcodes_h_l1125_c7_4816 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1125_c7_4816_cond,
t16_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue,
t16_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse,
t16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output);

-- n16_MUX_uxn_opcodes_h_l1125_c7_4816
n16_MUX_uxn_opcodes_h_l1125_c7_4816 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1125_c7_4816_cond,
n16_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue,
n16_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse,
n16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816
result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_cond,
result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1125_c7_4816
tmp16_MUX_uxn_opcodes_h_l1125_c7_4816 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_cond,
tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue,
tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse,
tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_left,
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_right,
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_return_output);

-- t16_MUX_uxn_opcodes_h_l1128_c7_3705
t16_MUX_uxn_opcodes_h_l1128_c7_3705 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1128_c7_3705_cond,
t16_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue,
t16_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse,
t16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output);

-- n16_MUX_uxn_opcodes_h_l1128_c7_3705
n16_MUX_uxn_opcodes_h_l1128_c7_3705 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1128_c7_3705_cond,
n16_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue,
n16_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse,
n16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705
result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_cond,
result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1128_c7_3705
tmp16_MUX_uxn_opcodes_h_l1128_c7_3705 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_cond,
tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue,
tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse,
tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a
BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_left,
BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_right,
BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_return_output);

-- t16_MUX_uxn_opcodes_h_l1133_c7_df55
t16_MUX_uxn_opcodes_h_l1133_c7_df55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1133_c7_df55_cond,
t16_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue,
t16_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse,
t16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output);

-- n16_MUX_uxn_opcodes_h_l1133_c7_df55
n16_MUX_uxn_opcodes_h_l1133_c7_df55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1133_c7_df55_cond,
n16_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue,
n16_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse,
n16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55
result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_cond,
result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1133_c7_df55
tmp16_MUX_uxn_opcodes_h_l1133_c7_df55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_cond,
tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue,
tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse,
tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f
BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f_left,
BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f_right,
BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_left,
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_right,
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_return_output);

-- n16_MUX_uxn_opcodes_h_l1137_c7_dfa3
n16_MUX_uxn_opcodes_h_l1137_c7_dfa3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond,
n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue,
n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse,
n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3
tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond,
tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_left,
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_right,
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_return_output);

-- n16_MUX_uxn_opcodes_h_l1141_c7_3141
n16_MUX_uxn_opcodes_h_l1141_c7_3141 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1141_c7_3141_cond,
n16_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue,
n16_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse,
n16_MUX_uxn_opcodes_h_l1141_c7_3141_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_cond,
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1141_c7_3141
tmp16_MUX_uxn_opcodes_h_l1141_c7_3141 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_cond,
tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue,
tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse,
tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9
BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9_left,
BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9_right,
BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b
BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b_left,
BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b_right,
BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2
sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_ins,
sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_x,
sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_y,
sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_left,
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_right,
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1152_c31_541e
CONST_SR_8_uxn_opcodes_h_l1152_c31_541e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1152_c31_541e_x,
CONST_SR_8_uxn_opcodes_h_l1152_c31_541e_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_a838
CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_a838 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_a838_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_a838_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_return_output,
 t16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output,
 n16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_return_output,
 t16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output,
 n16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_return_output,
 tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_return_output,
 t16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output,
 n16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_return_output,
 tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_return_output,
 t16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output,
 n16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_return_output,
 tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_return_output,
 n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_return_output,
 n16_MUX_uxn_opcodes_h_l1141_c7_3141_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_return_output,
 tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b_return_output,
 sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output,
 CONST_SR_8_uxn_opcodes_h_l1152_c31_541e_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_a838_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1122_c3_9c00 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1117_c3_d456 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4816_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4816_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1126_c3_1a53 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c7_3705_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_3705_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1131_c3_b028 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1133_c7_df55_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1133_c7_df55_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1135_c3_acba : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_3141_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_3141_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1146_c3_0be1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1147_c21_6f2e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1150_c3_e93b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_101f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_541e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_541e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1152_c21_2789_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1125_l1112_l1149_l1137_l1133_l1128_DUPLICATE_f10c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1125_l1149_l1137_l1133_l1128_DUPLICATE_483c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1125_l1149_l1141_l1137_l1133_l1128_DUPLICATE_3fd0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1125_l1141_l1137_l1133_l1128_DUPLICATE_4143_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1129_l1142_l1138_l1134_DUPLICATE_1c34_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_a838_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_a838_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1149_l1137_DUPLICATE_9ddc_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1108_l1156_DUPLICATE_89e9_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1122_c3_9c00 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1122_c3_9c00;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1131_c3_b028 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1131_c3_b028;
     VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1135_c3_acba := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1135_c3_acba;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1150_c3_e93b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1150_c3_e93b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1126_c3_1a53 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1126_c3_1a53;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_101f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_101f;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1117_c3_d456 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1117_c3_d456;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1146_c3_0be1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1146_c3_0be1;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_541e_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1129_l1142_l1138_l1134_DUPLICATE_1c34 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1129_l1142_l1138_l1134_DUPLICATE_1c34_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1112_c2_f90a] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1112_c2_f90a_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1149_c11_bd0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1112_c2_f90a] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1112_c2_f90a_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1112_c2_f90a] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1112_c2_f90a_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1112_c2_f90a] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1112_c2_f90a_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1149_l1137_DUPLICATE_9ddc LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1149_l1137_DUPLICATE_9ddc_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l1152_c31_541e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1152_c31_541e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_541e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_541e_return_output := CONST_SR_8_uxn_opcodes_h_l1152_c31_541e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1112_c6_0344] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_left;
     BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_return_output := BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1144_c30_23a2] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_ins;
     sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_x;
     sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_return_output := sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1141_c11_857d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1125_l1149_l1141_l1137_l1133_l1128_DUPLICATE_3fd0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1125_l1149_l1141_l1137_l1133_l1128_DUPLICATE_3fd0_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1125_l1141_l1137_l1133_l1128_DUPLICATE_4143 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1125_l1141_l1137_l1133_l1128_DUPLICATE_4143_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1125_c11_1e74] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_left;
     BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_return_output := BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1137_c11_1160] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_left;
     BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_return_output := BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1133_c11_6f3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1125_l1112_l1149_l1137_l1133_l1128_DUPLICATE_f10c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1125_l1112_l1149_l1137_l1133_l1128_DUPLICATE_f10c_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1128_c11_1ad1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1125_l1149_l1137_l1133_l1128_DUPLICATE_483c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1125_l1149_l1137_l1133_l1128_DUPLICATE_483c_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1112_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1112_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_0344_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_1e74_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_3705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1128_c7_3705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_1ad1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1133_c7_df55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1133_c7_df55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_6f3a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_1160_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_3141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_857d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_bd0c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1129_l1142_l1138_l1134_DUPLICATE_1c34_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1129_l1142_l1138_l1134_DUPLICATE_1c34_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_a838_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1129_l1142_l1138_l1134_DUPLICATE_1c34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1125_l1149_l1137_l1133_l1128_DUPLICATE_483c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1125_l1149_l1137_l1133_l1128_DUPLICATE_483c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1125_l1149_l1137_l1133_l1128_DUPLICATE_483c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1125_l1149_l1137_l1133_l1128_DUPLICATE_483c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1125_l1149_l1137_l1133_l1128_DUPLICATE_483c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1125_l1149_l1141_l1137_l1133_l1128_DUPLICATE_3fd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1125_l1149_l1141_l1137_l1133_l1128_DUPLICATE_3fd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1125_l1149_l1141_l1137_l1133_l1128_DUPLICATE_3fd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1125_l1149_l1141_l1137_l1133_l1128_DUPLICATE_3fd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1125_l1149_l1141_l1137_l1133_l1128_DUPLICATE_3fd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1125_l1149_l1141_l1137_l1133_l1128_DUPLICATE_3fd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1125_l1141_l1137_l1133_l1128_DUPLICATE_4143_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1125_l1141_l1137_l1133_l1128_DUPLICATE_4143_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1125_l1141_l1137_l1133_l1128_DUPLICATE_4143_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1125_l1141_l1137_l1133_l1128_DUPLICATE_4143_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1125_l1141_l1137_l1133_l1128_DUPLICATE_4143_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1149_l1137_DUPLICATE_9ddc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1149_l1137_DUPLICATE_9ddc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1125_l1112_l1149_l1137_l1133_l1128_DUPLICATE_f10c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1125_l1112_l1149_l1137_l1133_l1128_DUPLICATE_f10c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1125_l1112_l1149_l1137_l1133_l1128_DUPLICATE_f10c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1125_l1112_l1149_l1137_l1133_l1128_DUPLICATE_f10c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1125_l1112_l1149_l1137_l1133_l1128_DUPLICATE_f10c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1125_l1112_l1149_l1137_l1133_l1128_DUPLICATE_f10c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1112_c2_f90a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1112_c2_f90a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1112_c2_f90a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1112_c2_f90a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_23a2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1149_c7_64a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1142_c3_dfa9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9_left;
     BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9_return_output := BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1112_c2_f90a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1112_c2_f90a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_a838 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_a838_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_a838_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_a838_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_a838_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1149_c7_64a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1152_c21_2789] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1152_c21_2789_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_541e_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1149_c7_64a8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1134_c3_0d7f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f_left;
     BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f_return_output := BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1112_c2_f90a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1141_c7_3141] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1112_c2_f90a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_0d7f_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_dfa9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1152_c21_2789_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_a838_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_a838_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_3141_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1141_c7_3141] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1149_c7_64a8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1141_c7_3141] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1141_c7_3141_cond <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_3141_cond;
     n16_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue;
     n16_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_3141_return_output := n16_MUX_uxn_opcodes_h_l1141_c7_3141_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1141_c7_3141] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1143_c11_ef9b] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b_left;
     BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b_return_output := BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1141_c7_3141] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_return_output;

     -- t16_MUX[uxn_opcodes_h_l1133_c7_df55] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1133_c7_df55_cond <= VAR_t16_MUX_uxn_opcodes_h_l1133_c7_df55_cond;
     t16_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue;
     t16_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output := t16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1137_c7_dfa3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1141_c7_3141_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_3141_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_3141_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_3141_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_64a8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1137_c7_dfa3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1128_c7_3705] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1128_c7_3705_cond <= VAR_t16_MUX_uxn_opcodes_h_l1128_c7_3705_cond;
     t16_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue;
     t16_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output := t16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1137_c7_dfa3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1137_c7_dfa3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1141_c7_3141] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_cond;
     tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_return_output := tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1147_c21_6f2e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1147_c21_6f2e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_ef9b_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1133_c7_df55] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_return_output;

     -- n16_MUX[uxn_opcodes_h_l1137_c7_dfa3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond;
     n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue;
     n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output := n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1147_c21_6f2e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_df55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_3141_return_output;
     -- n16_MUX[uxn_opcodes_h_l1133_c7_df55] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1133_c7_df55_cond <= VAR_n16_MUX_uxn_opcodes_h_l1133_c7_df55_cond;
     n16_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue;
     n16_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output := n16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1137_c7_dfa3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond;
     tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output := tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1133_c7_df55] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_return_output;

     -- t16_MUX[uxn_opcodes_h_l1125_c7_4816] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1125_c7_4816_cond <= VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4816_cond;
     t16_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue;
     t16_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output := t16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1133_c7_df55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1128_c7_3705] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1133_c7_df55] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1141_c7_3141] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_return_output := result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_df55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_3705_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_df55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_df55_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_3141_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1128_c7_3705] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_return_output;

     -- n16_MUX[uxn_opcodes_h_l1128_c7_3705] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1128_c7_3705_cond <= VAR_n16_MUX_uxn_opcodes_h_l1128_c7_3705_cond;
     n16_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue;
     n16_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output := n16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1128_c7_3705] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1133_c7_df55] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_cond;
     tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output := tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1128_c7_3705] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1125_c7_4816] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1137_c7_dfa3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1112_c2_f90a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1112_c2_f90a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1112_c2_f90a_cond;
     t16_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue;
     t16_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output := t16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_3705_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_4816_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_3705_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_3705_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_dfa3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_df55_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1125_c7_4816] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1133_c7_df55] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_return_output := result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1125_c7_4816] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_return_output;

     -- n16_MUX[uxn_opcodes_h_l1125_c7_4816] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1125_c7_4816_cond <= VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4816_cond;
     n16_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue;
     n16_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output := n16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1125_c7_4816] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1112_c2_f90a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1128_c7_3705] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_cond;
     tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output := tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_4816_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_4816_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_4816_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_df55_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_3705_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1112_c2_f90a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1128_c7_3705] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_return_output := result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1112_c2_f90a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1125_c7_4816] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_cond;
     tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output := tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1112_c2_f90a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1112_c2_f90a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1112_c2_f90a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1112_c2_f90a_cond;
     n16_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue;
     n16_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output := n16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_3705_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_4816_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1125_c7_4816] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_return_output := result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1112_c2_f90a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_cond;
     tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output := tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_4816_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1112_c2_f90a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1108_l1156_DUPLICATE_89e9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1108_l1156_DUPLICATE_89e9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_04b4(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_f90a_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1108_l1156_DUPLICATE_89e9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1108_l1156_DUPLICATE_89e9_return_output;
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
