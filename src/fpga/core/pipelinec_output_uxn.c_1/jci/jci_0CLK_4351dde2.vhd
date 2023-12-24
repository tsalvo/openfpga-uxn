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
-- BIN_OP_EQ[uxn_opcodes_h_l71_c6_df25]
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l71_c2_23b9]
signal tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l71_c2_23b9]
signal t8_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_23b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_23b9]
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_23b9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_23b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l71_c2_23b9]
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_23b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_23b9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_23b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_23b9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_466e]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_4ce3]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l85_c7_4ce3]
signal t8_MUX_uxn_opcodes_h_l85_c7_4ce3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l85_c7_4ce3]
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_4ce3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_4ce3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_4ce3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_4ce3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_84c6]
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_159c]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_703d]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_703d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_703d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_703d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_703d_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l90_c7_703d]
signal t8_MUX_uxn_opcodes_h_l90_c7_703d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_703d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_703d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_703d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l90_c7_703d]
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_703d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_703d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_703d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l93_c3_f479]
signal CONST_SL_8_uxn_opcodes_h_l93_c3_f479_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l93_c3_f479_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l96_c11_6569]
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l96_c7_f453]
signal tmp16_MUX_uxn_opcodes_h_l96_c7_f453_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_f453_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_f453_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_f453_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l96_c7_f453]
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_f453]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_f453]
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l97_c3_f6cf]
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c22_8c57]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_9084]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_7bca]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_8954]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l99_c22_c540]
signal MUX_uxn_opcodes_h_l99_c22_c540_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_c540_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_c540_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_c540_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_cbec( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25
BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_left,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_right,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_return_output);

-- tmp16_MUX_uxn_opcodes_h_l71_c2_23b9
tmp16_MUX_uxn_opcodes_h_l71_c2_23b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_cond,
tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue,
tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse,
tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_return_output);

-- t8_MUX_uxn_opcodes_h_l71_c2_23b9
t8_MUX_uxn_opcodes_h_l71_c2_23b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l71_c2_23b9_cond,
t8_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue,
t8_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse,
t8_MUX_uxn_opcodes_h_l71_c2_23b9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9
result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_cond,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e
BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3
tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output);

-- t8_MUX_uxn_opcodes_h_l85_c7_4ce3
t8_MUX_uxn_opcodes_h_l85_c7_4ce3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l85_c7_4ce3_cond,
t8_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue,
t8_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse,
t8_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3
result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_cond,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6_left,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6_right,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c
BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_703d
tmp16_MUX_uxn_opcodes_h_l90_c7_703d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_703d_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_703d_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_703d_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_703d_return_output);

-- t8_MUX_uxn_opcodes_h_l90_c7_703d
t8_MUX_uxn_opcodes_h_l90_c7_703d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l90_c7_703d_cond,
t8_MUX_uxn_opcodes_h_l90_c7_703d_iftrue,
t8_MUX_uxn_opcodes_h_l90_c7_703d_iffalse,
t8_MUX_uxn_opcodes_h_l90_c7_703d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d
result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_cond,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l93_c3_f479
CONST_SL_8_uxn_opcodes_h_l93_c3_f479 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l93_c3_f479_x,
CONST_SL_8_uxn_opcodes_h_l93_c3_f479_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569
BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_left,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_right,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_return_output);

-- tmp16_MUX_uxn_opcodes_h_l96_c7_f453
tmp16_MUX_uxn_opcodes_h_l96_c7_f453 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l96_c7_f453_cond,
tmp16_MUX_uxn_opcodes_h_l96_c7_f453_iftrue,
tmp16_MUX_uxn_opcodes_h_l96_c7_f453_iffalse,
tmp16_MUX_uxn_opcodes_h_l96_c7_f453_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453
result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_cond,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf
BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf_left,
BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf_right,
BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57
BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954_return_output);

