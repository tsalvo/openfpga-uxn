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
-- BIN_OP_EQ[uxn_opcodes_h_l1128_c6_b9de]
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1128_c2_04d5]
signal n16_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1128_c2_04d5]
signal tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1128_c2_04d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1128_c2_04d5]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1128_c2_04d5]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1128_c2_04d5]
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1128_c2_04d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1128_c2_04d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1128_c2_04d5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1128_c2_04d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1128_c2_04d5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1128_c2_04d5]
signal t16_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1141_c11_cab0]
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1141_c7_cd0f]
signal n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1141_c7_cd0f]
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1141_c7_cd0f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1141_c7_cd0f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1141_c7_cd0f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1141_c7_cd0f]
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1141_c7_cd0f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1141_c7_cd0f]
signal t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1144_c11_877b]
signal BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1144_c7_0ed5]
signal n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1144_c7_0ed5]
signal tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1144_c7_0ed5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1144_c7_0ed5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1144_c7_0ed5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1144_c7_0ed5]
signal result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1144_c7_0ed5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1144_c7_0ed5]
signal t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1149_c11_ec37]
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1149_c7_be0c]
signal n16_MUX_uxn_opcodes_h_l1149_c7_be0c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1149_c7_be0c]
signal tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1149_c7_be0c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1149_c7_be0c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1149_c7_be0c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1149_c7_be0c]
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1149_c7_be0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1149_c7_be0c]
signal t16_MUX_uxn_opcodes_h_l1149_c7_be0c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1150_c3_097b]
signal BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1153_c11_c10b]
signal BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1153_c7_b40a]
signal n16_MUX_uxn_opcodes_h_l1153_c7_b40a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1153_c7_b40a]
signal tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1153_c7_b40a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1153_c7_b40a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1153_c7_b40a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1153_c7_b40a]
signal result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1153_c7_b40a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1157_c11_2faa]
signal BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1157_c7_7172]
signal n16_MUX_uxn_opcodes_h_l1157_c7_7172_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1157_c7_7172_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1157_c7_7172]
signal tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1157_c7_7172]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1157_c7_7172]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1157_c7_7172]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1157_c7_7172]
signal result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1157_c7_7172]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1158_c3_9b98]
signal BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1159_c11_61e6]
signal BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1160_c30_3546]
signal sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1165_c11_5076]
signal BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1165_c7_9f77]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1165_c7_9f77]
signal result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1165_c7_9f77]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1165_c7_9f77]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1168_c31_561e]
signal CONST_SR_8_uxn_opcodes_h_l1168_c31_561e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1168_c31_561e_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_d3a9
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_d3a9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_d3a9_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_188e( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de
BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_left,
BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_right,
BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_return_output);

-- n16_MUX_uxn_opcodes_h_l1128_c2_04d5
n16_MUX_uxn_opcodes_h_l1128_c2_04d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1128_c2_04d5_cond,
n16_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue,
n16_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse,
n16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5
tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_cond,
tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5
result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5
result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5
result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5
result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output);

-- t16_MUX_uxn_opcodes_h_l1128_c2_04d5
t16_MUX_uxn_opcodes_h_l1128_c2_04d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1128_c2_04d5_cond,
t16_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue,
t16_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse,
t16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_left,
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_right,
BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_return_output);

-- n16_MUX_uxn_opcodes_h_l1141_c7_cd0f
n16_MUX_uxn_opcodes_h_l1141_c7_cd0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond,
n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue,
n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse,
n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f
tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond,
tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output);

-- t16_MUX_uxn_opcodes_h_l1141_c7_cd0f
t16_MUX_uxn_opcodes_h_l1141_c7_cd0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond,
t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue,
t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse,
t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b
BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_left,
BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_right,
BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_return_output);

-- n16_MUX_uxn_opcodes_h_l1144_c7_0ed5
n16_MUX_uxn_opcodes_h_l1144_c7_0ed5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond,
n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue,
n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse,
n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5
tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond,
tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5
result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output);

