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
-- BIN_OP_EQ[uxn_opcodes_h_l144_c6_c1f8]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c2_0ae1]
signal tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_0ae1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_0ae1]
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_0ae1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l144_c2_0ae1]
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_0ae1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l144_c2_0ae1]
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_0ae1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_0ae1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_0ae1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_0ae1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_8889]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l160_c11_e49f]
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l160_c7_25b4]
signal tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l160_c7_25b4]
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_25b4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_25b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_25b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_25b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l160_c7_25b4]
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_25b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l163_c31_7746]
signal CONST_SR_8_uxn_opcodes_h_l163_c31_7746_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l163_c31_7746_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_fa57]
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_9d3c]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_35fa]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l166_c7_35fa]
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_35fa]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_35fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_35fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l168_c3_672f]
signal CONST_SL_8_uxn_opcodes_h_l168_c3_672f_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l168_c3_672f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_58b2]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_bd01]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l171_c7_bd01]
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_bd01]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_bd01]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l172_c3_ae68]
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_f071]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_ee4d]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_775a( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.is_ram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8
BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1
tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_cond,
tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1
result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_cond,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1
result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_cond,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f
BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_left,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_right,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l160_c7_25b4
tmp16_MUX_uxn_opcodes_h_l160_c7_25b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_cond,
tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue,
tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse,
tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4
result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_cond,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4
result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_cond,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_return_output);

-- CONST_SR_8_uxn_opcodes_h_l163_c31_7746
CONST_SR_8_uxn_opcodes_h_l163_c31_7746 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l163_c31_7746_x,
CONST_SR_8_uxn_opcodes_h_l163_c31_7746_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57_left,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57_right,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c
BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_35fa
tmp16_MUX_uxn_opcodes_h_l166_c7_35fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa
result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_cond,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_return_output);

-- CONST_SL_8_uxn_opcodes_h_l168_c3_672f
CONST_SL_8_uxn_opcodes_h_l168_c3_672f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l168_c3_672f_x,
CONST_SL_8_uxn_opcodes_h_l168_c3_672f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2
BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_bd01
tmp16_MUX_uxn_opcodes_h_l171_c7_bd01 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01
result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_cond,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68
BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68_left,
BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68_right,
BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_return_output,
 tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_return_output,
 CONST_SR_8_uxn_opcodes_h_l163_c31_7746_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_return_output,
 CONST_SL_8_uxn_opcodes_h_l168_c3_672f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_return_output,
 BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l148_c3_8bbb : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_e56c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_d74a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_5209_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l164_c3_b42b : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_a246 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_25b4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_4dff : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_25b4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_25b4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_7746_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_7746_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_594e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_672f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_672f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l174_c3_58d6 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_4801_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_7e8e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_0aaa_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_9b2d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_becc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l178_l140_DUPLICATE_9d09_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_a246 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_a246;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_d74a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_d74a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_4dff := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_4dff;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_e56c := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_e56c;

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_7746_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_4801 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_4801_return_output := result.is_pc_updated;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l160_c7_25b4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_25b4_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l144_c2_0ae1] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_0ae1_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c6_c1f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_fa57] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57_left;
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57_return_output := BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_7e8e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_7e8e_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_8889] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l144_c2_0ae1] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_0ae1_return_output := result.is_vram_write;

     -- CONST_SR_8[uxn_opcodes_h_l163_c31_7746] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l163_c31_7746_x <= VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_7746_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_7746_return_output := CONST_SR_8_uxn_opcodes_h_l163_c31_7746_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l160_c11_e49f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_left;
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_return_output := BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_9d3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_58b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_becc LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_becc_return_output := result.u16_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_9b2d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_9b2d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l160_c7_25b4] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_25b4_return_output := result.sp_relative_shift;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d[uxn_opcodes_h_l160_c7_25b4] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_25b4_return_output := result.u8_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l144_c2_0ae1] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_0ae1_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_0aaa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_0aaa_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_c1f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_e49f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_9d3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_58b2_return_output;
     VAR_tmp16_uxn_opcodes_h_l148_c3_8bbb := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_8889_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l164_c3_b42b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_fa57_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_9b2d_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_672f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_9b2d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_becc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_becc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_0aaa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_0aaa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_0aaa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_4801_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_4801_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_4801_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_7e8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_7e8e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_0ae1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_0ae1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_0ae1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_25b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_25b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_25b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue := VAR_result_u16_value_uxn_opcodes_h_l164_c3_b42b;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue := VAR_tmp16_uxn_opcodes_h_l148_c3_8bbb;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_25b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_bd01] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_bd01] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_35fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l163_c21_594e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_594e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_7746_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_0ae1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_0ae1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l156_c21_5209] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_5209_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l148_c3_8bbb);

     -- BIN_OP_OR[uxn_opcodes_h_l172_c3_ae68] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68_left;
     BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68_return_output := BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_25b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l168_c3_672f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l168_c3_672f_x <= VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_672f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_672f_return_output := CONST_SL_8_uxn_opcodes_h_l168_c3_672f_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_0ae1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071_right := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_ae68_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_5209_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_594e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_672f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_bd01_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_bd01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_35fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_25b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_25b4_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_35fa] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_0ae1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_25b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l160_c7_25b4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_return_output := result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l171_c7_bd01] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_0ae1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_35fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_f071] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_f071_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_35fa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_35fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_25b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_25b4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_bd01_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l166_c7_35fa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_25b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l144_c2_0ae1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output := result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_0ae1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_25b4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_ee4d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l174_c3_58d6 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ee4d_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_25b4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_25b4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_35fa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue := VAR_result_u16_value_uxn_opcodes_h_l174_c3_58d6;
     -- result_u16_value_MUX[uxn_opcodes_h_l171_c7_bd01] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_cond;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_return_output := result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_0ae1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_0ae1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l160_c7_25b4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_cond;
     tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_return_output := tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_bd01_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_25b4_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l144_c2_0ae1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output := tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l166_c7_35fa] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_cond;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_return_output := result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_35fa_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l160_c7_25b4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_return_output := result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_25b4_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l144_c2_0ae1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output := result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l178_l140_DUPLICATE_9d09 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l178_l140_DUPLICATE_9d09_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_775a(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_0ae1_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l178_l140_DUPLICATE_9d09_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l178_l140_DUPLICATE_9d09_return_output;
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
