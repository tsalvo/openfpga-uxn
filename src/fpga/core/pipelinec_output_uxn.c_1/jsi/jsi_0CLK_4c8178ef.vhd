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
-- BIN_OP_EQ[uxn_opcodes_h_l144_c6_3495]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l144_c2_c831]
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_c831]
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_c831]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_c831]
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_c831]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l144_c2_c831]
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_c831]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_c831]
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_c831]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_c831]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c2_c831]
signal tmp16_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_8e70]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l160_c11_0173]
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l160_c7_3175]
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_3175]
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_3175]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l160_c7_3175]
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_3175]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_3175]
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_3175]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l160_c7_3175]
signal tmp16_MUX_uxn_opcodes_h_l160_c7_3175_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_3175_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_3175_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_3175_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l163_c31_fe5b]
signal CONST_SR_8_uxn_opcodes_h_l163_c31_fe5b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l163_c31_fe5b_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_fdf1]
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_724b]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l166_c7_e329]
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_e329]
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_e329]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_e329]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_e329]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_e329_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_e329_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_e329_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_e329_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l168_c3_3a7b]
signal CONST_SL_8_uxn_opcodes_h_l168_c3_3a7b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l168_c3_3a7b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_9756]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l171_c7_263c]
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_263c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_263c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_263c]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_263c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_263c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_263c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_263c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l172_c3_78a0]
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_5ef9]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_a87e]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495
BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831
result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_cond,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831
result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_cond,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c2_c831
tmp16_MUX_uxn_opcodes_h_l144_c2_c831 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c2_c831_cond,
tmp16_MUX_uxn_opcodes_h_l144_c2_c831_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c2_c831_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c2_c831_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173
BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_left,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_right,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175
result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_cond,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175
result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_cond,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_return_output);

-- tmp16_MUX_uxn_opcodes_h_l160_c7_3175
tmp16_MUX_uxn_opcodes_h_l160_c7_3175 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l160_c7_3175_cond,
tmp16_MUX_uxn_opcodes_h_l160_c7_3175_iftrue,
tmp16_MUX_uxn_opcodes_h_l160_c7_3175_iffalse,
tmp16_MUX_uxn_opcodes_h_l160_c7_3175_return_output);

-- CONST_SR_8_uxn_opcodes_h_l163_c31_fe5b
CONST_SR_8_uxn_opcodes_h_l163_c31_fe5b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l163_c31_fe5b_x,
CONST_SR_8_uxn_opcodes_h_l163_c31_fe5b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1_left,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1_right,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b
BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329
result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_cond,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_e329
tmp16_MUX_uxn_opcodes_h_l166_c7_e329 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_e329_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_e329_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_e329_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_e329_return_output);

