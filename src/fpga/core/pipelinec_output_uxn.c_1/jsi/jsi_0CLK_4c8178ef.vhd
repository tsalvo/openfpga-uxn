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
-- BIN_OP_EQ[uxn_opcodes_h_l144_c6_b584]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c2_7f82]
signal tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_7f82]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_7f82]
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l144_c2_7f82]
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_7f82]
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_7f82]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_7f82]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_7f82]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l144_c2_7f82]
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_7f82]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_7f82]
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_52e5]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l160_c11_5245]
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l160_c7_10fc]
signal tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_10fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l160_c7_10fc]
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l160_c7_10fc]
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_10fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_10fc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_10fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_10fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l163_c31_8026]
signal CONST_SR_8_uxn_opcodes_h_l163_c31_8026_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l163_c31_8026_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_d17c]
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_8a75]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_cc84]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_cc84]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l166_c7_cc84]
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_cc84]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_cc84]
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l168_c3_6e92]
signal CONST_SL_8_uxn_opcodes_h_l168_c3_6e92_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l168_c3_6e92_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_7d81]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_8530]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_8530_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_8530_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_8530_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_8530_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_8530]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l171_c7_8530]
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_8530]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l172_c3_8097]
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_8097_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_8097_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_8097_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_6b1f]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_61c5]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c942( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_vram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584
BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c2_7f82
tmp16_MUX_uxn_opcodes_h_l144_c2_7f82 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_cond,
tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82
result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_cond,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82
result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_cond,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245
BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_left,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_right,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_return_output);

-- tmp16_MUX_uxn_opcodes_h_l160_c7_10fc
tmp16_MUX_uxn_opcodes_h_l160_c7_10fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_cond,
tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue,
tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse,
tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc
result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_cond,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc
result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_cond,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_return_output);

-- CONST_SR_8_uxn_opcodes_h_l163_c31_8026
CONST_SR_8_uxn_opcodes_h_l163_c31_8026 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l163_c31_8026_x,
CONST_SR_8_uxn_opcodes_h_l163_c31_8026_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c_left,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c_right,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75
BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_cc84
tmp16_MUX_uxn_opcodes_h_l166_c7_cc84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84
result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_cond,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_return_output);

