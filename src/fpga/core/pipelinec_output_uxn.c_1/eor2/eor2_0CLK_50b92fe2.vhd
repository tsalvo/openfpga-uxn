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
-- BIN_OP_EQ[uxn_opcodes_h_l1112_c6_2816]
signal BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1112_c2_e05b]
signal tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1112_c2_e05b]
signal n16_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1112_c2_e05b]
signal t16_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1112_c2_e05b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1112_c2_e05b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1112_c2_e05b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1112_c2_e05b]
signal result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1112_c2_e05b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1112_c2_e05b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1112_c2_e05b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1112_c2_e05b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1112_c2_e05b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1125_c11_c05e]
signal BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1125_c7_880d]
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1125_c7_880d]
signal n16_MUX_uxn_opcodes_h_l1125_c7_880d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1125_c7_880d]
signal t16_MUX_uxn_opcodes_h_l1125_c7_880d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1125_c7_880d]
signal result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1125_c7_880d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1125_c7_880d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1125_c7_880d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1125_c7_880d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1128_c11_44fe]
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1128_c7_6d4e]
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1128_c7_6d4e]
signal n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1128_c7_6d4e]
signal t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1128_c7_6d4e]
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1128_c7_6d4e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1128_c7_6d4e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1128_c7_6d4e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1128_c7_6d4e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1133_c11_13bb]
signal BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1133_c7_f2a5]
signal tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1133_c7_f2a5]
signal n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1133_c7_f2a5]
signal t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1133_c7_f2a5]
signal result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1133_c7_f2a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1133_c7_f2a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1133_c7_f2a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1133_c7_f2a5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1134_c3_8190]
signal BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1137_c11_6e5d]
signal BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1137_c7_a9f7]
signal tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1137_c7_a9f7]
signal n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1137_c7_a9f7]
signal result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1137_c7_a9f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1137_c7_a9f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1137_c7_a9f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1137_c7_a9f7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1141_c11_82b0]
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1141_c7_f18c]
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1141_c7_f18c]
signal n16_MUX_uxn_opcodes_h_l1141_c7_f18c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1141_c7_f18c]
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1141_c7_f18c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1141_c7_f18c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1141_c7_f18c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1141_c7_f18c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1142_c3_c6d7]
signal BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1143_c11_83a3]
signal BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1144_c30_1bc0]
signal sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1149_c11_9dc9]
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1149_c7_facc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1149_c7_facc]
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1149_c7_facc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1149_c7_facc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1152_c31_7355]
signal CONST_SR_8_uxn_opcodes_h_l1152_c31_7355_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1152_c31_7355_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_0d47
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_0d47_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_0d47_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_375c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816
BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_left,
BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_right,
BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b
tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_cond,
tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output);

-- n16_MUX_uxn_opcodes_h_l1112_c2_e05b
n16_MUX_uxn_opcodes_h_l1112_c2_e05b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1112_c2_e05b_cond,
n16_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue,
n16_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse,
n16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output);

-- t16_MUX_uxn_opcodes_h_l1112_c2_e05b
t16_MUX_uxn_opcodes_h_l1112_c2_e05b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1112_c2_e05b_cond,
t16_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue,
t16_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse,
t16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b
result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b
result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b
result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b
result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_left,
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_right,
BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1125_c7_880d
tmp16_MUX_uxn_opcodes_h_l1125_c7_880d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_cond,
tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output);

-- n16_MUX_uxn_opcodes_h_l1125_c7_880d
n16_MUX_uxn_opcodes_h_l1125_c7_880d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1125_c7_880d_cond,
n16_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue,
n16_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse,
n16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output);

-- t16_MUX_uxn_opcodes_h_l1125_c7_880d
t16_MUX_uxn_opcodes_h_l1125_c7_880d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1125_c7_880d_cond,
t16_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue,
t16_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse,
t16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d
result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_left,
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_right,
BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e
tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond,
tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output);

-- n16_MUX_uxn_opcodes_h_l1128_c7_6d4e
n16_MUX_uxn_opcodes_h_l1128_c7_6d4e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond,
n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue,
n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse,
n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output);

-- t16_MUX_uxn_opcodes_h_l1128_c7_6d4e
t16_MUX_uxn_opcodes_h_l1128_c7_6d4e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond,
t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue,
t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse,
t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e
result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb
BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_left,
BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_right,
BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5
tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond,
tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output);

-- n16_MUX_uxn_opcodes_h_l1133_c7_f2a5
n16_MUX_uxn_opcodes_h_l1133_c7_f2a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond,
n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue,
n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse,
n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output);

