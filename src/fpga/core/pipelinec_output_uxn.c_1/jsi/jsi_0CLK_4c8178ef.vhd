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
-- Submodules: 43
entity jsi_0CLK_4c8178ef is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsi_0CLK_4c8178ef;
architecture arch of jsi_0CLK_4c8178ef is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l144_c6_3dc5]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c2_1644]
signal tmp16_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_1644]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l144_c2_1644]
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l144_c2_1644]
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_1644]
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_1644]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_1644]
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_1644]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_1644]
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_1644]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_1644]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_6bea]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l160_c11_e8e0]
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l160_c7_dbe8]
signal tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_dbe8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l160_c7_dbe8]
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l160_c7_dbe8]
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_dbe8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_dbe8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_dbe8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_dbe8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l163_c31_0bdd]
signal CONST_SR_8_uxn_opcodes_h_l163_c31_0bdd_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l163_c31_0bdd_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_9f27]
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_9821]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_8ad5]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_8ad5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_8ad5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l166_c7_8ad5]
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_8ad5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l168_c3_24d7]
signal CONST_SL_8_uxn_opcodes_h_l168_c3_24d7_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l168_c3_24d7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_9902]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_aa38]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_aa38]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l171_c7_aa38]
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_aa38]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l172_c3_b6af]
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_0187]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_7a76]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e393( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5
BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c2_1644
tmp16_MUX_uxn_opcodes_h_l144_c2_1644 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c2_1644_cond,
tmp16_MUX_uxn_opcodes_h_l144_c2_1644_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c2_1644_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c2_1644_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644
result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_cond,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644
result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_cond,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0
BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_left,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_right,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8
tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_cond,
tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue,
tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse,
tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8
result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_cond,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8
result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_cond,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l163_c31_0bdd
CONST_SR_8_uxn_opcodes_h_l163_c31_0bdd : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l163_c31_0bdd_x,
CONST_SR_8_uxn_opcodes_h_l163_c31_0bdd_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27_left,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27_right,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821
BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5
tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5
result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_cond,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output);

-- CONST_SL_8_uxn_opcodes_h_l168_c3_24d7
CONST_SL_8_uxn_opcodes_h_l168_c3_24d7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l168_c3_24d7_x,
CONST_SL_8_uxn_opcodes_h_l168_c3_24d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902
BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_aa38
tmp16_MUX_uxn_opcodes_h_l171_c7_aa38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38
result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_cond,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af
BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af_left,
BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af_right,
BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c2_1644_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_return_output,
 tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output,
 CONST_SR_8_uxn_opcodes_h_l163_c31_0bdd_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output,
 CONST_SL_8_uxn_opcodes_h_l168_c3_24d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_return_output,
 BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l148_c3_27d0 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_30a1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_1c22 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_97ef_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_4f70 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_dbe8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_dbe8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l164_c3_7b81 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_04e0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_dbe8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_0bdd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_0bdd_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_2656_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_24d7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_24d7_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l174_c3_b106 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_e196_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_bb9e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_2178_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_1522_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_1bff_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l140_l178_DUPLICATE_95f3_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_1c22 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_1c22;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_04e0 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_04e0;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_4f70 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_4f70;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_30a1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_30a1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_0bdd_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse := tmp16;
     -- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_9f27] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27_left;
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27_return_output := BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_bb9e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_bb9e_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l144_c2_1644] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_1644_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l144_c2_1644] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_1644_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_1bff LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_1bff_return_output := result.u16_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_6bea] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c6_3dc5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l163_c31_0bdd] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l163_c31_0bdd_x <= VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_0bdd_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_0bdd_return_output := CONST_SR_8_uxn_opcodes_h_l163_c31_0bdd_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_1522 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_1522_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l144_c2_1644] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_1644_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_e196 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_e196_return_output := result.is_pc_updated;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l160_c7_dbe8] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_dbe8_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l160_c11_e8e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_9821] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l160_c7_dbe8] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_dbe8_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_2178 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_2178_return_output := result.is_opc_done;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d[uxn_opcodes_h_l160_c7_dbe8] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_dbe8_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_9902] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3dc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e8e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9821_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9902_return_output;
     VAR_tmp16_uxn_opcodes_h_l148_c3_27d0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_6bea_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l164_c3_7b81 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_9f27_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_1522_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_24d7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_1522_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_1bff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_1bff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_2178_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_2178_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_2178_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_e196_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_e196_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_e196_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_bb9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_bb9e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_1644_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_1644_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_1644_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_dbe8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_dbe8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_dbe8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue := VAR_result_u16_value_uxn_opcodes_h_l164_c3_7b81;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1644_iftrue := VAR_tmp16_uxn_opcodes_h_l148_c3_27d0;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_8ad5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_aa38] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l156_c21_97ef] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_97ef_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l148_c3_27d0);

     -- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_1644] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l163_c21_2656] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_2656_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_0bdd_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_dbe8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_aa38] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_1644] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l172_c3_b6af] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af_left;
     BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af_return_output := BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_1644] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l168_c3_24d7] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l168_c3_24d7_x <= VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_24d7_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_24d7_return_output := CONST_SL_8_uxn_opcodes_h_l168_c3_24d7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_dbe8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187_right := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_b6af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_97ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_2656_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_24d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_aa38_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_aa38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_1644] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l171_c7_aa38] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_1644] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l160_c7_dbe8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output := result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_0187] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_8ad5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_8ad5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_dbe8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_0187_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_aa38_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_dbe8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_1644] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l144_c2_1644] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_cond;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_return_output := result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_7a76] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_dbe8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l166_c7_8ad5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l174_c3_b106 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_7a76_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue := VAR_result_u16_value_uxn_opcodes_h_l174_c3_b106;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_1644] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l171_c7_aa38] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_cond;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_return_output := result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l160_c7_dbe8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_cond;
     tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output := tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_1644] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_aa38_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1644_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l166_c7_8ad5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output := result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l144_c2_1644] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c2_1644_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1644_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c2_1644_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1644_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c2_1644_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1644_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1644_return_output := tmp16_MUX_uxn_opcodes_h_l144_c2_1644_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_8ad5_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1644_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l160_c7_dbe8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output := result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_dbe8_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l144_c2_1644] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_cond;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_return_output := result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l140_l178_DUPLICATE_95f3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l140_l178_DUPLICATE_95f3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e393(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1644_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1644_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1644_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1644_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1644_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1644_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1644_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1644_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l140_l178_DUPLICATE_95f3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l140_l178_DUPLICATE_95f3_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