-- CONST_SL_8_uxn_opcodes_h_l168_c3_6e92
CONST_SL_8_uxn_opcodes_h_l168_c3_6e92 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l168_c3_6e92_x,
CONST_SL_8_uxn_opcodes_h_l168_c3_6e92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81
BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_8530
tmp16_MUX_uxn_opcodes_h_l171_c7_8530 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_8530_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_8530_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_8530_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_8530_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530
result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_cond,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l172_c3_8097
BIN_OP_OR_uxn_opcodes_h_l172_c3_8097 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l172_c3_8097_left,
BIN_OP_OR_uxn_opcodes_h_l172_c3_8097_right,
BIN_OP_OR_uxn_opcodes_h_l172_c3_8097_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_return_output,
 tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_return_output,
 CONST_SR_8_uxn_opcodes_h_l163_c31_8026_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_return_output,
 CONST_SL_8_uxn_opcodes_h_l168_c3_6e92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_8530_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_return_output,
 BIN_OP_OR_uxn_opcodes_h_l172_c3_8097_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l148_c3_e528 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_9864 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_007e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_a0bc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_df8a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_10fc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l164_c3_315a : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_10fc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_1700 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_10fc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_8026_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_8026_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_0f33_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_8530_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_6e92_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_6e92_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_8530_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_8530_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_8530_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l174_c3_ff8e : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_8097_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_8097_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_8097_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_bd3d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l160_l166_DUPLICATE_3c70_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l160_l166_DUPLICATE_09db_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_dc9c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l171_l166_DUPLICATE_0260_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l178_l140_DUPLICATE_d0b4_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_007e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_007e;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_9864 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_9864;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_df8a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_df8a;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_1700 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_1700;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_iftrue := to_unsigned(1, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_8097_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_8026_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_8530_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_dc9c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_dc9c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l160_l166_DUPLICATE_3c70 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l160_l166_DUPLICATE_3c70_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l144_c2_7f82] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_7f82_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l160_c11_5245] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_left;
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_return_output := BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l144_c2_7f82] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_7f82_return_output := result.is_stack_index_flipped;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l160_c7_10fc] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_10fc_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l144_c2_7f82] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_7f82_return_output := result.is_ram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_d17c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l171_l166_DUPLICATE_0260 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l171_l166_DUPLICATE_0260_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_7d81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l160_l166_DUPLICATE_09db LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l160_l166_DUPLICATE_09db_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_52e5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l163_c31_8026] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l163_c31_8026_x <= VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_8026_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_8026_return_output := CONST_SR_8_uxn_opcodes_h_l163_c31_8026_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l160_c7_10fc] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_10fc_return_output := result.stack_address_sp_offset;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d[uxn_opcodes_h_l160_c7_10fc] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_10fc_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_bd3d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_bd3d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_8a75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c6_b584] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_b584_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_5245_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_8a75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_8530_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7d81_return_output;
     VAR_tmp16_uxn_opcodes_h_l148_c3_e528 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_52e5_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l164_c3_315a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_d17c_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_8097_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_dc9c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_6e92_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_dc9c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l171_l166_DUPLICATE_0260_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l171_l166_DUPLICATE_0260_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l160_l166_DUPLICATE_09db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l160_l166_DUPLICATE_09db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l160_l166_DUPLICATE_09db_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l160_l166_DUPLICATE_3c70_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l160_l166_DUPLICATE_3c70_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l160_l166_DUPLICATE_3c70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_bd3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_bd3d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_7f82_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_7f82_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_7f82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_10fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_10fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_10fc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue := VAR_result_u16_value_uxn_opcodes_h_l164_c3_315a;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue := VAR_tmp16_uxn_opcodes_h_l148_c3_e528;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_10fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l163_c21_0f33] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_0f33_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_8026_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_8530] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_8530] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l168_c3_6e92] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l168_c3_6e92_x <= VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_6e92_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_6e92_return_output := CONST_SL_8_uxn_opcodes_h_l168_c3_6e92_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_10fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l172_c3_8097] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l172_c3_8097_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_8097_left;
     BIN_OP_OR_uxn_opcodes_h_l172_c3_8097_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_8097_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_8097_return_output := BIN_OP_OR_uxn_opcodes_h_l172_c3_8097_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_7f82] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_7f82] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_cc84] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_7f82] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l156_c21_a0bc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_a0bc_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l148_c3_e528);

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f_right := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_8097_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_8530_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_8097_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_a0bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_0f33_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_6e92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_8530_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_8530_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_cc84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_10fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_10fc_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_6b1f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_cc84] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l160_c7_10fc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_return_output := result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_7f82] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l171_c7_8530] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_8530_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_8530_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_8530_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_8530_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_8530_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_8530_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_8530_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_8530_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_10fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_cc84] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_7f82] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6b1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_cc84_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_cc84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_10fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_10fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_8530_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l166_c7_cc84] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_61c5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l144_c2_7f82] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_cond;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_return_output := result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_10fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_7f82] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_10fc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l174_c3_ff8e := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_61c5_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_10fc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_10fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_cc84_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_iftrue := VAR_result_u16_value_uxn_opcodes_h_l174_c3_ff8e;
     -- tmp16_MUX[uxn_opcodes_h_l160_c7_10fc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_cond;
     tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_return_output := tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_7f82] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_7f82] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l171_c7_8530] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_cond;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_return_output := result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_8530_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_10fc_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l144_c2_7f82] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_return_output := tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l166_c7_cc84] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_cond;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_return_output := result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_cc84_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_7f82_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l160_c7_10fc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_return_output := result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_10fc_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l144_c2_7f82] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_cond;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_return_output := result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l178_l140_DUPLICATE_d0b4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l178_l140_DUPLICATE_d0b4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c942(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_7f82_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_7f82_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_7f82_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_7f82_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_7f82_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_7f82_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_7f82_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_7f82_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l178_l140_DUPLICATE_d0b4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l178_l140_DUPLICATE_d0b4_return_output;
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