-- t16_MUX_uxn_opcodes_h_l1133_c7_f2a5
t16_MUX_uxn_opcodes_h_l1133_c7_f2a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond,
t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue,
t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse,
t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5
result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190
BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190_left,
BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190_right,
BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_left,
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_right,
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7
tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond,
tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output);

-- n16_MUX_uxn_opcodes_h_l1137_c7_a9f7
n16_MUX_uxn_opcodes_h_l1137_c7_a9f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond,
n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue,
n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse,
n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_left,
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_right,
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c
tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_cond,
tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output);

-- n16_MUX_uxn_opcodes_h_l1141_c7_f18c
n16_MUX_uxn_opcodes_h_l1141_c7_f18c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1141_c7_f18c_cond,
n16_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue,
n16_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse,
n16_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7
BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7_left,
BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7_right,
BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3
BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3_left,
BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3_right,
BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0
sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_ins,
sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_x,
sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_y,
sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_left,
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_right,
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1152_c31_7355
CONST_SR_8_uxn_opcodes_h_l1152_c31_7355 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1152_c31_7355_x,
CONST_SR_8_uxn_opcodes_h_l1152_c31_7355_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_0d47
CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_0d47 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_0d47_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_0d47_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_return_output,
 tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output,
 n16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output,
 t16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output,
 n16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output,
 t16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_return_output,
 tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output,
 n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output,
 t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output,
 n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output,
 t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output,
 n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output,
 n16_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3_return_output,
 sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_return_output,
 CONST_SR_8_uxn_opcodes_h_l1152_c31_7355_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_0d47_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1122_c3_4cc4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1117_c3_78ae : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1125_c7_880d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1125_c7_880d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1126_c3_a8b6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1131_c3_a4af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1135_c3_417a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f18c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1146_c3_e079 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1147_c21_5ff7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_404f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1150_c3_8071 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_7355_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_7355_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1152_c21_01f4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1112_l1149_DUPLICATE_3a91_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1149_l1141_DUPLICATE_7a89_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1141_DUPLICATE_f77d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1149_DUPLICATE_f8f4_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1129_l1142_l1134_l1138_DUPLICATE_ea65_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_0d47_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_0d47_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1149_l1137_DUPLICATE_cd14_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1108_l1156_DUPLICATE_a0b7_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1117_c3_78ae := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1117_c3_78ae;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1150_c3_8071 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1150_c3_8071;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1135_c3_417a := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1135_c3_417a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1126_c3_a8b6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1126_c3_a8b6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1146_c3_e079 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1146_c3_e079;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_404f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_404f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1131_c3_a4af := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1131_c3_a4af;
     VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1122_c3_4cc4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1122_c3_4cc4;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_7355_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse := tmp16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1149_DUPLICATE_f8f4 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1149_DUPLICATE_f8f4_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1112_c2_e05b] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1112_c2_e05b_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1112_c2_e05b] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1112_c2_e05b_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1133_c11_13bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1137_c11_6e5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1125_c11_c05e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1144_c30_1bc0] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_ins;
     sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_x;
     sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_return_output := sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1149_l1141_DUPLICATE_7a89 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1149_l1141_DUPLICATE_7a89_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l1152_c31_7355] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1152_c31_7355_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_7355_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_7355_return_output := CONST_SR_8_uxn_opcodes_h_l1152_c31_7355_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1128_c11_44fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1129_l1142_l1134_l1138_DUPLICATE_ea65 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1129_l1142_l1134_l1138_DUPLICATE_ea65_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1141_c11_82b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1112_c6_2816] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_left;
     BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_return_output := BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1112_l1149_DUPLICATE_3a91 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1112_l1149_DUPLICATE_3a91_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1112_c2_e05b] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1112_c2_e05b_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1149_c11_9dc9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1112_c2_e05b] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1112_c2_e05b_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1141_DUPLICATE_f77d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1141_DUPLICATE_f77d_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1149_l1137_DUPLICATE_cd14 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1149_l1137_DUPLICATE_cd14_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1112_c2_e05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1112_c2_e05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1112_c6_2816_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_880d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1125_c7_880d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1125_c11_c05e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c11_44fe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c11_13bb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_6e5d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f18c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_82b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_9dc9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1129_l1142_l1134_l1138_DUPLICATE_ea65_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1129_l1142_l1134_l1138_DUPLICATE_ea65_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_0d47_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1129_l1142_l1134_l1138_DUPLICATE_ea65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1149_DUPLICATE_f8f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1149_DUPLICATE_f8f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1149_DUPLICATE_f8f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1149_DUPLICATE_f8f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1149_DUPLICATE_f8f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1149_l1141_DUPLICATE_7a89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1149_l1141_DUPLICATE_7a89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1149_l1141_DUPLICATE_7a89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1149_l1141_DUPLICATE_7a89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1149_l1141_DUPLICATE_7a89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1149_l1141_DUPLICATE_7a89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1141_DUPLICATE_f77d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1141_DUPLICATE_f77d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1141_DUPLICATE_f77d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1141_DUPLICATE_f77d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1141_DUPLICATE_f77d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1149_l1137_DUPLICATE_cd14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1149_l1137_DUPLICATE_cd14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1112_l1149_DUPLICATE_3a91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1112_l1149_DUPLICATE_3a91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1112_l1149_DUPLICATE_3a91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1112_l1149_DUPLICATE_3a91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1112_l1149_DUPLICATE_3a91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1137_l1133_l1128_l1125_l1112_l1149_DUPLICATE_3a91_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1112_c2_e05b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1112_c2_e05b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1112_c2_e05b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1112_c2_e05b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1144_c30_1bc0_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_0d47 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_0d47_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_0d47_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_0d47_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_0d47_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1112_c2_e05b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1149_c7_facc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1112_c2_e05b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1149_c7_facc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1112_c2_e05b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1141_c7_f18c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1134_c3_8190] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190_left;
     BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190_return_output := BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1152_c21_01f4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1152_c21_01f4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1152_c31_7355_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1142_c3_c6d7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7_left;
     BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7_return_output := BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1149_c7_facc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1112_c2_e05b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1134_c3_8190_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1142_c3_c6d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1152_c21_01f4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_0d47_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1130_l1139_DUPLICATE_0d47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_facc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_facc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_facc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1137_c7_a9f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1133_c7_f2a5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond;
     t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue;
     t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output := t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1149_c7_facc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_return_output;

     -- n16_MUX[uxn_opcodes_h_l1141_c7_f18c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1141_c7_f18c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f18c_cond;
     n16_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue;
     n16_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output := n16_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1141_c7_f18c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1141_c7_f18c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1143_c11_83a3] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3_left;
     BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3_return_output := BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1141_c7_f18c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_facc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1137_c7_a9f7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1137_c7_a9f7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond;
     n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue;
     n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output := n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1128_c7_6d4e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond;
     t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue;
     t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output := t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1137_c7_a9f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1141_c7_f18c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_cond;
     tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output := tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1137_c7_a9f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1147_c21_5ff7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1147_c21_5ff7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1143_c11_83a3_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1133_c7_f2a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1147_c21_5ff7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1133_c7_f2a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1133_c7_f2a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1137_c7_a9f7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond;
     tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output := tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1128_c7_6d4e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1133_c7_f2a5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1125_c7_880d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1125_c7_880d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1125_c7_880d_cond;
     t16_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue;
     t16_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output := t16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1141_c7_f18c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1133_c7_f2a5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond;
     n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue;
     n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output := n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_f18c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1128_c7_6d4e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1133_c7_f2a5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond;
     tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output := tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1125_c7_880d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1128_c7_6d4e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1128_c7_6d4e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond;
     n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue;
     n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output := n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1128_c7_6d4e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1112_c2_e05b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1112_c2_e05b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1112_c2_e05b_cond;
     t16_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue;
     t16_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output := t16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1137_c7_a9f7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1125_c7_880d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1137_c7_a9f7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1125_c7_880d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1125_c7_880d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1125_c7_880d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1125_c7_880d_cond;
     n16_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue;
     n16_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output := n16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1125_c7_880d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1133_c7_f2a5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1128_c7_6d4e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond;
     tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output := tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1112_c2_e05b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1125_c7_880d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1125_c7_880d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1125_c7_880d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1125_c7_880d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1133_c7_f2a5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1112_c2_e05b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1112_c2_e05b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1128_c7_6d4e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1112_c2_e05b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1112_c2_e05b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1112_c2_e05b_cond;
     n16_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue;
     n16_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output := n16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1112_c2_e05b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1125_c7_880d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_cond;
     tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output := tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c7_6d4e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1125_c7_880d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1125_c7_880d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1112_c2_e05b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_cond;
     tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output := tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1125_c7_880d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1112_c2_e05b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1108_l1156_DUPLICATE_a0b7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1108_l1156_DUPLICATE_a0b7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_375c(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1112_c2_e05b_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1108_l1156_DUPLICATE_a0b7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1108_l1156_DUPLICATE_a0b7_return_output;
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
