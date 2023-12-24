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
-- BIN_OP_EQ[uxn_opcodes_h_l71_c6_19a9]
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l71_c2_5c54]
signal tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_5c54]
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_5c54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_5c54]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_5c54]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_5c54]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_5c54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_5c54]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l71_c2_5c54]
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_5c54]
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l71_c2_5c54]
signal t8_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_55f9]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_6a67]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_6a67]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l85_c7_6a67]
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_6a67]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_6a67]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_6a67]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l85_c7_6a67]
signal t8_MUX_uxn_opcodes_h_l85_c7_6a67_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_6a67_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_3d9d]
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_87f9]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_89bc]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_89bc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l90_c7_89bc]
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_89bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_89bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l90_c7_89bc]
signal t8_MUX_uxn_opcodes_h_l90_c7_89bc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_89bc_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l93_c3_6b5f]
signal CONST_SL_8_uxn_opcodes_h_l93_c3_6b5f_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l93_c3_6b5f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l96_c11_e4c0]
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l96_c7_edee]
signal tmp16_MUX_uxn_opcodes_h_l96_c7_edee_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_edee_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_edee_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_edee_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_edee]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l96_c7_edee]
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_edee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l97_c3_be33]
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_be33_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_be33_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_be33_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c22_d3f0]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_2dd1]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_78a2]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_0919]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l99_c22_92b3]
signal MUX_uxn_opcodes_h_l99_c22_92b3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_92b3_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_92b3_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_92b3_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_de89( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9
BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_left,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_right,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l71_c2_5c54
tmp16_MUX_uxn_opcodes_h_l71_c2_5c54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_cond,
tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue,
tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse,
tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54
result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_cond,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output);

-- t8_MUX_uxn_opcodes_h_l71_c2_5c54
t8_MUX_uxn_opcodes_h_l71_c2_5c54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l71_c2_5c54_cond,
t8_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue,
t8_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse,
t8_MUX_uxn_opcodes_h_l71_c2_5c54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9
BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_6a67
tmp16_MUX_uxn_opcodes_h_l85_c7_6a67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67
result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_cond,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_return_output);

-- t8_MUX_uxn_opcodes_h_l85_c7_6a67
t8_MUX_uxn_opcodes_h_l85_c7_6a67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l85_c7_6a67_cond,
t8_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue,
t8_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse,
t8_MUX_uxn_opcodes_h_l85_c7_6a67_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d_left,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d_right,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9
BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_89bc
tmp16_MUX_uxn_opcodes_h_l90_c7_89bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc
result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_cond,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_return_output);

-- t8_MUX_uxn_opcodes_h_l90_c7_89bc
t8_MUX_uxn_opcodes_h_l90_c7_89bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l90_c7_89bc_cond,
t8_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue,
t8_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse,
t8_MUX_uxn_opcodes_h_l90_c7_89bc_return_output);

-- CONST_SL_8_uxn_opcodes_h_l93_c3_6b5f
CONST_SL_8_uxn_opcodes_h_l93_c3_6b5f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l93_c3_6b5f_x,
CONST_SL_8_uxn_opcodes_h_l93_c3_6b5f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0
BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_left,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_right,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l96_c7_edee
tmp16_MUX_uxn_opcodes_h_l96_c7_edee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l96_c7_edee_cond,
tmp16_MUX_uxn_opcodes_h_l96_c7_edee_iftrue,
tmp16_MUX_uxn_opcodes_h_l96_c7_edee_iffalse,
tmp16_MUX_uxn_opcodes_h_l96_c7_edee_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee
result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_cond,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l97_c3_be33
BIN_OP_OR_uxn_opcodes_h_l97_c3_be33 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l97_c3_be33_left,
BIN_OP_OR_uxn_opcodes_h_l97_c3_be33_right,
BIN_OP_OR_uxn_opcodes_h_l97_c3_be33_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0
BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919_return_output);

