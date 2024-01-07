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
-- Submodules: 42
entity jci_0CLK_4351dde2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_4351dde2;
architecture arch of jci_0CLK_4351dde2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l71_c6_30a8]
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_9b4c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_9b4c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l71_c2_9b4c]
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_9b4c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_9b4c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_9b4c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_9b4c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_9b4c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_9b4c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l71_c2_9b4c]
signal tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l71_c2_9b4c]
signal t8_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_65b1]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_dade]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_dade]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_dade]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l85_c7_dade]
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_dade]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_dade]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_dade_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_dade_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_dade_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_dade_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l85_c7_dade]
signal t8_MUX_uxn_opcodes_h_l85_c7_dade_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_dade_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_dade_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_dade_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_e5b0]
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_4fe2]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l90_c7_ce85]
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_ce85]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_ce85]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_ce85]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_ce85]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l90_c7_ce85]
signal t8_MUX_uxn_opcodes_h_l90_c7_ce85_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_ce85_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l93_c3_7532]
signal CONST_SL_8_uxn_opcodes_h_l93_c3_7532_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l93_c3_7532_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l96_c11_76e7]
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l96_c7_a925]
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_a925]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_a925]
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l96_c7_a925]
signal tmp16_MUX_uxn_opcodes_h_l96_c7_a925_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_a925_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_a925_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_a925_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l97_c3_32c9]
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c22_08eb]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_99f3]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_c514]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_8b74]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l99_c22_92a4]
signal MUX_uxn_opcodes_h_l99_c22_92a4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_92a4_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_92a4_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_92a4_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6bdc( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8
BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_left,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_right,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c
result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_cond,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c
tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_cond,
tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue,
tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse,
tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output);

-- t8_MUX_uxn_opcodes_h_l71_c2_9b4c
t8_MUX_uxn_opcodes_h_l71_c2_9b4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l71_c2_9b4c_cond,
t8_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue,
t8_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse,
t8_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1
BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade
result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_cond,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_dade
tmp16_MUX_uxn_opcodes_h_l85_c7_dade : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_dade_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_dade_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_dade_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_dade_return_output);

-- t8_MUX_uxn_opcodes_h_l85_c7_dade
t8_MUX_uxn_opcodes_h_l85_c7_dade : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l85_c7_dade_cond,
t8_MUX_uxn_opcodes_h_l85_c7_dade_iftrue,
t8_MUX_uxn_opcodes_h_l85_c7_dade_iffalse,
t8_MUX_uxn_opcodes_h_l85_c7_dade_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0_left,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0_right,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2
BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85
result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_cond,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_ce85
tmp16_MUX_uxn_opcodes_h_l90_c7_ce85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_return_output);

-- t8_MUX_uxn_opcodes_h_l90_c7_ce85
t8_MUX_uxn_opcodes_h_l90_c7_ce85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l90_c7_ce85_cond,
t8_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue,
t8_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse,
t8_MUX_uxn_opcodes_h_l90_c7_ce85_return_output);

-- CONST_SL_8_uxn_opcodes_h_l93_c3_7532
CONST_SL_8_uxn_opcodes_h_l93_c3_7532 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l93_c3_7532_x,
CONST_SL_8_uxn_opcodes_h_l93_c3_7532_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7
BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_left,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_right,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925
result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_cond,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_return_output);

-- tmp16_MUX_uxn_opcodes_h_l96_c7_a925
tmp16_MUX_uxn_opcodes_h_l96_c7_a925 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l96_c7_a925_cond,
tmp16_MUX_uxn_opcodes_h_l96_c7_a925_iftrue,
tmp16_MUX_uxn_opcodes_h_l96_c7_a925_iffalse,
tmp16_MUX_uxn_opcodes_h_l96_c7_a925_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9
BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9_left,
BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9_right,
BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb
BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74_return_output);

