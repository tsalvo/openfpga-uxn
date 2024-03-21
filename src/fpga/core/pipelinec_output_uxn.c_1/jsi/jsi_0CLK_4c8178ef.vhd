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
-- BIN_OP_EQ[uxn_opcodes_h_l144_c6_97bf]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c2_4941]
signal tmp16_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_4941]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_4941]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l144_c2_4941]
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l144_c2_4941]
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_4941]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_4941]
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_4941]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_4941]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_4941]
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_4941]
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_0763]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l160_c11_9be8]
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l160_c7_b0fb]
signal tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_b0fb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_b0fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_b0fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_b0fb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l160_c7_b0fb]
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l160_c7_b0fb]
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_b0fb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l163_c31_8606]
signal CONST_SR_8_uxn_opcodes_h_l163_c31_8606_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l163_c31_8606_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_e6e3]
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_c75a]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_b57c]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l166_c7_b57c]
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_b57c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_b57c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_b57c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l168_c3_6547]
signal CONST_SL_8_uxn_opcodes_h_l168_c3_6547_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l168_c3_6547_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_b501]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_6620]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_6620_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_6620_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_6620_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_6620_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l171_c7_6620]
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_6620]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_6620]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l172_c3_b8f4]
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_5630]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_ea85]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_7557( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.is_stack_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf
BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c2_4941
tmp16_MUX_uxn_opcodes_h_l144_c2_4941 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c2_4941_cond,
tmp16_MUX_uxn_opcodes_h_l144_c2_4941_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c2_4941_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c2_4941_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941
result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_cond,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941
result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_cond,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8
BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_left,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_right,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb
tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_cond,
tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue,
tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse,
tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb
result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_cond,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb
result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_cond,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output);

-- CONST_SR_8_uxn_opcodes_h_l163_c31_8606
CONST_SR_8_uxn_opcodes_h_l163_c31_8606 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l163_c31_8606_x,
CONST_SR_8_uxn_opcodes_h_l163_c31_8606_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3_left,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3_right,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a
BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_b57c
tmp16_MUX_uxn_opcodes_h_l166_c7_b57c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c
result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_cond,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l168_c3_6547
CONST_SL_8_uxn_opcodes_h_l168_c3_6547 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l168_c3_6547_x,
CONST_SL_8_uxn_opcodes_h_l168_c3_6547_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501
BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_6620
tmp16_MUX_uxn_opcodes_h_l171_c7_6620 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_6620_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_6620_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_6620_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_6620_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620
result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_cond,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4
BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4_left,
BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4_right,
BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c2_4941_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_return_output,
 tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output,
 CONST_SR_8_uxn_opcodes_h_l163_c31_8606_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_return_output,
 CONST_SL_8_uxn_opcodes_h_l168_c3_6547_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_6620_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_return_output,
 BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l148_c3_a228 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_0458 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_8395 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_aa66_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_7c14 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_b0fb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_d6fd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_b0fb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l164_c3_4bee : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_b0fb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_8606_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_8606_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_c0c5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_6620_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_6547_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_6547_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_6620_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_6620_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_6620_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l174_c3_bca5 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l171_l166_DUPLICATE_41fc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l171_l166_DUPLICATE_da69_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_9544_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_ab1f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l171_l166_DUPLICATE_a802_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l140_l178_DUPLICATE_cab4_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_7c14 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_7c14;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_8395 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_8395;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_0458 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_0458;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_d6fd := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_d6fd;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_8606_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_6620_iffalse := tmp16;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l144_c2_4941] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_4941_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l171_l166_DUPLICATE_41fc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l171_l166_DUPLICATE_41fc_return_output := result.is_opc_done;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l160_c7_b0fb] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_b0fb_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c6_97bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l171_l166_DUPLICATE_a802 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l171_l166_DUPLICATE_a802_return_output := result.u16_value;

     -- CONST_SR_8[uxn_opcodes_h_l163_c31_8606] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l163_c31_8606_x <= VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_8606_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_8606_return_output := CONST_SR_8_uxn_opcodes_h_l163_c31_8606_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_c75a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_9544 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_9544_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_e6e3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_0763] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_b501] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l144_c2_4941] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_4941_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l144_c2_4941] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_4941_return_output := result.is_vram_write;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d[uxn_opcodes_h_l160_c7_b0fb] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_b0fb_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_ab1f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_ab1f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l160_c7_b0fb] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_b0fb_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l171_l166_DUPLICATE_da69 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l171_l166_DUPLICATE_da69_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l160_c11_9be8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_left;
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_return_output := BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_97bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_9be8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_c75a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_6620_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_b501_return_output;
     VAR_tmp16_uxn_opcodes_h_l148_c3_a228 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_0763_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l164_c3_4bee := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_e6e3_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_ab1f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_6547_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_ab1f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l171_l166_DUPLICATE_a802_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l171_l166_DUPLICATE_a802_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l171_l166_DUPLICATE_41fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l171_l166_DUPLICATE_41fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l171_l166_DUPLICATE_41fc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l171_l166_DUPLICATE_da69_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l171_l166_DUPLICATE_da69_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l171_l166_DUPLICATE_da69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_9544_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_9544_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_4941_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_4941_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_4941_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_b0fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_b0fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_b0fb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue := VAR_result_u16_value_uxn_opcodes_h_l164_c3_4bee;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4941_iftrue := VAR_tmp16_uxn_opcodes_h_l148_c3_a228;
     -- BIN_OP_OR[uxn_opcodes_h_l172_c3_b8f4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4_left;
     BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4_return_output := BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_b0fb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_4941] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_4941] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_4941] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_6620] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l163_c21_c0c5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_c0c5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_8606_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l156_c21_aa66] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_aa66_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l148_c3_a228);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_b0fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_b57c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l168_c3_6547] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l168_c3_6547_x <= VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_6547_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_6547_return_output := CONST_SL_8_uxn_opcodes_h_l168_c3_6547_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_6620] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630_right := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_6620_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_b8f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_aa66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_c0c5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_6547_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_6620_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_6620_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_b57c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_4941] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_b57c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_b0fb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_4941] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l171_c7_6620] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_6620_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_6620_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_6620_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_6620_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_6620_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_6620_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_6620_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_6620_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_5630] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l160_c7_b0fb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output := result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_b57c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_5630_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_b57c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_b57c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_6620_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l144_c2_4941] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_cond;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_return_output := result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_b0fb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_ea85] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_b0fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_4941] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l166_c7_b57c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l174_c3_bca5 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ea85_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_b57c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_iftrue := VAR_result_u16_value_uxn_opcodes_h_l174_c3_bca5;
     -- tmp16_MUX[uxn_opcodes_h_l160_c7_b0fb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_cond;
     tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output := tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l171_c7_6620] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_cond;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_return_output := result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_4941] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_4941] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_6620_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4941_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l144_c2_4941] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c2_4941_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4941_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c2_4941_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4941_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c2_4941_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4941_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4941_return_output := tmp16_MUX_uxn_opcodes_h_l144_c2_4941_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l166_c7_b57c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_return_output := result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_b57c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_4941_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l160_c7_b0fb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output := result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_b0fb_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l144_c2_4941] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_cond;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_return_output := result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l140_l178_DUPLICATE_cab4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l140_l178_DUPLICATE_cab4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7557(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_4941_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_4941_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_4941_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_4941_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_4941_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_4941_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_4941_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_4941_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l140_l178_DUPLICATE_cab4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l140_l178_DUPLICATE_cab4_return_output;
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
