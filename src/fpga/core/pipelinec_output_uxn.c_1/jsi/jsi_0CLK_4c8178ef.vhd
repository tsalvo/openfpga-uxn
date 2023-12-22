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
-- BIN_OP_EQ[uxn_opcodes_h_l144_c6_569c]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_7e5d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_7e5d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_7e5d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_7e5d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_7e5d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l144_c2_7e5d]
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l144_c2_7e5d]
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_7e5d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_7e5d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_7e5d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c2_7e5d]
signal tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_7396]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l160_c11_17a6]
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_5fb6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_5fb6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l160_c7_5fb6]
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l160_c7_5fb6]
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_5fb6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_5fb6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_5fb6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l160_c7_5fb6]
signal tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l163_c31_e9f7]
signal CONST_SR_8_uxn_opcodes_h_l163_c31_e9f7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l163_c31_e9f7_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_11e1]
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_a798]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_53ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l166_c7_53ba]
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_53ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_53ba]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_53ba]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l168_c3_7e51]
signal CONST_SL_8_uxn_opcodes_h_l168_c3_7e51_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l168_c3_7e51_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_915e]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_0eb4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l171_c7_0eb4]
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_0eb4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_0eb4]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l172_c3_2608]
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_2608_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_2608_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_2608_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_d282]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_32c1]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_9f32( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
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
      base.u16_value := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.is_pc_updated := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c
BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d
result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_cond,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d
result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_cond,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d
tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_cond,
tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6
BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_left,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_right,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6
result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_cond,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6
result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_cond,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6
tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_cond,
tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue,
tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse,
tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output);

-- CONST_SR_8_uxn_opcodes_h_l163_c31_e9f7
CONST_SR_8_uxn_opcodes_h_l163_c31_e9f7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l163_c31_e9f7_x,
CONST_SR_8_uxn_opcodes_h_l163_c31_e9f7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1_left,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1_right,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798
BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba
result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_cond,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_53ba
tmp16_MUX_uxn_opcodes_h_l166_c7_53ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_return_output);

-- CONST_SL_8_uxn_opcodes_h_l168_c3_7e51
CONST_SL_8_uxn_opcodes_h_l168_c3_7e51 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l168_c3_7e51_x,
CONST_SL_8_uxn_opcodes_h_l168_c3_7e51_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e
BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4
result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_cond,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4
tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l172_c3_2608
BIN_OP_OR_uxn_opcodes_h_l172_c3_2608 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l172_c3_2608_left,
BIN_OP_OR_uxn_opcodes_h_l172_c3_2608_right,
BIN_OP_OR_uxn_opcodes_h_l172_c3_2608_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output,
 tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output,
 CONST_SR_8_uxn_opcodes_h_l163_c31_e9f7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_return_output,
 CONST_SL_8_uxn_opcodes_h_l168_c3_7e51_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l172_c3_2608_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_d9a8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_ed70 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l148_c3_d7e0 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_6071_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_0124 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_5fb6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_5fb6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l164_c3_876f : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_71fe : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_5fb6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_e9f7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_e9f7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_8c22_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_7e51_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_7e51_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l174_c3_b3bc : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_2608_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_2608_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_2608_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_9d87_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_9ddb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_edfe_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_7b9c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_9637_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l178_l140_DUPLICATE_4770_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_71fe := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_71fe;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_d9a8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_d9a8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_ed70 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_ed70;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_right := to_unsigned(3, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_0124 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_0124;

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_2608_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_e9f7_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_915e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l144_c2_7e5d] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_7e5d_return_output := result.is_vram_write;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d[uxn_opcodes_h_l160_c7_5fb6] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_5fb6_return_output := result.u8_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_7396] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l144_c2_7e5d] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_7e5d_return_output := result.is_stack_index_flipped;

     -- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_11e1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l160_c7_5fb6] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_5fb6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l160_c11_17a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_a798] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l144_c2_7e5d] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_7e5d_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_7b9c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_7b9c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l160_c7_5fb6] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_5fb6_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_9d87 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_9d87_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_9637 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_9637_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_9ddb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_9ddb_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c6_569c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l163_c31_e9f7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l163_c31_e9f7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_e9f7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_e9f7_return_output := CONST_SR_8_uxn_opcodes_h_l163_c31_e9f7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_edfe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_edfe_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_569c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_17a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_a798_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_915e_return_output;
     VAR_tmp16_uxn_opcodes_h_l148_c3_d7e0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_7396_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l164_c3_876f := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_11e1_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_2608_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_7b9c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_7e51_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_7b9c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_9637_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_9637_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_9d87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_9d87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_9d87_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_edfe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_edfe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_edfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_9ddb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_9ddb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_7e5d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_7e5d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_7e5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_5fb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_5fb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_5fb6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue := VAR_result_u16_value_uxn_opcodes_h_l164_c3_876f;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue := VAR_tmp16_uxn_opcodes_h_l148_c3_d7e0;
     -- CONST_SL_8[uxn_opcodes_h_l168_c3_7e51] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l168_c3_7e51_x <= VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_7e51_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_7e51_return_output := CONST_SL_8_uxn_opcodes_h_l168_c3_7e51_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_7e5d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_5fb6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_0eb4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l156_c21_6071] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_6071_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l148_c3_d7e0);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l163_c21_8c22] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_8c22_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_e9f7_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_7e5d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_53ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l172_c3_2608] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l172_c3_2608_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_2608_left;
     BIN_OP_OR_uxn_opcodes_h_l172_c3_2608_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_2608_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_2608_return_output := BIN_OP_OR_uxn_opcodes_h_l172_c3_2608_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_0eb4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_7e5d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_5fb6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282_right := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_2608_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_2608_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_6071_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_8c22_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_7e51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_53ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_d282] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_7e5d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l160_c7_5fb6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output := result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l171_c7_0eb4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_5fb6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_7e5d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_53ba] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_53ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d282_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_53ba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_53ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_32c1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_7e5d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_5fb6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l166_c7_53ba] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l144_c2_7e5d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output := result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_5fb6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l174_c3_b3bc := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_32c1_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_53ba_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue := VAR_result_u16_value_uxn_opcodes_h_l174_c3_b3bc;
     -- tmp16_MUX[uxn_opcodes_h_l160_c7_5fb6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_cond;
     tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output := tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_7e5d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l171_c7_0eb4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output := result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_7e5d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_0eb4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l144_c2_7e5d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output := tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l166_c7_53ba] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_cond;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_return_output := result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_53ba_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l160_c7_5fb6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output := result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5fb6_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l144_c2_7e5d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output := result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l178_l140_DUPLICATE_4770 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l178_l140_DUPLICATE_4770_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9f32(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7e5d_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l178_l140_DUPLICATE_4770_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l178_l140_DUPLICATE_4770_return_output;
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