-- MUX_uxn_opcodes_h_l99_c22_c540
MUX_uxn_opcodes_h_l99_c22_c540 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l99_c22_c540_cond,
MUX_uxn_opcodes_h_l99_c22_c540_iftrue,
MUX_uxn_opcodes_h_l99_c22_c540_iffalse,
MUX_uxn_opcodes_h_l99_c22_c540_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_return_output,
 tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_return_output,
 t8_MUX_uxn_opcodes_h_l71_c2_23b9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output,
 t8_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_703d_return_output,
 t8_MUX_uxn_opcodes_h_l90_c7_703d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_return_output,
 CONST_SL_8_uxn_opcodes_h_l93_c3_f479_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_return_output,
 tmp16_MUX_uxn_opcodes_h_l96_c7_f453_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_return_output,
 BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954_return_output,
 MUX_uxn_opcodes_h_l99_c22_c540_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_26d1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_9827 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_703d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_703d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l88_c3_c18c : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_986f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_1dfe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_4ce3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_703d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_703d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_f453_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_703d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_703d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_703d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_703d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_67ee : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_703d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_f479_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_f479_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_f453_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_f453_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_f453_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_c540_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_c540_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_c540_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_c540_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_b0a0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_477f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_b6ef_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_d6d7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbec_uxn_opcodes_h_l103_l66_DUPLICATE_7870_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_67ee := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_67ee;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_26d1 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_26d1;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_1dfe := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_1dfe;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_9827 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_9827;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_986f := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_986f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6_right := to_unsigned(1, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_703d_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_703d_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_f453_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_466e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l71_c2_23b9] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_23b9_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_9084] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c22_8c57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_477f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_477f_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l71_c2_23b9] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_23b9_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l71_c6_df25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_left;
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_return_output := BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l85_c7_4ce3] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_4ce3_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_d6d7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_d6d7_return_output := result.u16_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_b6ef LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_b6ef_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_84c6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l90_c7_703d] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_703d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l96_c11_6569] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_left;
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_return_output := BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l71_c2_23b9] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_23b9_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l71_c2_23b9] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_23b9_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_b0a0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_b0a0_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_159c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_23b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_df25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_466e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_703d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_703d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_159c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_f453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6569_return_output;
     VAR_MUX_uxn_opcodes_h_l99_c22_c540_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_8c57_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l88_c3_c18c := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_84c6_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l99_c22_c540_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_9084_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_b6ef_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_f479_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_b6ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_d6d7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_d6d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_477f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_477f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_477f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_b0a0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_b0a0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_b0a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_23b9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_23b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_23b9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_23b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_703d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_4ce3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue := VAR_result_u16_value_uxn_opcodes_h_l88_c3_c18c;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_23b9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_23b9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l93_c3_f479] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l93_c3_f479_x <= VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_f479_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_f479_return_output := CONST_SL_8_uxn_opcodes_h_l93_c3_f479_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_23b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output;

     -- t8_MUX[uxn_opcodes_h_l90_c7_703d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l90_c7_703d_cond <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_703d_cond;
     t8_MUX_uxn_opcodes_h_l90_c7_703d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_703d_iftrue;
     t8_MUX_uxn_opcodes_h_l90_c7_703d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_703d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_703d_return_output := t8_MUX_uxn_opcodes_h_l90_c7_703d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_4ce3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l97_c3_f6cf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf_left;
     BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf_return_output := BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_703d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_f453] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_f453] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_23b9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca_right := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_f453_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_f6cf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_703d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_f479_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_f453_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_f453_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_703d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l90_c7_703d_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_703d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_return_output;

     -- t8_MUX[uxn_opcodes_h_l85_c7_4ce3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l85_c7_4ce3_cond <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce3_cond;
     t8_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue;
     t8_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output := t8_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_7bca] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l96_c7_f453] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l96_c7_f453_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_f453_cond;
     tmp16_MUX_uxn_opcodes_h_l96_c7_f453_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_f453_iftrue;
     tmp16_MUX_uxn_opcodes_h_l96_c7_f453_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_f453_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_f453_return_output := tmp16_MUX_uxn_opcodes_h_l96_c7_f453_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_4ce3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_23b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_703d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7bca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_703d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_703d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_703d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_f453_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_4ce3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_8954] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l90_c7_703d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_703d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_703d_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_703d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_703d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_703d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_703d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_703d_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_703d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_4ce3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output;

     -- t8_MUX[uxn_opcodes_h_l71_c2_23b9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l71_c2_23b9_cond <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_23b9_cond;
     t8_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue;
     t8_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_23b9_return_output := t8_MUX_uxn_opcodes_h_l71_c2_23b9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_23b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l99_c22_c540_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_8954_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l71_c2_23b9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_703d_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l85_c7_4ce3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_23b9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_23b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_return_output;

     -- MUX[uxn_opcodes_h_l99_c22_c540] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l99_c22_c540_cond <= VAR_MUX_uxn_opcodes_h_l99_c22_c540_cond;
     MUX_uxn_opcodes_h_l99_c22_c540_iftrue <= VAR_MUX_uxn_opcodes_h_l99_c22_c540_iftrue;
     MUX_uxn_opcodes_h_l99_c22_c540_iffalse <= VAR_MUX_uxn_opcodes_h_l99_c22_c540_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l99_c22_c540_return_output := MUX_uxn_opcodes_h_l99_c22_c540_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_iftrue := VAR_MUX_uxn_opcodes_h_l99_c22_c540_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l96_c7_f453] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_cond;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_return_output := result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l71_c2_23b9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_cond;
     tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_return_output := tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_f453_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_23b9_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l90_c7_703d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_return_output := result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_703d_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l85_c7_4ce3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output := result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce3_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l71_c2_23b9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_return_output := result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_cbec_uxn_opcodes_h_l103_l66_DUPLICATE_7870 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbec_uxn_opcodes_h_l103_l66_DUPLICATE_7870_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cbec(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_23b9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_23b9_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_23b9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_23b9_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_23b9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_23b9_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_23b9_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbec_uxn_opcodes_h_l103_l66_DUPLICATE_7870_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbec_uxn_opcodes_h_l103_l66_DUPLICATE_7870_return_output;
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