-- CONST_SL_8_uxn_opcodes_h_l168_c3_3a7b
CONST_SL_8_uxn_opcodes_h_l168_c3_3a7b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l168_c3_3a7b_x,
CONST_SL_8_uxn_opcodes_h_l168_c3_3a7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756
BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c
result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_cond,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_263c
tmp16_MUX_uxn_opcodes_h_l171_c7_263c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_263c_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_263c_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_263c_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_263c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0
BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0_left,
BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0_right,
BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c2_c831_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_return_output,
 tmp16_MUX_uxn_opcodes_h_l160_c7_3175_return_output,
 CONST_SR_8_uxn_opcodes_h_l163_c31_fe5b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_e329_return_output,
 CONST_SL_8_uxn_opcodes_h_l168_c3_3a7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_263c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_6739 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_77fe : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c831_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l148_c3_e67c : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c831_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_3175_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c831_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c831_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_7f82_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_3175_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_3ce9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_3175_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l164_c3_1665 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_48c4 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_3175_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_3175_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_3175_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e329_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_3175_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_fe5b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_fe5b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_7c99_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e329_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e329_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_263c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e329_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_3a7b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_3a7b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l174_c3_2f0c : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_263c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_263c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_263c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_421d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_2d79_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_2777_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_bce0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_017c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l178_l140_DUPLICATE_7942_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_77fe := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_77fe;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_48c4 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_48c4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_3ce9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_3ce9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_6739 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_6739;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_iftrue := to_unsigned(1, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_fe5b_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_3175_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_263c_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_2d79 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_2d79_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l160_c11_0173] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_left;
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_return_output := BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l160_c7_3175] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_3175_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c6_3495] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_421d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_421d_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l144_c2_c831] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_c831_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_017c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_017c_return_output := result.u16_value;

     -- CONST_SR_8[uxn_opcodes_h_l163_c31_fe5b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l163_c31_fe5b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_fe5b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_fe5b_return_output := CONST_SR_8_uxn_opcodes_h_l163_c31_fe5b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_8e70] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_724b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_return_output;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d[uxn_opcodes_h_l160_c7_3175] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_3175_return_output := result.u8_value;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l160_c7_3175] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_3175_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_fdf1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_9756] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l144_c2_c831] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_c831_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l144_c2_c831] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_c831_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_2777 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_2777_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_bce0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_bce0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_3495_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_3175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_0173_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e329_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_724b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_263c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9756_return_output;
     VAR_tmp16_uxn_opcodes_h_l148_c3_e67c := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8e70_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l164_c3_1665 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fdf1_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_bce0_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_3a7b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_bce0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_017c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_017c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_2d79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_2d79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_2d79_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_2777_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_2777_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_2777_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_421d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_421d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_c831_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_c831_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_c831_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_3175_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_3175_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_3175_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_iftrue := VAR_result_u16_value_uxn_opcodes_h_l164_c3_1665;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c831_iftrue := VAR_tmp16_uxn_opcodes_h_l148_c3_e67c;
     -- CONST_SL_8[uxn_opcodes_h_l168_c3_3a7b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l168_c3_3a7b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_3a7b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_3a7b_return_output := CONST_SL_8_uxn_opcodes_h_l168_c3_3a7b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l172_c3_78a0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0_left;
     BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0_return_output := BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_3175] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_c831] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_c831] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_c831] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_3175] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_263c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_e329] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_263c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l156_c21_7f82] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_7f82_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l148_c3_e67c);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l163_c21_7c99] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_7c99_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_fe5b_return_output);

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9_right := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_263c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_78a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_7f82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_7c99_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e329_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_3a7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_263c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_263c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e329_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_3175_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_3175_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l171_c7_263c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_263c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_263c_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_263c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_263c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_263c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_263c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_263c_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_263c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_e329] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_c831] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_3175] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_5ef9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l160_c7_3175] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_cond;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_return_output := result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_e329] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_c831] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5ef9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e329_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e329_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_3175_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_3175_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e329_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_263c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l144_c2_c831] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_cond;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_return_output := result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_c831] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l166_c7_e329] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_e329_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e329_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_e329_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e329_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_e329_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e329_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e329_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_e329_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_3175] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_a87e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_3175] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l174_c3_2f0c := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_a87e_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_3175_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_3175_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_3175_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e329_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_iftrue := VAR_result_u16_value_uxn_opcodes_h_l174_c3_2f0c;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_c831] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l160_c7_3175] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l160_c7_3175_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_3175_cond;
     tmp16_MUX_uxn_opcodes_h_l160_c7_3175_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_3175_iftrue;
     tmp16_MUX_uxn_opcodes_h_l160_c7_3175_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_3175_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_3175_return_output := tmp16_MUX_uxn_opcodes_h_l160_c7_3175_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l171_c7_263c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_return_output := result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_c831] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_263c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c831_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_3175_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l144_c2_c831] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c2_c831_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c831_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c2_c831_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c831_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c2_c831_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c831_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c831_return_output := tmp16_MUX_uxn_opcodes_h_l144_c2_c831_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l166_c7_e329] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_cond;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_return_output := result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e329_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c831_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l160_c7_3175] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_cond;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_return_output := result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_3175_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l144_c2_c831] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_cond;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_return_output := result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l178_l140_DUPLICATE_7942 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l178_l140_DUPLICATE_7942_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c831_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c831_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c831_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c831_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c831_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c831_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c831_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c831_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l178_l140_DUPLICATE_7942_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2c6d_uxn_opcodes_h_l178_l140_DUPLICATE_7942_return_output;
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
