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
-- BIN_OP_EQ[uxn_opcodes_h_l144_c6_1fe9]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_6a32]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_6a32]
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l144_c2_6a32]
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l144_c2_6a32]
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_6a32]
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_6a32]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_6a32]
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_6a32]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_6a32]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_6a32]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c2_6a32]
signal tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_0c9d]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l160_c11_b5b8]
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_61a1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_61a1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_61a1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l160_c7_61a1]
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l160_c7_61a1]
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_61a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_61a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l160_c7_61a1]
signal tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l163_c31_218a]
signal CONST_SR_8_uxn_opcodes_h_l163_c31_218a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l163_c31_218a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_c55a]
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_db1b]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l166_c7_aa4d]
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_aa4d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_aa4d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_aa4d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_aa4d]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l168_c3_9797]
signal CONST_SL_8_uxn_opcodes_h_l168_c3_9797_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l168_c3_9797_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_b8ef]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l171_c7_a772]
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_a772]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_a772]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_a772]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_a772_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_a772_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_a772_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_a772_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l172_c3_4e61]
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_e14a]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_e9a1]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_500b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9
BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32
result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_cond,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32
result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_cond,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c2_6a32
tmp16_MUX_uxn_opcodes_h_l144_c2_6a32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_cond,
tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8
BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_left,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_right,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1
result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_cond,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1
result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_cond,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l160_c7_61a1
tmp16_MUX_uxn_opcodes_h_l160_c7_61a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_cond,
tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue,
tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse,
tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l163_c31_218a
CONST_SR_8_uxn_opcodes_h_l163_c31_218a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l163_c31_218a_x,
CONST_SR_8_uxn_opcodes_h_l163_c31_218a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a_left,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a_right,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b
BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d
result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_cond,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d
tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l168_c3_9797
CONST_SL_8_uxn_opcodes_h_l168_c3_9797 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l168_c3_9797_x,
CONST_SL_8_uxn_opcodes_h_l168_c3_9797_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef
BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772
result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_cond,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_a772
tmp16_MUX_uxn_opcodes_h_l171_c7_a772 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_a772_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_a772_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_a772_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_a772_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61
BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61_left,
BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61_right,
BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_return_output,
 tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_return_output,
 CONST_SR_8_uxn_opcodes_h_l163_c31_218a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output,
 CONST_SL_8_uxn_opcodes_h_l168_c3_9797_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_a772_return_output,
 BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_3077 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_ab45 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l148_c3_3020 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_5cbb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_db76 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_61a1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_61a1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l164_c3_1c1b : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_17f6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_61a1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_218a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_218a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_c3e4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_a772_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_9797_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_9797_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l174_c3_5065 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_a772_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_a772_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_a772_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_c578_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_7604_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_7074_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_099d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_cac2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l140_l178_DUPLICATE_f9b7_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_ab45 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_ab45;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_17f6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_17f6;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_db76 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_db76;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_3077 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_3077;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_iftrue := to_unsigned(1, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_218a_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_a772_iffalse := tmp16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l144_c2_6a32] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_6a32_return_output := result.is_ram_write;

     -- CONST_SR_8[uxn_opcodes_h_l163_c31_218a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l163_c31_218a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_218a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_218a_return_output := CONST_SR_8_uxn_opcodes_h_l163_c31_218a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_7074 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_7074_return_output := result.is_opc_done;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l160_c7_61a1] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_61a1_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_cac2 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_cac2_return_output := result.u16_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l144_c2_6a32] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_6a32_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_db1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l160_c11_b5b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_c578 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_c578_return_output := result.is_pc_updated;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l160_c7_61a1] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_61a1_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_099d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_099d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_0c9d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d_return_output;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d[uxn_opcodes_h_l160_c7_61a1] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_61a1_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l144_c2_6a32] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_6a32_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_7604 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_7604_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_c55a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c6_1fe9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_b8ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_1fe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_b5b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_db1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_a772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b8ef_return_output;
     VAR_tmp16_uxn_opcodes_h_l148_c3_3020 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0c9d_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l164_c3_1c1b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_c55a_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_099d_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_9797_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_099d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_cac2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_cac2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_7074_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_7074_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_7074_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_c578_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_c578_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_c578_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_7604_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_7604_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_6a32_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_6a32_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_6a32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_61a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_61a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_61a1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue := VAR_result_u16_value_uxn_opcodes_h_l164_c3_1c1b;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue := VAR_tmp16_uxn_opcodes_h_l148_c3_3020;
     -- CONST_SL_8[uxn_opcodes_h_l168_c3_9797] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l168_c3_9797_x <= VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_9797_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_9797_return_output := CONST_SL_8_uxn_opcodes_h_l168_c3_9797_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_6a32] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_a772] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_61a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_6a32] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_a772] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_aa4d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l172_c3_4e61] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61_left;
     BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61_return_output := BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l163_c21_c3e4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_c3e4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_218a_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_6a32] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_61a1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l156_c21_5cbb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_5cbb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l148_c3_3020);

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a_right := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_a772_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_4e61_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_5cbb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_c3e4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_9797_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_a772_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_a772_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_61a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_61a1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l160_c7_61a1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_return_output := result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_e14a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_6a32] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_61a1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_aa4d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_aa4d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_6a32] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l171_c7_a772] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_a772_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_a772_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_a772_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_a772_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_a772_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_a772_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_a772_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_a772_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e14a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_61a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_61a1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_a772_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_6a32] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_61a1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l144_c2_6a32] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_cond;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_return_output := result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_e9a1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_61a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l166_c7_aa4d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l174_c3_5065 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e9a1_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_61a1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_61a1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_iftrue := VAR_result_u16_value_uxn_opcodes_h_l174_c3_5065;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_6a32] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l171_c7_a772] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_cond;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_return_output := result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l160_c7_61a1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_cond;
     tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_return_output := tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_6a32] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_a772_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_61a1_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l144_c2_6a32] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_return_output := tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l166_c7_aa4d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output := result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_aa4d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_6a32_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l160_c7_61a1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_return_output := result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_61a1_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l144_c2_6a32] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_cond;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_return_output := result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l140_l178_DUPLICATE_f9b7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l140_l178_DUPLICATE_f9b7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_500b(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_6a32_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_6a32_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_6a32_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_6a32_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_6a32_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_6a32_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_6a32_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_6a32_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l140_l178_DUPLICATE_f9b7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l140_l178_DUPLICATE_f9b7_return_output;
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
