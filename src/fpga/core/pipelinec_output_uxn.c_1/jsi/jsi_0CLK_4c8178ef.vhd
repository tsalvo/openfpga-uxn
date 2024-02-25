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
-- BIN_OP_EQ[uxn_opcodes_h_l144_c6_2b0e]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c2_4c74]
signal tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_4c74]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_4c74]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_4c74]
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l144_c2_4c74]
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_4c74]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_4c74]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_4c74]
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l144_c2_4c74]
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_4c74]
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_4c74]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_81eb]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l160_c11_8e27]
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l160_c7_bc2b]
signal tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_bc2b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_bc2b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_bc2b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l160_c7_bc2b]
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l160_c7_bc2b]
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_bc2b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_bc2b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l163_c31_194c]
signal CONST_SR_8_uxn_opcodes_h_l163_c31_194c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l163_c31_194c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_60c0]
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_daf8]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_6eca]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_6eca]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l166_c7_6eca]
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_6eca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_6eca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l168_c3_03e4]
signal CONST_SL_8_uxn_opcodes_h_l168_c3_03e4_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l168_c3_03e4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_9c6d]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_7786]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_7786_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_7786_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_7786_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_7786_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_7786]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l171_c7_7786]
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_7786]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l172_c3_439c]
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_439c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_439c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_439c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_617d]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_e022]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_1899( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.stack_address_sp_offset := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e
BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c2_4c74
tmp16_MUX_uxn_opcodes_h_l144_c2_4c74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_cond,
tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74
result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_cond,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74
result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_cond,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27
BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_left,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_right,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_return_output);

-- tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b
tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_cond,
tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue,
tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse,
tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b
result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_cond,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b
result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_cond,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l163_c31_194c
CONST_SR_8_uxn_opcodes_h_l163_c31_194c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l163_c31_194c_x,
CONST_SR_8_uxn_opcodes_h_l163_c31_194c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0_left,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0_right,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8
BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_6eca
tmp16_MUX_uxn_opcodes_h_l166_c7_6eca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca
result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_cond,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_return_output);

-- CONST_SL_8_uxn_opcodes_h_l168_c3_03e4
CONST_SL_8_uxn_opcodes_h_l168_c3_03e4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l168_c3_03e4_x,
CONST_SL_8_uxn_opcodes_h_l168_c3_03e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d
BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_7786
tmp16_MUX_uxn_opcodes_h_l171_c7_7786 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_7786_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_7786_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_7786_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_7786_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786
result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_cond,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l172_c3_439c
BIN_OP_OR_uxn_opcodes_h_l172_c3_439c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l172_c3_439c_left,
BIN_OP_OR_uxn_opcodes_h_l172_c3_439c_right,
BIN_OP_OR_uxn_opcodes_h_l172_c3_439c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_return_output,
 tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output,
 CONST_SR_8_uxn_opcodes_h_l163_c31_194c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_return_output,
 CONST_SL_8_uxn_opcodes_h_l168_c3_03e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_7786_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_return_output,
 BIN_OP_OR_uxn_opcodes_h_l172_c3_439c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l148_c3_c178 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_ab1f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_6b50 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_978f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_a6d1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_bc2b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_bc2b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l164_c3_cf60 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_da47 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_bc2b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_194c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_194c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_bf18_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7786_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_03e4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_03e4_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7786_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7786_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7786_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l174_c3_a753 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_439c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_439c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_439c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_3a3f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_c386_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_f235_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_dd00_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_3645_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l178_l140_DUPLICATE_c313_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_da47 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_da47;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_6b50 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_6b50;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_ab1f := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_ab1f;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_a6d1 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_a6d1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb_right := to_unsigned(2, 2);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_439c_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_194c_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7786_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l160_c11_8e27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_left;
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_return_output := BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_3a3f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_3a3f_return_output := result.is_pc_updated;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d[uxn_opcodes_h_l160_c7_bc2b] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_bc2b_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_f235 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_f235_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_daf8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_81eb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l144_c2_4c74] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_4c74_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_3645 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_3645_return_output := result.u16_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_dd00 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_dd00_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c6_2b0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l163_c31_194c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l163_c31_194c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_194c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_194c_return_output := CONST_SR_8_uxn_opcodes_h_l163_c31_194c_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l160_c7_bc2b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_bc2b_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l144_c2_4c74] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_4c74_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_c386 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_c386_return_output := result.is_stack_write;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l160_c7_bc2b] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_bc2b_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_9c6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_60c0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l144_c2_4c74] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_4c74_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_2b0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_8e27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_daf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9c6d_return_output;
     VAR_tmp16_uxn_opcodes_h_l148_c3_c178 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_81eb_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l164_c3_cf60 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_60c0_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_439c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_dd00_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_03e4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_dd00_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_3645_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_3645_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_f235_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_f235_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_f235_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_3a3f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_3a3f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_3a3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_c386_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_c386_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_4c74_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_4c74_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_4c74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_bc2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_bc2b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_bc2b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue := VAR_result_u16_value_uxn_opcodes_h_l164_c3_cf60;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue := VAR_tmp16_uxn_opcodes_h_l148_c3_c178;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_4c74] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l163_c21_bf18] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_bf18_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_194c_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_6eca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_7786] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l168_c3_03e4] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l168_c3_03e4_x <= VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_03e4_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_03e4_return_output := CONST_SL_8_uxn_opcodes_h_l168_c3_03e4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l156_c21_978f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_978f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l148_c3_c178);

     -- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_4c74] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_bc2b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l172_c3_439c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l172_c3_439c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_439c_left;
     BIN_OP_OR_uxn_opcodes_h_l172_c3_439c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_439c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_439c_return_output := BIN_OP_OR_uxn_opcodes_h_l172_c3_439c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_4c74] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_bc2b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_7786] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d_right := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_439c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7786_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_439c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_978f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_bf18_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_03e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_7786_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_7786_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_6eca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l160_c7_bc2b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output := result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_6eca] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_4c74] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_4c74] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_6eca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l171_c7_7786] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_7786_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7786_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_7786_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7786_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_7786_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7786_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7786_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_7786_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_bc2b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_617d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_617d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_6eca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_6eca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_7786_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_e022] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l166_c7_6eca] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_bc2b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_bc2b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_4c74] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l144_c2_4c74] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_cond;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_return_output := result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l174_c3_a753 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e022_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_6eca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_iftrue := VAR_result_u16_value_uxn_opcodes_h_l174_c3_a753;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_4c74] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_4c74] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l171_c7_7786] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_cond;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_return_output := result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l160_c7_bc2b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_cond;
     tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output := tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_7786_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l166_c7_6eca] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_cond;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_return_output := result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l144_c2_4c74] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_return_output := tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_6eca_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4c74_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l160_c7_bc2b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output := result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_bc2b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l144_c2_4c74] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_cond;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_return_output := result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l178_l140_DUPLICATE_c313 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l178_l140_DUPLICATE_c313_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1899(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4c74_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4c74_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4c74_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4c74_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4c74_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4c74_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4c74_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4c74_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l178_l140_DUPLICATE_c313_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l178_l140_DUPLICATE_c313_return_output;
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
