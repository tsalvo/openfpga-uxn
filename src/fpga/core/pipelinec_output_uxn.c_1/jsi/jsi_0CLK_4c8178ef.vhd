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
-- BIN_OP_EQ[uxn_opcodes_h_l144_c6_be49]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l144_c2_9fa8]
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_9fa8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_9fa8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_9fa8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_9fa8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_9fa8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_9fa8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_9fa8]
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_9fa8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l144_c2_9fa8]
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c2_9fa8]
signal tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_10bd]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l160_c11_3a7c]
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l160_c7_5ec5]
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_5ec5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_5ec5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_5ec5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_5ec5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_5ec5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l160_c7_5ec5]
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l160_c7_5ec5]
signal tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l163_c31_7630]
signal CONST_SR_8_uxn_opcodes_h_l163_c31_7630_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l163_c31_7630_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_70c6]
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_5f57]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l166_c7_e0ec]
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_e0ec]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_e0ec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_e0ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_e0ec]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l168_c3_787e]
signal CONST_SL_8_uxn_opcodes_h_l168_c3_787e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l168_c3_787e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_9e7e]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l171_c7_e886]
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_e886]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_e886]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_e886]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_e886_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_e886_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_e886_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_e886_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l172_c3_1059]
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_1059_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_1059_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_1059_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_2268]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_6a7d]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a906( ref_toks_0 : opcode_result_t;
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
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.u8_value := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49
BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8
result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_cond,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8
result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_cond,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8
tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_cond,
tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c
BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_left,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_right,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5
result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_cond,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5
result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_cond,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5
tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_cond,
tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue,
tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse,
tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output);

-- CONST_SR_8_uxn_opcodes_h_l163_c31_7630
CONST_SR_8_uxn_opcodes_h_l163_c31_7630 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l163_c31_7630_x,
CONST_SR_8_uxn_opcodes_h_l163_c31_7630_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6_left,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6_right,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57
BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec
result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_cond,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec
tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output);

-- CONST_SL_8_uxn_opcodes_h_l168_c3_787e
CONST_SL_8_uxn_opcodes_h_l168_c3_787e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l168_c3_787e_x,
CONST_SL_8_uxn_opcodes_h_l168_c3_787e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e
BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886
result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_cond,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_e886
tmp16_MUX_uxn_opcodes_h_l171_c7_e886 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_e886_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_e886_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_e886_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_e886_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l172_c3_1059
BIN_OP_OR_uxn_opcodes_h_l172_c3_1059 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l172_c3_1059_left,
BIN_OP_OR_uxn_opcodes_h_l172_c3_1059_right,
BIN_OP_OR_uxn_opcodes_h_l172_c3_1059_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output,
 tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output,
 CONST_SR_8_uxn_opcodes_h_l163_c31_7630_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output,
 CONST_SL_8_uxn_opcodes_h_l168_c3_787e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_e886_return_output,
 BIN_OP_OR_uxn_opcodes_h_l172_c3_1059_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_3c00 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_8bc1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l148_c3_97a9 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_822d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l164_c3_86f3 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_83e0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_5ec5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_cacc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_5ec5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_5ec5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_7630_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_7630_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_9faa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e886_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_787e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_787e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l174_c3_bd35 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e886_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e886_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e886_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_1059_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_1059_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_1059_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_4e6c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_7416_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_f917_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_f58f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_709f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l178_l140_DUPLICATE_af02_return_output : opcode_result_t;
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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_cacc := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_cacc;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_3c00 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_3c00;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_83e0 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_83e0;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_8bc1 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_8bc1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_1059_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_7630_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e886_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_5f57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c6_be49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_4e6c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_4e6c_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_f58f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_f58f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l144_c2_9fa8] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_9fa8_return_output := result.is_vram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_70c6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l160_c7_5ec5] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_5ec5_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l144_c2_9fa8] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_9fa8_return_output := result.is_ram_write;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d[uxn_opcodes_h_l160_c7_5ec5] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_5ec5_return_output := result.u8_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_10bd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l163_c31_7630] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l163_c31_7630_x <= VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_7630_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_7630_return_output := CONST_SR_8_uxn_opcodes_h_l163_c31_7630_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l160_c7_5ec5] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_5ec5_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_f917 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_f917_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_9e7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l160_c11_3a7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_7416 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_7416_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_709f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_709f_return_output := result.u16_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l144_c2_9fa8] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_9fa8_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_be49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3a7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5f57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_9e7e_return_output;
     VAR_tmp16_uxn_opcodes_h_l148_c3_97a9 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_10bd_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l164_c3_86f3 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_70c6_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_1059_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_f58f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_787e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_f58f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_709f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_709f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_4e6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_4e6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_4e6c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_7416_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_7416_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_7416_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_f917_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_f917_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_9fa8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_9fa8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_9fa8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_5ec5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_5ec5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_5ec5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue := VAR_result_u16_value_uxn_opcodes_h_l164_c3_86f3;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue := VAR_tmp16_uxn_opcodes_h_l148_c3_97a9;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_9fa8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_9fa8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_5ec5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_e886] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_5ec5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l168_c3_787e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l168_c3_787e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_787e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_787e_return_output := CONST_SL_8_uxn_opcodes_h_l168_c3_787e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l172_c3_1059] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l172_c3_1059_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_1059_left;
     BIN_OP_OR_uxn_opcodes_h_l172_c3_1059_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_1059_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_1059_return_output := BIN_OP_OR_uxn_opcodes_h_l172_c3_1059_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l156_c21_822d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_822d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l148_c3_97a9);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_e0ec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_e886] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_9fa8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l163_c21_9faa] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_9faa_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_7630_return_output);

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268_right := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_1059_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e886_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_1059_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_822d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_9faa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_787e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e886_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e886_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_5ec5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l171_c7_e886] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_e886_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e886_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_e886_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e886_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_e886_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e886_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e886_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_e886_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_9fa8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l160_c7_5ec5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output := result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_2268] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_e0ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_9fa8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_e0ec] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2268_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e886_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_9fa8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_5ec5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_6a7d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l166_c7_e0ec] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_5ec5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l144_c2_9fa8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output := result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l174_c3_bd35 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_6a7d_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_iftrue := VAR_result_u16_value_uxn_opcodes_h_l174_c3_bd35;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_9fa8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l160_c7_5ec5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_cond;
     tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output := tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_9fa8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l171_c7_e886] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_cond;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_return_output := result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e886_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l144_c2_9fa8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output := tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l166_c7_e0ec] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_cond;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output := result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_e0ec_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l160_c7_5ec5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output := result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_5ec5_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l144_c2_9fa8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output := result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l178_l140_DUPLICATE_af02 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l178_l140_DUPLICATE_af02_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a906(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_9fa8_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l178_l140_DUPLICATE_af02_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l178_l140_DUPLICATE_af02_return_output;
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