-- MUX_uxn_opcodes_h_l99_c22_92a4
MUX_uxn_opcodes_h_l99_c22_92a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l99_c22_92a4_cond,
MUX_uxn_opcodes_h_l99_c22_92a4_iftrue,
MUX_uxn_opcodes_h_l99_c22_92a4_iffalse,
MUX_uxn_opcodes_h_l99_c22_92a4_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp16,
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output,
 tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output,
 t8_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_dade_return_output,
 t8_MUX_uxn_opcodes_h_l85_c7_dade_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_return_output,
 t8_MUX_uxn_opcodes_h_l90_c7_ce85_return_output,
 CONST_SL_8_uxn_opcodes_h_l93_c3_7532_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_return_output,
 tmp16_MUX_uxn_opcodes_h_l96_c7_a925_return_output,
 BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74_return_output,
 MUX_uxn_opcodes_h_l99_c22_92a4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_a1ad : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_326d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_dade_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_dade_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_9b4c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_c7f7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_e850 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_dade_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l88_c3_ed26 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_dade_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_dade_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_dade_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_dade_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_dade_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_ce85_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_dade_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_1512 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_ce85_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_a925_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_ce85_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_7532_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_7532_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_a925_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_a925_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_a925_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_92a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_92a4_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_92a4_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_92a4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_2e41_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_20c9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_dfdd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_4c7f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6bdc_uxn_opcodes_h_l103_l66_DUPLICATE_41c2_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_326d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_326d;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_c7f7 := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_c7f7;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_a1ad := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_a1ad;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_e850 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_e850;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_1512 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_1512;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_dade_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_dade_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_a925_iffalse := tmp16;
     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_99f3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l90_c7_ce85] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_ce85_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l71_c6_30a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_2e41 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_2e41_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_65b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_4fe2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_dfdd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_dfdd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l71_c2_9b4c] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_9b4c_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_20c9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_20c9_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l96_c11_76e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l71_c2_9b4c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_9b4c_return_output := result.is_stack_index_flipped;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l71_c2_9b4c] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_9b4c_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_e5b0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l71_c2_9b4c] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_9b4c_return_output := result.is_vram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l85_c7_dade] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_dade_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_4c7f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_4c7f_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c22_08eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_9b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_30a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_dade_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_dade_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_65b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_ce85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_4fe2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_a925_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_76e7_return_output;
     VAR_MUX_uxn_opcodes_h_l99_c22_92a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_08eb_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l88_c3_ed26 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e5b0_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l99_c22_92a4_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_99f3_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_dfdd_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_7532_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_dfdd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_4c7f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_4c7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_20c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_20c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_20c9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_2e41_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_2e41_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_2e41_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_9b4c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_9b4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_9b4c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_9b4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_ce85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_dade_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_iftrue := VAR_result_u16_value_uxn_opcodes_h_l88_c3_ed26;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_9b4c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l93_c3_7532] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l93_c3_7532_x <= VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_7532_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_7532_return_output := CONST_SL_8_uxn_opcodes_h_l93_c3_7532_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_a925] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_a925] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_dade] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l97_c3_32c9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9_left;
     BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9_return_output := BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_ce85] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_9b4c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_9b4c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output;

     -- t8_MUX[uxn_opcodes_h_l90_c7_ce85] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l90_c7_ce85_cond <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_ce85_cond;
     t8_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue;
     t8_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_ce85_return_output := t8_MUX_uxn_opcodes_h_l90_c7_ce85_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_9b4c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514_right := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_a925_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_32c9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_7532_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_a925_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_a925_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ce85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_dade_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_dade_iffalse := VAR_t8_MUX_uxn_opcodes_h_l90_c7_ce85_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l96_c7_a925] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l96_c7_a925_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_a925_cond;
     tmp16_MUX_uxn_opcodes_h_l96_c7_a925_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_a925_iftrue;
     tmp16_MUX_uxn_opcodes_h_l96_c7_a925_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_a925_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_a925_return_output := tmp16_MUX_uxn_opcodes_h_l96_c7_a925_return_output;

     -- t8_MUX[uxn_opcodes_h_l85_c7_dade] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l85_c7_dade_cond <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_dade_cond;
     t8_MUX_uxn_opcodes_h_l85_c7_dade_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_dade_iftrue;
     t8_MUX_uxn_opcodes_h_l85_c7_dade_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_dade_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_dade_return_output := t8_MUX_uxn_opcodes_h_l85_c7_dade_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_9b4c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_dade] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_c514] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_ce85] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_ce85] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c514_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ce85_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ce85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_dade_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l85_c7_dade_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_a925_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l90_c7_ce85] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_9b4c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output;

     -- t8_MUX[uxn_opcodes_h_l71_c2_9b4c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l71_c2_9b4c_cond <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_9b4c_cond;
     t8_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue;
     t8_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output := t8_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_dade] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_8b74] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_dade] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l99_c22_92a4_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8b74_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_dade_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_dade_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_dade_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ce85_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_9b4c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output;

     -- MUX[uxn_opcodes_h_l99_c22_92a4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l99_c22_92a4_cond <= VAR_MUX_uxn_opcodes_h_l99_c22_92a4_cond;
     MUX_uxn_opcodes_h_l99_c22_92a4_iftrue <= VAR_MUX_uxn_opcodes_h_l99_c22_92a4_iftrue;
     MUX_uxn_opcodes_h_l99_c22_92a4_iffalse <= VAR_MUX_uxn_opcodes_h_l99_c22_92a4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l99_c22_92a4_return_output := MUX_uxn_opcodes_h_l99_c22_92a4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_9b4c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l85_c7_dade] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_dade_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_dade_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_dade_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_dade_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_dade_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_dade_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_dade_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_dade_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_iftrue := VAR_MUX_uxn_opcodes_h_l99_c22_92a4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_dade_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l71_c2_9b4c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_cond;
     tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output := tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l96_c7_a925] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_cond;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_return_output := result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_a925_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l90_c7_ce85] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_cond;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_return_output := result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ce85_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l85_c7_dade] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_cond;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_return_output := result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_dade_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l71_c2_9b4c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output := result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6bdc_uxn_opcodes_h_l103_l66_DUPLICATE_41c2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6bdc_uxn_opcodes_h_l103_l66_DUPLICATE_41c2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6bdc(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_9b4c_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6bdc_uxn_opcodes_h_l103_l66_DUPLICATE_41c2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6bdc_uxn_opcodes_h_l103_l66_DUPLICATE_41c2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