-- t16_MUX_uxn_opcodes_h_l1144_c7_0ed5
t16_MUX_uxn_opcodes_h_l1144_c7_0ed5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond,
t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue,
t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse,
t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_left,
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_right,
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_return_output);

-- n16_MUX_uxn_opcodes_h_l1149_c7_be0c
n16_MUX_uxn_opcodes_h_l1149_c7_be0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1149_c7_be0c_cond,
n16_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue,
n16_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse,
n16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c
tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_cond,
tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output);

-- t16_MUX_uxn_opcodes_h_l1149_c7_be0c
t16_MUX_uxn_opcodes_h_l1149_c7_be0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1149_c7_be0c_cond,
t16_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue,
t16_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse,
t16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b
BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b_left,
BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b_right,
BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b
BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_left,
BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_right,
BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_return_output);

-- n16_MUX_uxn_opcodes_h_l1153_c7_b40a
n16_MUX_uxn_opcodes_h_l1153_c7_b40a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1153_c7_b40a_cond,
n16_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue,
n16_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse,
n16_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a
tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_cond,
tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a
result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_left,
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_right,
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_return_output);

-- n16_MUX_uxn_opcodes_h_l1157_c7_7172
n16_MUX_uxn_opcodes_h_l1157_c7_7172 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1157_c7_7172_cond,
n16_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue,
n16_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse,
n16_MUX_uxn_opcodes_h_l1157_c7_7172_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1157_c7_7172
tmp16_MUX_uxn_opcodes_h_l1157_c7_7172 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_cond,
tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue,
tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse,
tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172
result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_cond,
result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98
BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98_left,
BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98_right,
BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6
BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6_left,
BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6_right,
BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1160_c30_3546
sp_relative_shift_uxn_opcodes_h_l1160_c30_3546 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_ins,
sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_x,
sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_y,
sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076
BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_left,
BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_right,
BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77
result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77
result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_cond,
result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77
result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1168_c31_561e
CONST_SR_8_uxn_opcodes_h_l1168_c31_561e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1168_c31_561e_x,
CONST_SR_8_uxn_opcodes_h_l1168_c31_561e_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_d3a9
CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_d3a9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_d3a9_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_d3a9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_return_output,
 n16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output,
 t16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_return_output,
 n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output,
 t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_return_output,
 n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output,
 t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_return_output,
 n16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output,
 t16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_return_output,
 n16_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_return_output,
 n16_MUX_uxn_opcodes_h_l1157_c7_7172_return_output,
 tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6_return_output,
 sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output,
 CONST_SR_8_uxn_opcodes_h_l1168_c31_561e_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_d3a9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1133_c3_2e55 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1138_c3_6c39 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1128_c2_04d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1142_c3_6d82 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_1b89 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1149_c7_be0c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_708b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1149_c7_be0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7172_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1153_c7_b40a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7172_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_3a05 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1163_c21_a7ef_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1166_c3_825e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1167_c3_6383 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1168_c31_561e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1168_c31_561e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1168_c21_8c26_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1165_l1153_l1149_l1144_l1128_l1141_DUPLICATE_2796_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1165_l1153_l1149_l1144_l1141_DUPLICATE_b05e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1157_l1149_l1144_l1141_DUPLICATE_2e3c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1165_l1153_l1157_l1149_l1144_l1141_DUPLICATE_8775_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1145_l1158_l1150_l1154_DUPLICATE_a50b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_d3a9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_d3a9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1165_l1153_DUPLICATE_0d06_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1172_l1124_DUPLICATE_6d70_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_1b89 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_1b89;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_y := resize(to_signed(-2, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1166_c3_825e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1166_c3_825e;
     VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1142_c3_6d82 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1142_c3_6d82;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_3a05 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_3a05;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1138_c3_6c39 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1138_c3_6c39;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1167_c3_6383 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1167_c3_6383;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_708b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1151_c3_708b;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1133_c3_2e55 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1133_c3_2e55;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1168_c31_561e_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1157_l1149_l1144_l1141_DUPLICATE_2e3c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1157_l1149_l1144_l1141_DUPLICATE_2e3c_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1128_c2_04d5] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1128_c2_04d5_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1157_c11_2faa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1128_c2_04d5] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1128_c2_04d5_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1160_c30_3546] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_ins;
     sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_x;
     sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_return_output := sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1165_l1153_l1157_l1149_l1144_l1141_DUPLICATE_8775 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1165_l1153_l1157_l1149_l1144_l1141_DUPLICATE_8775_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1153_c11_c10b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1128_c2_04d5] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1128_c2_04d5_return_output := result.is_pc_updated;

     -- CONST_SR_8[uxn_opcodes_h_l1168_c31_561e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1168_c31_561e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1168_c31_561e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1168_c31_561e_return_output := CONST_SR_8_uxn_opcodes_h_l1168_c31_561e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1165_c11_5076] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_left;
     BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_return_output := BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1165_l1153_l1149_l1144_l1128_l1141_DUPLICATE_2796 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1165_l1153_l1149_l1144_l1128_l1141_DUPLICATE_2796_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1165_l1153_l1149_l1144_l1141_DUPLICATE_b05e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1165_l1153_l1149_l1144_l1141_DUPLICATE_b05e_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1144_c11_877b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1141_c11_cab0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1165_l1153_DUPLICATE_0d06 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1165_l1153_DUPLICATE_0d06_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1149_c11_ec37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_left;
     BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_return_output := BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1128_c2_04d5] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1128_c2_04d5_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1128_c6_b9de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_left;
     BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_return_output := BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1145_l1158_l1150_l1154_DUPLICATE_a50b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1145_l1158_l1150_l1154_DUPLICATE_a50b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1128_c2_04d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1128_c2_04d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1128_c6_b9de_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1141_c11_cab0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1144_c11_877b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1149_c7_be0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1149_c7_be0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_ec37_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1153_c7_b40a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1153_c11_c10b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_2faa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1165_c11_5076_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1145_l1158_l1150_l1154_DUPLICATE_a50b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1145_l1158_l1150_l1154_DUPLICATE_a50b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_d3a9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1145_l1158_l1150_l1154_DUPLICATE_a50b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1165_l1153_l1149_l1144_l1141_DUPLICATE_b05e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1165_l1153_l1149_l1144_l1141_DUPLICATE_b05e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1165_l1153_l1149_l1144_l1141_DUPLICATE_b05e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1165_l1153_l1149_l1144_l1141_DUPLICATE_b05e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1165_l1153_l1149_l1144_l1141_DUPLICATE_b05e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1165_l1153_l1157_l1149_l1144_l1141_DUPLICATE_8775_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1165_l1153_l1157_l1149_l1144_l1141_DUPLICATE_8775_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1165_l1153_l1157_l1149_l1144_l1141_DUPLICATE_8775_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1165_l1153_l1157_l1149_l1144_l1141_DUPLICATE_8775_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1165_l1153_l1157_l1149_l1144_l1141_DUPLICATE_8775_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1165_l1153_l1157_l1149_l1144_l1141_DUPLICATE_8775_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1157_l1149_l1144_l1141_DUPLICATE_2e3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1157_l1149_l1144_l1141_DUPLICATE_2e3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1157_l1149_l1144_l1141_DUPLICATE_2e3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1157_l1149_l1144_l1141_DUPLICATE_2e3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1153_l1157_l1149_l1144_l1141_DUPLICATE_2e3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1165_l1153_DUPLICATE_0d06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1165_l1153_DUPLICATE_0d06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1165_l1153_l1149_l1144_l1128_l1141_DUPLICATE_2796_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1165_l1153_l1149_l1144_l1128_l1141_DUPLICATE_2796_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1165_l1153_l1149_l1144_l1128_l1141_DUPLICATE_2796_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1165_l1153_l1149_l1144_l1128_l1141_DUPLICATE_2796_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1165_l1153_l1149_l1144_l1128_l1141_DUPLICATE_2796_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1165_l1153_l1149_l1144_l1128_l1141_DUPLICATE_2796_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1128_c2_04d5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1128_c2_04d5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1128_c2_04d5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1128_c2_04d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1160_c30_3546_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l1128_c2_04d5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1165_c7_9f77] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1168_c21_8c26] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1168_c21_8c26_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1168_c31_561e_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1158_c3_9b98] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98_left;
     BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98_return_output := BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1128_c2_04d5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1165_c7_9f77] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1128_c2_04d5] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_d3a9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_d3a9_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_d3a9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_d3a9_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_d3a9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1157_c7_7172] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1165_c7_9f77] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1150_c3_097b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b_left;
     BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b_return_output := BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1128_c2_04d5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1150_c3_097b_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1158_c3_9b98_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1168_c21_8c26_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_d3a9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1146_l1155_DUPLICATE_d3a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_7172_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1157_c7_7172] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_return_output;

     -- t16_MUX[uxn_opcodes_h_l1149_c7_be0c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1149_c7_be0c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1149_c7_be0c_cond;
     t16_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue;
     t16_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output := t16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1159_c11_61e6] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6_left;
     BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6_return_output := BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1157_c7_7172] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1157_c7_7172_cond <= VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7172_cond;
     n16_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue;
     n16_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7172_return_output := n16_MUX_uxn_opcodes_h_l1157_c7_7172_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1165_c7_9f77] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output := result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1157_c7_7172] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1157_c7_7172] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1153_c7_b40a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1157_c7_7172_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_7172_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_7172_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_7172_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1165_c7_9f77_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output;
     -- t16_MUX[uxn_opcodes_h_l1144_c7_0ed5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond;
     t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue;
     t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output := t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1153_c7_b40a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1149_c7_be0c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1153_c7_b40a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1153_c7_b40a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1153_c7_b40a_cond;
     n16_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue;
     n16_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output := n16_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1163_c21_a7ef] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1163_c21_a7ef_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1159_c11_61e6_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1153_c7_b40a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1157_c7_7172] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_cond;
     tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_return_output := tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1153_c7_b40a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1163_c21_a7ef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1157_c7_7172_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1144_c7_0ed5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1153_c7_b40a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_cond;
     tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output := tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1149_c7_be0c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1149_c7_be0c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1149_c7_be0c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1149_c7_be0c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1149_c7_be0c_cond;
     n16_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue;
     n16_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output := n16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1157_c7_7172] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_return_output := result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_return_output;

     -- t16_MUX[uxn_opcodes_h_l1141_c7_cd0f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond;
     t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue;
     t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output := t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1149_c7_be0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1157_c7_7172_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1144_c7_0ed5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1153_c7_b40a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1128_c2_04d5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1128_c2_04d5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1128_c2_04d5_cond;
     t16_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue;
     t16_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output := t16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1144_c7_0ed5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1144_c7_0ed5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond;
     n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue;
     n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output := n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1141_c7_cd0f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1144_c7_0ed5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1149_c7_be0c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_cond;
     tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output := tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1153_c7_b40a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1149_c7_be0c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1144_c7_0ed5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond;
     tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output := tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1141_c7_cd0f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1141_c7_cd0f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1141_c7_cd0f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1141_c7_cd0f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond;
     n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue;
     n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output := n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1128_c2_04d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1149_c7_be0c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1141_c7_cd0f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond;
     tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output := tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1128_c2_04d5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1128_c2_04d5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1128_c2_04d5_cond;
     n16_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue;
     n16_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output := n16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1144_c7_0ed5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1128_c2_04d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1128_c2_04d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1128_c2_04d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1144_c7_0ed5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1128_c2_04d5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_cond;
     tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output := tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1141_c7_cd0f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1141_c7_cd0f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1128_c2_04d5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1172_l1124_DUPLICATE_6d70 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1172_l1124_DUPLICATE_6d70_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_188e(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1128_c2_04d5_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1172_l1124_DUPLICATE_6d70_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1172_l1124_DUPLICATE_6d70_return_output;
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