-- MUX_uxn_opcodes_h_l99_c22_92b3
MUX_uxn_opcodes_h_l99_c22_92b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l99_c22_92b3_cond,
MUX_uxn_opcodes_h_l99_c22_92b3_iftrue,
MUX_uxn_opcodes_h_l99_c22_92b3_iffalse,
MUX_uxn_opcodes_h_l99_c22_92b3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_return_output,
 tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output,
 t8_MUX_uxn_opcodes_h_l71_c2_5c54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_return_output,
 t8_MUX_uxn_opcodes_h_l85_c7_6a67_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_return_output,
 t8_MUX_uxn_opcodes_h_l90_c7_89bc_return_output,
 CONST_SL_8_uxn_opcodes_h_l93_c3_6b5f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_return_output,
 tmp16_MUX_uxn_opcodes_h_l96_c7_edee_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_return_output,
 BIN_OP_OR_uxn_opcodes_h_l97_c3_be33_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919_return_output,
 MUX_uxn_opcodes_h_l99_c22_92b3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_7f58 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_1a23 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_6a67_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_5c54_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_5c54_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l88_c3_56c5 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_e812 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_1916 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_6a67_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_89bc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_6a67_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_edee_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_7240 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_89bc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_89bc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_6b5f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_6b5f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_edee_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_edee_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_edee_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_be33_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_be33_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_be33_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_92b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_92b3_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_92b3_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_92b3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_67b8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_760e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_b379_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_5691_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_de89_uxn_opcodes_h_l66_l103_DUPLICATE_c288_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_7f58 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_7f58;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_1a23 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_1a23;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_7240 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_7240;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_1916 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_1916;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_e812 := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_e812;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_be33_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_edee_iffalse := tmp16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l71_c2_5c54] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_5c54_return_output := result.is_ram_write;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l71_c2_5c54] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_5c54_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_b379 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_b379_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_3d9d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_87f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_2dd1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l90_c7_89bc] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_89bc_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_760e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_760e_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l71_c2_5c54] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_5c54_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_67b8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_67b8_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c22_d3f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l71_c6_19a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_5691 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_5691_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_55f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l85_c7_6a67] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_6a67_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l96_c11_e4c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l71_c2_5c54] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_5c54_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_5c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_19a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_6a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_55f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_89bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_87f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_edee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_e4c0_return_output;
     VAR_MUX_uxn_opcodes_h_l99_c22_92b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_d3f0_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l88_c3_56c5 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3d9d_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l99_c22_92b3_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_2dd1_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_be33_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_b379_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_6b5f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_b379_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_5691_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_5691_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_760e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_760e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_760e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_67b8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_67b8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_67b8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_5c54_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_5c54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_5c54_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_5c54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_89bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_6a67_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue := VAR_result_u16_value_uxn_opcodes_h_l88_c3_56c5;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_edee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_5c54] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_5c54] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_edee] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_return_output;

     -- t8_MUX[uxn_opcodes_h_l90_c7_89bc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l90_c7_89bc_cond <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_89bc_cond;
     t8_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue;
     t8_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_89bc_return_output := t8_MUX_uxn_opcodes_h_l90_c7_89bc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l97_c3_be33] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l97_c3_be33_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_be33_left;
     BIN_OP_OR_uxn_opcodes_h_l97_c3_be33_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_be33_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_be33_return_output := BIN_OP_OR_uxn_opcodes_h_l97_c3_be33_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_5c54] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_6a67] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_89bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l93_c3_6b5f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l93_c3_6b5f_x <= VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_6b5f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_6b5f_return_output := CONST_SL_8_uxn_opcodes_h_l93_c3_6b5f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_5c54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2_right := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_be33_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_edee_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_be33_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_6b5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_edee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_edee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_89bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_6a67_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse := VAR_t8_MUX_uxn_opcodes_h_l90_c7_89bc_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l96_c7_edee] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l96_c7_edee_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_edee_cond;
     tmp16_MUX_uxn_opcodes_h_l96_c7_edee_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_edee_iftrue;
     tmp16_MUX_uxn_opcodes_h_l96_c7_edee_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_edee_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_edee_return_output := tmp16_MUX_uxn_opcodes_h_l96_c7_edee_return_output;

     -- t8_MUX[uxn_opcodes_h_l85_c7_6a67] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l85_c7_6a67_cond <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_6a67_cond;
     t8_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue;
     t8_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_6a67_return_output := t8_MUX_uxn_opcodes_h_l85_c7_6a67_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_5c54] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_89bc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_78a2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_89bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_6a67] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_78a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_89bc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_89bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_6a67_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse := VAR_t8_MUX_uxn_opcodes_h_l85_c7_6a67_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_edee_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l90_c7_89bc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_0919] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_5c54] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_6a67] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_6a67] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_return_output;

     -- t8_MUX[uxn_opcodes_h_l71_c2_5c54] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l71_c2_5c54_cond <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_5c54_cond;
     t8_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue;
     t8_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_5c54_return_output := t8_MUX_uxn_opcodes_h_l71_c2_5c54_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l99_c22_92b3_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_0919_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_6a67_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_6a67_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l71_c2_5c54_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_89bc_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_5c54] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_return_output;

     -- MUX[uxn_opcodes_h_l99_c22_92b3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l99_c22_92b3_cond <= VAR_MUX_uxn_opcodes_h_l99_c22_92b3_cond;
     MUX_uxn_opcodes_h_l99_c22_92b3_iftrue <= VAR_MUX_uxn_opcodes_h_l99_c22_92b3_iftrue;
     MUX_uxn_opcodes_h_l99_c22_92b3_iffalse <= VAR_MUX_uxn_opcodes_h_l99_c22_92b3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l99_c22_92b3_return_output := MUX_uxn_opcodes_h_l99_c22_92b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_5c54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l85_c7_6a67] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_iftrue := VAR_MUX_uxn_opcodes_h_l99_c22_92b3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_6a67_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l71_c2_5c54] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_cond;
     tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue;
     tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_return_output := tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l96_c7_edee] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_cond;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_return_output := result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_edee_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_5c54_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l90_c7_89bc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_return_output := result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_89bc_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l85_c7_6a67] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_cond;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_return_output := result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_6a67_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l71_c2_5c54] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_cond;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_return_output := result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_de89_uxn_opcodes_h_l66_l103_DUPLICATE_c288 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_de89_uxn_opcodes_h_l66_l103_DUPLICATE_c288_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_de89(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_5c54_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_5c54_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_5c54_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_5c54_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_5c54_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_5c54_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_5c54_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_de89_uxn_opcodes_h_l66_l103_DUPLICATE_c288_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_de89_uxn_opcodes_h_l66_l103_DUPLICATE_c288_return_output;
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
