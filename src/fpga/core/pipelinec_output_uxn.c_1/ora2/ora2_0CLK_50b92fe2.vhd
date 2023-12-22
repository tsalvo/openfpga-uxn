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
-- BIN_OP_EQ[uxn_opcodes_h_l1043_c6_c660]
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1043_c2_1c42]
signal n16_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1043_c2_1c42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1043_c2_1c42]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1043_c2_1c42]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1043_c2_1c42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1043_c2_1c42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1043_c2_1c42]
signal result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1043_c2_1c42]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1043_c2_1c42]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1043_c2_1c42]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1043_c2_1c42]
signal tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1043_c2_1c42]
signal t16_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1056_c11_9436]
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1056_c7_8ae2]
signal n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1056_c7_8ae2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1056_c7_8ae2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1056_c7_8ae2]
signal result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1056_c7_8ae2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1056_c7_8ae2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1056_c7_8ae2]
signal tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1056_c7_8ae2]
signal t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1059_c11_8be4]
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1059_c7_7174]
signal n16_MUX_uxn_opcodes_h_l1059_c7_7174_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1059_c7_7174]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1059_c7_7174]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1059_c7_7174]
signal result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1059_c7_7174]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1059_c7_7174]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1059_c7_7174]
signal tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1059_c7_7174]
signal t16_MUX_uxn_opcodes_h_l1059_c7_7174_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_3d48]
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1064_c7_ae84]
signal n16_MUX_uxn_opcodes_h_l1064_c7_ae84_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1064_c7_ae84]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1064_c7_ae84]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1064_c7_ae84]
signal result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1064_c7_ae84]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1064_c7_ae84]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1064_c7_ae84]
signal tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1064_c7_ae84]
signal t16_MUX_uxn_opcodes_h_l1064_c7_ae84_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1065_c3_0e32]
signal BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_6a41]
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1068_c7_5f5e]
signal n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1068_c7_5f5e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1068_c7_5f5e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1068_c7_5f5e]
signal result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1068_c7_5f5e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1068_c7_5f5e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1068_c7_5f5e]
signal tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1072_c11_4735]
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1072_c7_bd4a]
signal n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1072_c7_bd4a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1072_c7_bd4a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1072_c7_bd4a]
signal result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1072_c7_bd4a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1072_c7_bd4a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1072_c7_bd4a]
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1073_c3_feb0]
signal BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1074_c11_ba18]
signal BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1075_c30_3e84]
signal sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1080_c11_4bc0]
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1080_c7_04be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1080_c7_04be]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1080_c7_04be]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1080_c7_04be]
signal result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1083_c31_2218]
signal CONST_SR_8_uxn_opcodes_h_l1083_c31_2218_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1083_c31_2218_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1061_l1070_DUPLICATE_dbb3
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1061_l1070_DUPLICATE_dbb3_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1061_l1070_DUPLICATE_dbb3_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c580( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660
BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_left,
BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_right,
BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_return_output);

-- n16_MUX_uxn_opcodes_h_l1043_c2_1c42
n16_MUX_uxn_opcodes_h_l1043_c2_1c42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1043_c2_1c42_cond,
n16_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue,
n16_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse,
n16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42
result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42
result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42
result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_cond,
result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42
result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42
result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42
tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_cond,
tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue,
tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse,
tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output);

-- t16_MUX_uxn_opcodes_h_l1043_c2_1c42
t16_MUX_uxn_opcodes_h_l1043_c2_1c42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1043_c2_1c42_cond,
t16_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue,
t16_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse,
t16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_left,
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_right,
BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_return_output);

-- n16_MUX_uxn_opcodes_h_l1056_c7_8ae2
n16_MUX_uxn_opcodes_h_l1056_c7_8ae2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond,
n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue,
n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse,
n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2
result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2
result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2
result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2
tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond,
tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output);

-- t16_MUX_uxn_opcodes_h_l1056_c7_8ae2
t16_MUX_uxn_opcodes_h_l1056_c7_8ae2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond,
t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue,
t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse,
t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_left,
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_right,
BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_return_output);

-- n16_MUX_uxn_opcodes_h_l1059_c7_7174
n16_MUX_uxn_opcodes_h_l1059_c7_7174 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1059_c7_7174_cond,
n16_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue,
n16_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse,
n16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174
result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174
result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_cond,
result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174
result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174
result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1059_c7_7174
tmp16_MUX_uxn_opcodes_h_l1059_c7_7174 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_cond,
tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue,
tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse,
tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output);

