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
-- BIN_OP_EQ[uxn_opcodes_h_l144_c6_94e2]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c2_2f9e]
signal tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_2f9e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_2f9e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_2f9e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_2f9e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_2f9e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_2f9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l144_c2_2f9e]
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_2f9e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_2f9e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l144_c2_2f9e]
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_45e9]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l160_c11_457a]
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l160_c7_1e61]
signal tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_1e61]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l160_c7_1e61]
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_1e61]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_1e61]
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l160_c7_1e61]
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_1e61]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_1e61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l163_c31_660c]
signal CONST_SR_8_uxn_opcodes_h_l163_c31_660c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l163_c31_660c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_764b]
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_649e]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_5201]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_5201_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_5201_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_5201_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_5201_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l166_c7_5201]
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_5201]
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_5201]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_5201]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l168_c3_441e]
signal CONST_SL_8_uxn_opcodes_h_l168_c3_441e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l168_c3_441e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_dd3d]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_b57d]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l171_c7_b57d]
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_b57d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_b57d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l172_c3_5eb3]
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_9f57]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_2771]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_d736( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_vram_write := ref_toks_9;
      base.u8_value := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2
BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e
tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_cond,
tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e
result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_cond,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e
result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_cond,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a
BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_left,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_right,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l160_c7_1e61
tmp16_MUX_uxn_opcodes_h_l160_c7_1e61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_cond,
tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue,
tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse,
tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61
result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_cond,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61
result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_cond,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_return_output);

-- CONST_SR_8_uxn_opcodes_h_l163_c31_660c
CONST_SR_8_uxn_opcodes_h_l163_c31_660c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l163_c31_660c_x,
CONST_SR_8_uxn_opcodes_h_l163_c31_660c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b_left,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b_right,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e
BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_5201
tmp16_MUX_uxn_opcodes_h_l166_c7_5201 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_5201_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_5201_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_5201_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_5201_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201
result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_cond,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_return_output);

-- CONST_SL_8_uxn_opcodes_h_l168_c3_441e
CONST_SL_8_uxn_opcodes_h_l168_c3_441e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l168_c3_441e_x,
CONST_SL_8_uxn_opcodes_h_l168_c3_441e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d
BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_b57d
tmp16_MUX_uxn_opcodes_h_l171_c7_b57d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d
result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_cond,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3
BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3_left,
BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3_right,
BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_return_output,
 tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_return_output,
 CONST_SR_8_uxn_opcodes_h_l163_c31_660c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_5201_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_return_output,
 CONST_SL_8_uxn_opcodes_h_l168_c3_441e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l148_c3_25de : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_ad2d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_515c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_e8ba_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_5201_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_1d25 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_1e61_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l164_c3_bf7f : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_1e61_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_511b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_1e61_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_660c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_660c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_e0ac_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_5201_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_5201_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_5201_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_441e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_441e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l174_c3_3389 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l160_l171_DUPLICATE_42d0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_2ad6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l160_l171_DUPLICATE_c95e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_d35a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_ebfd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l140_l178_DUPLICATE_c6e1_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_515c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_515c;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_1d25 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_1d25;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_511b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_511b;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_ad2d := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_ad2d;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771_right := to_unsigned(2, 2);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_660c_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_2ad6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_2ad6_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l160_l171_DUPLICATE_c95e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l160_l171_DUPLICATE_c95e_return_output := result.is_opc_done;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l160_c7_1e61] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_1e61_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_ebfd LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_ebfd_return_output := result.u16_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l144_c2_2f9e] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_2f9e_return_output := result.is_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l144_c2_2f9e] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_2f9e_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_649e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c6_94e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_dd3d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l160_l171_DUPLICATE_42d0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l160_l171_DUPLICATE_42d0_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l144_c2_2f9e] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_2f9e_return_output := result.is_vram_write;

     -- CONST_SR_8[uxn_opcodes_h_l163_c31_660c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l163_c31_660c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_660c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_660c_return_output := CONST_SR_8_uxn_opcodes_h_l163_c31_660c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_45e9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l160_c11_457a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_left;
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_return_output := BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_return_output;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d[uxn_opcodes_h_l160_c7_1e61] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_1e61_return_output := result.u8_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l160_c7_1e61] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_1e61_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_764b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_d35a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_d35a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_94e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_457a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_5201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_649e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dd3d_return_output;
     VAR_tmp16_uxn_opcodes_h_l148_c3_25de := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_45e9_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l164_c3_bf7f := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_764b_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_d35a_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_441e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_d35a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_ebfd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_ebfd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l160_l171_DUPLICATE_c95e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l160_l171_DUPLICATE_c95e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l160_l171_DUPLICATE_c95e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l160_l171_DUPLICATE_42d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l160_l171_DUPLICATE_42d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l160_l171_DUPLICATE_42d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_2ad6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_2ad6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_2f9e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_2f9e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_2f9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_1e61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_1e61_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_1e61_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue := VAR_result_u16_value_uxn_opcodes_h_l164_c3_bf7f;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue := VAR_tmp16_uxn_opcodes_h_l148_c3_25de;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_2f9e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_1e61] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_1e61] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l168_c3_441e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l168_c3_441e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_441e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_441e_return_output := CONST_SL_8_uxn_opcodes_h_l168_c3_441e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_5201] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l163_c21_e0ac] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_e0ac_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_660c_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_b57d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_2f9e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_2f9e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l172_c3_5eb3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3_left;
     BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3_return_output := BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_b57d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l156_c21_e8ba] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_e8ba_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l148_c3_25de);

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57_right := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_5eb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_e8ba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_e0ac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_5201_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_441e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_b57d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_b57d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_5201_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_1e61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_1e61_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l171_c7_b57d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_5201] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_1e61] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_5201] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l160_c7_1e61] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_cond;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_return_output := result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_2f9e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_2f9e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_9f57] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_9f57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_5201_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_5201_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_1e61_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_1e61_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_5201_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_b57d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_2f9e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_2771] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l166_c7_5201] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_5201_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_5201_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_5201_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_5201_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_5201_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_5201_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_5201_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_5201_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_1e61] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l144_c2_2f9e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output := result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_1e61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l174_c3_3389 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_2771_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_1e61_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_1e61_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_5201_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue := VAR_result_u16_value_uxn_opcodes_h_l174_c3_3389;
     -- result_u16_value_MUX[uxn_opcodes_h_l171_c7_b57d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_return_output := result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_2f9e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l160_c7_1e61] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_cond;
     tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue;
     tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_return_output := tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_2f9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_b57d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_1e61_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l166_c7_5201] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_cond;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_return_output := result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l144_c2_2f9e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output := tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_5201_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l160_c7_1e61] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_cond;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_return_output := result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_1e61_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l144_c2_2f9e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output := result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l140_l178_DUPLICATE_c6e1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l140_l178_DUPLICATE_c6e1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d736(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_2f9e_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l140_l178_DUPLICATE_c6e1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l140_l178_DUPLICATE_c6e1_return_output;
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
