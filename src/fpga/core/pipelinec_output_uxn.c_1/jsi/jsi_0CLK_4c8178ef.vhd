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
-- BIN_OP_EQ[uxn_opcodes_h_l144_c6_6b67]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c2_1d7b]
signal tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_1d7b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_1d7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_1d7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_1d7b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_1d7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_1d7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_1d7b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l144_c2_1d7b]
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l144_c2_1d7b]
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_1d7b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_d635]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l160_c11_d7db]
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l160_c7_30c9]
signal tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_30c9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l160_c7_30c9]
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_30c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_30c9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l160_c7_30c9]
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_30c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_30c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l163_c31_9549]
signal CONST_SR_8_uxn_opcodes_h_l163_c31_9549_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l163_c31_9549_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_21b8]
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_5352]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_d4ff]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_d4ff]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l166_c7_d4ff]
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_d4ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_d4ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l168_c3_d31b]
signal CONST_SL_8_uxn_opcodes_h_l168_c3_d31b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l168_c3_d31b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_e47c]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_e2af]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_e2af]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l171_c7_e2af]
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_e2af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l172_c3_1887]
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_1887_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_1887_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_1887_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_d838]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_613e]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_42c1( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
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
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.u8_value := ref_toks_9;
      base.is_vram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67
BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b
tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_cond,
tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b
result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_cond,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b
result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_cond,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db
BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_left,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_right,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_return_output);

-- tmp16_MUX_uxn_opcodes_h_l160_c7_30c9
tmp16_MUX_uxn_opcodes_h_l160_c7_30c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_cond,
tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue,
tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse,
tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9
result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_cond,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9
result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_cond,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_return_output);

-- CONST_SR_8_uxn_opcodes_h_l163_c31_9549
CONST_SR_8_uxn_opcodes_h_l163_c31_9549 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l163_c31_9549_x,
CONST_SR_8_uxn_opcodes_h_l163_c31_9549_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8_left,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8_right,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352
BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff
tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff
result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_cond,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output);

-- CONST_SL_8_uxn_opcodes_h_l168_c3_d31b
CONST_SL_8_uxn_opcodes_h_l168_c3_d31b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l168_c3_d31b_x,
CONST_SL_8_uxn_opcodes_h_l168_c3_d31b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c
BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_e2af
tmp16_MUX_uxn_opcodes_h_l171_c7_e2af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af
result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_cond,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l172_c3_1887
BIN_OP_OR_uxn_opcodes_h_l172_c3_1887 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l172_c3_1887_left,
BIN_OP_OR_uxn_opcodes_h_l172_c3_1887_right,
BIN_OP_OR_uxn_opcodes_h_l172_c3_1887_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_return_output,
 tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_return_output,
 CONST_SR_8_uxn_opcodes_h_l163_c31_9549_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output,
 CONST_SL_8_uxn_opcodes_h_l168_c3_d31b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_return_output,
 BIN_OP_OR_uxn_opcodes_h_l172_c3_1887_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l148_c3_c814 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_12c0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_59b6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_c1a8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l164_c3_7188 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_ad82 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_30c9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_30c9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_3f59 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_30c9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_9549_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_9549_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_8073_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_d31b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_d31b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l174_c3_3488 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_1887_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_1887_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_1887_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_8519_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_6f44_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_5ce8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_faf6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_fb6b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l178_l140_DUPLICATE_f40d_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_12c0 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_12c0;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_ad82 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_ad82;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_59b6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_59b6;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_3f59 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_3f59;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_1887_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_9549_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l144_c6_6b67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_e47c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l144_c2_1d7b] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_1d7b_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_fb6b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_fb6b_return_output := result.u16_value;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l160_c7_30c9] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_30c9_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_5ce8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_5ce8_return_output := result.is_stack_write;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d[uxn_opcodes_h_l160_c7_30c9] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_30c9_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l160_c11_d7db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_left;
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_return_output := BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_8519 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_8519_return_output := result.is_pc_updated;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l144_c2_1d7b] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_1d7b_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_faf6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_faf6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l160_c7_30c9] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_30c9_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l144_c2_1d7b] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_1d7b_return_output := result.is_vram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_d635] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_21b8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l163_c31_9549] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l163_c31_9549_x <= VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_9549_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_9549_return_output := CONST_SR_8_uxn_opcodes_h_l163_c31_9549_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_5352] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_6f44 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_6f44_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_6b67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_d7db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_5352_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_e47c_return_output;
     VAR_tmp16_uxn_opcodes_h_l148_c3_c814 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_d635_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l164_c3_7188 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_21b8_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_1887_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_faf6_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_d31b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_faf6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_fb6b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_fb6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_6f44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_6f44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_6f44_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_8519_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_8519_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_8519_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_5ce8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_5ce8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_1d7b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_1d7b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_1d7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_30c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_30c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_30c9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue := VAR_result_u16_value_uxn_opcodes_h_l164_c3_7188;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue := VAR_tmp16_uxn_opcodes_h_l148_c3_c814;
     -- CONST_SL_8[uxn_opcodes_h_l168_c3_d31b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l168_c3_d31b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_d31b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_d31b_return_output := CONST_SL_8_uxn_opcodes_h_l168_c3_d31b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l172_c3_1887] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l172_c3_1887_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_1887_left;
     BIN_OP_OR_uxn_opcodes_h_l172_c3_1887_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_1887_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_1887_return_output := BIN_OP_OR_uxn_opcodes_h_l172_c3_1887_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_e2af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_1d7b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_1d7b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l156_c21_c1a8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_c1a8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l148_c3_c814);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_d4ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_30c9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_1d7b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_e2af] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_30c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l163_c21_8073] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_8073_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_9549_return_output);

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838_right := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_1887_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_1887_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_c1a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_8073_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_d31b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e2af_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e2af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_30c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_30c9_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l171_c7_e2af] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_1d7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_d4ff] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l160_c7_30c9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_return_output := result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_30c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_1d7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_d838] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_d4ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_d838_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_30c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_30c9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e2af_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l166_c7_d4ff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_1d7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_30c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_30c9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l144_c2_1d7b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output := result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_613e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l174_c3_3488 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_613e_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_30c9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_30c9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue := VAR_result_u16_value_uxn_opcodes_h_l174_c3_3488;
     -- tmp16_MUX[uxn_opcodes_h_l160_c7_30c9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_cond;
     tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_return_output := tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_1d7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_1d7b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l171_c7_e2af] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_cond;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_return_output := result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e2af_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_30c9_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l144_c2_1d7b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output := tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l166_c7_d4ff] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_cond;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output := result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_d4ff_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l160_c7_30c9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_return_output := result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_30c9_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l144_c2_1d7b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output := result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l178_l140_DUPLICATE_f40d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l178_l140_DUPLICATE_f40d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_42c1(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_1d7b_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l178_l140_DUPLICATE_f40d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l178_l140_DUPLICATE_f40d_return_output;
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