-- t16_MUX_uxn_opcodes_h_l1059_c7_7174
t16_MUX_uxn_opcodes_h_l1059_c7_7174 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1059_c7_7174_cond,
t16_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue,
t16_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse,
t16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_left,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_right,
BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_return_output);

-- n16_MUX_uxn_opcodes_h_l1064_c7_ae84
n16_MUX_uxn_opcodes_h_l1064_c7_ae84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1064_c7_ae84_cond,
n16_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue,
n16_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse,
n16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84
result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_cond,
result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84
tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_cond,
tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue,
tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse,
tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output);

-- t16_MUX_uxn_opcodes_h_l1064_c7_ae84
t16_MUX_uxn_opcodes_h_l1064_c7_ae84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1064_c7_ae84_cond,
t16_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue,
t16_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse,
t16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32
BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32_left,
BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32_right,
BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_left,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_right,
BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_return_output);

-- n16_MUX_uxn_opcodes_h_l1068_c7_5f5e
n16_MUX_uxn_opcodes_h_l1068_c7_5f5e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond,
n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue,
n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse,
n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e
result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e
result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e
result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e
tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond,
tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_left,
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_right,
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_return_output);

-- n16_MUX_uxn_opcodes_h_l1072_c7_bd4a
n16_MUX_uxn_opcodes_h_l1072_c7_bd4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond,
n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue,
n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse,
n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a
tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond,
tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0
BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0_left,
BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0_right,
BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18
BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18_left,
BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18_right,
BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84
sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_ins,
sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_x,
sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_y,
sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_left,
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_right,
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_cond,
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1083_c31_2218
CONST_SR_8_uxn_opcodes_h_l1083_c31_2218 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1083_c31_2218_x,
CONST_SR_8_uxn_opcodes_h_l1083_c31_2218_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1061_l1070_DUPLICATE_dbb3
CONST_SL_8_uint16_t_uxn_opcodes_h_l1061_l1070_DUPLICATE_dbb3 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1061_l1070_DUPLICATE_dbb3_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1061_l1070_DUPLICATE_dbb3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_return_output,
 n16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output,
 tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output,
 t16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_return_output,
 n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output,
 t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_return_output,
 n16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_return_output,
 tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output,
 t16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_return_output,
 n16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output,
 tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output,
 t16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_return_output,
 n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_return_output,
 n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18_return_output,
 sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_return_output,
 CONST_SR_8_uxn_opcodes_h_l1083_c31_2218_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1061_l1070_DUPLICATE_dbb3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1053_c3_7394 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1048_c3_a3d2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1043_c2_1c42_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1057_c3_9256 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1059_c7_7174_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1062_c3_5fa7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1059_c7_7174_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1064_c7_ae84_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1066_c3_2ee2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1064_c7_ae84_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1077_c3_82a0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1078_c21_aa1b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_9c95 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1081_c3_a1bc : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1083_c31_2218_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1083_c31_2218_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1083_c21_8533_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1043_l1068_l1064_l1059_l1056_l1080_DUPLICATE_5046_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1072_l1068_l1064_l1059_l1056_l1080_DUPLICATE_1e62_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1072_l1068_l1064_l1059_l1056_DUPLICATE_72a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1068_l1064_l1059_l1056_l1080_DUPLICATE_f150_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1065_l1073_l1060_l1069_DUPLICATE_a905_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1061_l1070_DUPLICATE_dbb3_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1061_l1070_DUPLICATE_dbb3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1080_l1068_DUPLICATE_e182_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1087_l1039_DUPLICATE_1268_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1048_c3_a3d2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1048_c3_a3d2;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1053_c3_7394 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1053_c3_7394;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1081_c3_a1bc := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1081_c3_a1bc;
     VAR_sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_9c95 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_9c95;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1057_c3_9256 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1057_c3_9256;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1066_c3_2ee2 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1066_c3_2ee2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1077_c3_82a0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1077_c3_82a0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1062_c3_5fa7 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1062_c3_5fa7;
     VAR_sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1083_c31_2218_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1056_c11_9436] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_left;
     BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_return_output := BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1072_l1068_l1064_l1059_l1056_DUPLICATE_72a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1072_l1068_l1064_l1059_l1056_DUPLICATE_72a2_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1059_c11_8be4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1068_c11_6a41] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_left;
     BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_return_output := BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1043_c6_c660] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_left;
     BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_return_output := BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1064_c11_3d48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_left;
     BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_return_output := BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1072_c11_4735] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_left;
     BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_return_output := BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1065_l1073_l1060_l1069_DUPLICATE_a905 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1065_l1073_l1060_l1069_DUPLICATE_a905_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1080_c11_4bc0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1043_l1068_l1064_l1059_l1056_l1080_DUPLICATE_5046 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1043_l1068_l1064_l1059_l1056_l1080_DUPLICATE_5046_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1043_c2_1c42] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1043_c2_1c42_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1068_l1064_l1059_l1056_l1080_DUPLICATE_f150 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1068_l1064_l1059_l1056_l1080_DUPLICATE_f150_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l1083_c31_2218] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1083_c31_2218_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1083_c31_2218_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1083_c31_2218_return_output := CONST_SR_8_uxn_opcodes_h_l1083_c31_2218_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1072_l1068_l1064_l1059_l1056_l1080_DUPLICATE_1e62 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1072_l1068_l1064_l1059_l1056_l1080_DUPLICATE_1e62_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1043_c2_1c42] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1043_c2_1c42_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1043_c2_1c42] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1043_c2_1c42_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1080_l1068_DUPLICATE_e182 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1080_l1068_DUPLICATE_e182_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1075_c30_3e84] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_ins;
     sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_x;
     sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_return_output := sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1043_c2_1c42] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1043_c2_1c42_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1043_c2_1c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1043_c2_1c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c6_c660_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1056_c11_9436_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1059_c7_7174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1059_c7_7174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1059_c11_8be4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1064_c7_ae84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1064_c7_ae84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1064_c11_3d48_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1068_c11_6a41_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_4735_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_4bc0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1065_l1073_l1060_l1069_DUPLICATE_a905_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1065_l1073_l1060_l1069_DUPLICATE_a905_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1061_l1070_DUPLICATE_dbb3_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1065_l1073_l1060_l1069_DUPLICATE_a905_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1068_l1064_l1059_l1056_l1080_DUPLICATE_f150_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1068_l1064_l1059_l1056_l1080_DUPLICATE_f150_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1068_l1064_l1059_l1056_l1080_DUPLICATE_f150_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1068_l1064_l1059_l1056_l1080_DUPLICATE_f150_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1068_l1064_l1059_l1056_l1080_DUPLICATE_f150_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1072_l1068_l1064_l1059_l1056_l1080_DUPLICATE_1e62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1072_l1068_l1064_l1059_l1056_l1080_DUPLICATE_1e62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1072_l1068_l1064_l1059_l1056_l1080_DUPLICATE_1e62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1072_l1068_l1064_l1059_l1056_l1080_DUPLICATE_1e62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1072_l1068_l1064_l1059_l1056_l1080_DUPLICATE_1e62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1072_l1068_l1064_l1059_l1056_l1080_DUPLICATE_1e62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1072_l1068_l1064_l1059_l1056_DUPLICATE_72a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1072_l1068_l1064_l1059_l1056_DUPLICATE_72a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1072_l1068_l1064_l1059_l1056_DUPLICATE_72a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1072_l1068_l1064_l1059_l1056_DUPLICATE_72a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1072_l1068_l1064_l1059_l1056_DUPLICATE_72a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1080_l1068_DUPLICATE_e182_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1080_l1068_DUPLICATE_e182_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1043_l1068_l1064_l1059_l1056_l1080_DUPLICATE_5046_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1043_l1068_l1064_l1059_l1056_l1080_DUPLICATE_5046_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1043_l1068_l1064_l1059_l1056_l1080_DUPLICATE_5046_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1043_l1068_l1064_l1059_l1056_l1080_DUPLICATE_5046_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1043_l1068_l1064_l1059_l1056_l1080_DUPLICATE_5046_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1043_l1068_l1064_l1059_l1056_l1080_DUPLICATE_5046_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1043_c2_1c42_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1043_c2_1c42_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1043_c2_1c42_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1043_c2_1c42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1075_c30_3e84_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l1043_c2_1c42] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1080_c7_04be] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1080_c7_04be] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1061_l1070_DUPLICATE_dbb3 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1061_l1070_DUPLICATE_dbb3_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1061_l1070_DUPLICATE_dbb3_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1061_l1070_DUPLICATE_dbb3_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1061_l1070_DUPLICATE_dbb3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1083_c21_8533] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1083_c21_8533_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1083_c31_2218_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1065_c3_0e32] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32_left;
     BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32_return_output := BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1043_c2_1c42] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1080_c7_04be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1073_c3_feb0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0_left;
     BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0_return_output := BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1072_c7_bd4a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1043_c2_1c42] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1043_c2_1c42] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1065_c3_0e32_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c3_feb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1083_c21_8533_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1061_l1070_DUPLICATE_dbb3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1061_l1070_DUPLICATE_dbb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_04be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_04be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_04be_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1072_c7_bd4a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1074_c11_ba18] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18_left;
     BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18_return_output := BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1068_c7_5f5e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1072_c7_bd4a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1064_c7_ae84] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1064_c7_ae84_cond <= VAR_t16_MUX_uxn_opcodes_h_l1064_c7_ae84_cond;
     t16_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue;
     t16_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output := t16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1080_c7_04be] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_return_output := result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_return_output;

     -- n16_MUX[uxn_opcodes_h_l1072_c7_bd4a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond;
     n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue;
     n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output := n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1072_c7_bd4a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_04be_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1078_c21_aa1b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1078_c21_aa1b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1074_c11_ba18_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1068_c7_5f5e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1068_c7_5f5e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1068_c7_5f5e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1059_c7_7174] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1059_c7_7174_cond <= VAR_t16_MUX_uxn_opcodes_h_l1059_c7_7174_cond;
     t16_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue;
     t16_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output := t16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1072_c7_bd4a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond;
     tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output := tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1068_c7_5f5e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond;
     n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue;
     n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output := n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1064_c7_ae84] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1078_c21_aa1b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1064_c7_ae84] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output;

     -- n16_MUX[uxn_opcodes_h_l1064_c7_ae84] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1064_c7_ae84_cond <= VAR_n16_MUX_uxn_opcodes_h_l1064_c7_ae84_cond;
     n16_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue;
     n16_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output := n16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1068_c7_5f5e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond;
     tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output := tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1059_c7_7174] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1072_c7_bd4a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1064_c7_ae84] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output;

     -- t16_MUX[uxn_opcodes_h_l1056_c7_8ae2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond;
     t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue;
     t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output := t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1064_c7_ae84] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1059_c7_7174_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_bd4a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1059_c7_7174] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1056_c7_8ae2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1059_c7_7174] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_return_output;

     -- t16_MUX[uxn_opcodes_h_l1043_c2_1c42] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1043_c2_1c42_cond <= VAR_t16_MUX_uxn_opcodes_h_l1043_c2_1c42_cond;
     t16_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue;
     t16_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output := t16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1059_c7_7174] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1064_c7_ae84] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_cond;
     tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output := tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1068_c7_5f5e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1059_c7_7174] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1059_c7_7174_cond <= VAR_n16_MUX_uxn_opcodes_h_l1059_c7_7174_cond;
     n16_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue;
     n16_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output := n16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1059_c7_7174_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1059_c7_7174_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1059_c7_7174_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1068_c7_5f5e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1059_c7_7174] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_cond;
     tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output := tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1043_c2_1c42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1056_c7_8ae2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1056_c7_8ae2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond;
     n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue;
     n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output := n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1056_c7_8ae2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1064_c7_ae84] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output := result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1056_c7_8ae2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1064_c7_ae84_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1059_c7_7174_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1043_c2_1c42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1043_c2_1c42] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1043_c2_1c42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1059_c7_7174] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_return_output := result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1056_c7_8ae2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond;
     tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output := tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1043_c2_1c42] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1043_c2_1c42_cond <= VAR_n16_MUX_uxn_opcodes_h_l1043_c2_1c42_cond;
     n16_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue;
     n16_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output := n16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1059_c7_7174_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1043_c2_1c42] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_cond;
     tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output := tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1056_c7_8ae2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1056_c7_8ae2_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1043_c2_1c42] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output := result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1087_l1039_DUPLICATE_1268 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1087_l1039_DUPLICATE_1268_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c580(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1043_c2_1c42_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1087_l1039_DUPLICATE_1268_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1087_l1039_DUPLICATE_1268_return_output;
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
