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
-- BIN_OP_EQ[uxn_opcodes_h_l144_c6_5e59]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l144_c2_bac4]
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_bac4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_bac4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l144_c2_bac4]
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_bac4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_bac4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_bac4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_bac4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_bac4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_bac4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c2_bac4]
signal tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_9970]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l160_c11_a660]
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l160_c7_6f78]
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_6f78]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_6f78]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l160_c7_6f78]
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_6f78]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_6f78]
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_6f78]
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l160_c7_6f78]
signal tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l163_c31_d771]
signal CONST_SR_8_uxn_opcodes_h_l163_c31_d771_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l163_c31_d771_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_0a09]
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_3f9b]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l166_c7_38b3]
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_38b3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_38b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_38b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_38b3]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l168_c3_fbdc]
signal CONST_SL_8_uxn_opcodes_h_l168_c3_fbdc_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l168_c3_fbdc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_195d]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l171_c7_31ac]
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_31ac]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_31ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_31ac]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l172_c3_8069]
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_8069_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_8069_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_8069_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_b666]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_fea3]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e482( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.is_stack_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59
BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4
result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_cond,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4
result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_cond,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c2_bac4
tmp16_MUX_uxn_opcodes_h_l144_c2_bac4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_cond,
tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660
BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_left,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_right,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78
result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_cond,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78
result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_cond,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_return_output);

-- tmp16_MUX_uxn_opcodes_h_l160_c7_6f78
tmp16_MUX_uxn_opcodes_h_l160_c7_6f78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_cond,
tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue,
tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse,
tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_return_output);

-- CONST_SR_8_uxn_opcodes_h_l163_c31_d771
CONST_SR_8_uxn_opcodes_h_l163_c31_d771 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l163_c31_d771_x,
CONST_SR_8_uxn_opcodes_h_l163_c31_d771_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09_left,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09_right,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b
BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3
result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_cond,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_38b3
tmp16_MUX_uxn_opcodes_h_l166_c7_38b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_return_output);

-- CONST_SL_8_uxn_opcodes_h_l168_c3_fbdc
CONST_SL_8_uxn_opcodes_h_l168_c3_fbdc : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l168_c3_fbdc_x,
CONST_SL_8_uxn_opcodes_h_l168_c3_fbdc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d
BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac
result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_cond,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_31ac
tmp16_MUX_uxn_opcodes_h_l171_c7_31ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l172_c3_8069
BIN_OP_OR_uxn_opcodes_h_l172_c3_8069 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l172_c3_8069_left,
BIN_OP_OR_uxn_opcodes_h_l172_c3_8069_right,
BIN_OP_OR_uxn_opcodes_h_l172_c3_8069_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_return_output,
 tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_return_output,
 CONST_SR_8_uxn_opcodes_h_l163_c31_d771_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_return_output,
 CONST_SL_8_uxn_opcodes_h_l168_c3_fbdc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_return_output,
 BIN_OP_OR_uxn_opcodes_h_l172_c3_8069_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_0ee6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_0a73 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l148_c3_2875 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_256e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_6f78_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_f214 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_6f78_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_b870 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_6f78_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l164_c3_ea5a : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_d771_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_d771_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_22f8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_fbdc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_fbdc_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l174_c3_07fa : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_8069_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_8069_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_8069_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_370f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_286a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_47ea_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_c741_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_055f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l178_l140_DUPLICATE_6ab7_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_0ee6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_0ee6;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_b870 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_b870;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_0a73 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_0a73;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_f214 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_f214;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_8069_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_d771_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse := tmp16;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_055f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_055f_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l160_c11_a660] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_left;
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_return_output := BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_9970] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_3f9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l163_c31_d771] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l163_c31_d771_x <= VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_d771_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_d771_return_output := CONST_SR_8_uxn_opcodes_h_l163_c31_d771_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l144_c2_bac4] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_bac4_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l144_c2_bac4] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_bac4_return_output := result.is_vram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l160_c7_6f78] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_6f78_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c6_5e59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_370f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_370f_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_c741 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_c741_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_0a09] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09_left;
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09_return_output := BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09_return_output;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d[uxn_opcodes_h_l160_c7_6f78] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_6f78_return_output := result.u8_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l144_c2_bac4] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_bac4_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_47ea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_47ea_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_286a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_286a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_195d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l160_c7_6f78] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_6f78_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_5e59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_a660_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_3f9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_195d_return_output;
     VAR_tmp16_uxn_opcodes_h_l148_c3_2875 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_9970_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l164_c3_ea5a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_0a09_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_8069_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_c741_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_fbdc_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_c741_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_055f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_055f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_286a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_286a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_286a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_370f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_370f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_370f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_47ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_47ea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_bac4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_bac4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_bac4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_6f78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_6f78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_6f78_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue := VAR_result_u16_value_uxn_opcodes_h_l164_c3_ea5a;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue := VAR_tmp16_uxn_opcodes_h_l148_c3_2875;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_bac4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l156_c21_256e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_256e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l148_c3_2875);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l163_c21_22f8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_22f8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_d771_return_output);

     -- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_bac4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_6f78] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_31ac] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_6f78] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_38b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_31ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l172_c3_8069] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l172_c3_8069_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_8069_left;
     BIN_OP_OR_uxn_opcodes_h_l172_c3_8069_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_8069_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_8069_return_output := BIN_OP_OR_uxn_opcodes_h_l172_c3_8069_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_bac4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l168_c3_fbdc] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l168_c3_fbdc_x <= VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_fbdc_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_fbdc_return_output := CONST_SL_8_uxn_opcodes_h_l168_c3_fbdc_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666_right := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_8069_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_8069_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_256e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_22f8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_fbdc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_31ac_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_31ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_38b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_6f78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_6f78_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_6f78] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_b666] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l171_c7_31ac] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l160_c7_6f78] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_cond;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_return_output := result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_bac4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_bac4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_38b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_38b3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_b666_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_38b3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_38b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_6f78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_6f78_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_31ac_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_bac4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_6f78] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_fea3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_6f78] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l144_c2_bac4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_return_output := result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l166_c7_38b3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l174_c3_07fa := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_fea3_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_6f78_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_6f78_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_38b3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue := VAR_result_u16_value_uxn_opcodes_h_l174_c3_07fa;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_bac4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l160_c7_6f78] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_cond;
     tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue;
     tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_return_output := tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l171_c7_31ac] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_cond;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_return_output := result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_bac4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_31ac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_6f78_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l166_c7_38b3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_return_output := result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l144_c2_bac4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_return_output := tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_38b3_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_bac4_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l160_c7_6f78] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_cond;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_return_output := result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_6f78_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l144_c2_bac4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_return_output := result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l178_l140_DUPLICATE_6ab7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l178_l140_DUPLICATE_6ab7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e482(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_bac4_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_bac4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_bac4_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_bac4_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_bac4_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_bac4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_bac4_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_bac4_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l178_l140_DUPLICATE_6ab7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l178_l140_DUPLICATE_6ab7_return_output;
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
