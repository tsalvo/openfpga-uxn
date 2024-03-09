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
-- BIN_OP_EQ[uxn_opcodes_h_l144_c6_422a]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c2_c29f]
signal tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_c29f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l144_c2_c29f]
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_c29f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_c29f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l144_c2_c29f]
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_c29f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_c29f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_c29f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_c29f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_c29f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_cda6]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l160_c11_f71d]
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l160_c7_43c4]
signal tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l160_c7_43c4]
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_43c4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_43c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l160_c7_43c4]
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_43c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_43c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_43c4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l163_c31_297c]
signal CONST_SR_8_uxn_opcodes_h_l163_c31_297c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l163_c31_297c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_4484]
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_1ada]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_be98]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_be98_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_be98_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_be98_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_be98_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_be98]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l166_c7_be98]
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_be98]
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_be98]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l168_c3_0281]
signal CONST_SL_8_uxn_opcodes_h_l168_c3_0281_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l168_c3_0281_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_dabc]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_03cb]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_03cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l171_c7_03cb]
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_03cb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l172_c3_c031]
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_c031_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_c031_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_c031_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_e8a1]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_ec65]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_d9be( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.sp_relative_shift := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a
BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c2_c29f
tmp16_MUX_uxn_opcodes_h_l144_c2_c29f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_cond,
tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f
result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_cond,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f
result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_cond,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d
BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_left,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_right,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l160_c7_43c4
tmp16_MUX_uxn_opcodes_h_l160_c7_43c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_cond,
tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue,
tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse,
tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4
result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_cond,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4
result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_cond,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_return_output);

-- CONST_SR_8_uxn_opcodes_h_l163_c31_297c
CONST_SR_8_uxn_opcodes_h_l163_c31_297c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l163_c31_297c_x,
CONST_SR_8_uxn_opcodes_h_l163_c31_297c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484_left,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484_right,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada
BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_be98
tmp16_MUX_uxn_opcodes_h_l166_c7_be98 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_be98_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_be98_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_be98_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_be98_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98
result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_cond,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_return_output);

-- CONST_SL_8_uxn_opcodes_h_l168_c3_0281
CONST_SL_8_uxn_opcodes_h_l168_c3_0281 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l168_c3_0281_x,
CONST_SL_8_uxn_opcodes_h_l168_c3_0281_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc
BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_03cb
tmp16_MUX_uxn_opcodes_h_l171_c7_03cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb
result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_cond,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l172_c3_c031
BIN_OP_OR_uxn_opcodes_h_l172_c3_c031 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l172_c3_c031_left,
BIN_OP_OR_uxn_opcodes_h_l172_c3_c031_right,
BIN_OP_OR_uxn_opcodes_h_l172_c3_c031_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_return_output,
 tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_return_output,
 CONST_SR_8_uxn_opcodes_h_l163_c31_297c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_be98_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_return_output,
 CONST_SL_8_uxn_opcodes_h_l168_c3_0281_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l172_c3_c031_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l148_c3_fb2a : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_f52f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_59bb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_f201_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_be98_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l164_c3_033a : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_43c4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_003f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_43c4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_2619 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_43c4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_297c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_297c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_c3cd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_be98_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_be98_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_be98_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_0281_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_0281_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l174_c3_e00e : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_c031_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_c031_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_c031_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_1053_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_c456_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_e86e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_0a7f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_b7f4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l178_l140_DUPLICATE_133d_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_f52f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_f52f;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_003f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_003f;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_2619 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_2619;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_59bb := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_59bb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_c031_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_297c_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_e86e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_e86e_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l144_c2_c29f] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_c29f_return_output := result.is_ram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_cda6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_4484] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484_left;
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484_return_output := BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c6_422a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_1053 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_1053_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l144_c2_c29f] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_c29f_return_output := result.is_vram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l160_c7_43c4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_43c4_return_output := result.stack_address_sp_offset;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l160_c7_43c4] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_43c4_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_c456 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_c456_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_0a7f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_0a7f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_SR_8[uxn_opcodes_h_l163_c31_297c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l163_c31_297c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_297c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_297c_return_output := CONST_SR_8_uxn_opcodes_h_l163_c31_297c_return_output;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d[uxn_opcodes_h_l160_c7_43c4] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_43c4_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l160_c11_f71d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_left;
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_return_output := BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_1ada] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_dabc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_b7f4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_b7f4_return_output := result.u16_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l144_c2_c29f] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_c29f_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_422a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_f71d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_be98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_1ada_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_dabc_return_output;
     VAR_tmp16_uxn_opcodes_h_l148_c3_fb2a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_cda6_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l164_c3_033a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_4484_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_c031_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_0a7f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_0281_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l167_l172_DUPLICATE_0a7f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_b7f4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_b7f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_c456_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_c456_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_c456_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_1053_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_1053_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l160_l166_l171_DUPLICATE_1053_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_e86e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l160_l166_DUPLICATE_e86e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_c29f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_c29f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_c29f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_43c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_43c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_43c4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue := VAR_result_u16_value_uxn_opcodes_h_l164_c3_033a;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue := VAR_tmp16_uxn_opcodes_h_l148_c3_fb2a;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_43c4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_c29f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_be98] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_43c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_03cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_c29f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l156_c21_f201] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_f201_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l148_c3_fb2a);

     -- BIN_OP_OR[uxn_opcodes_h_l172_c3_c031] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l172_c3_c031_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_c031_left;
     BIN_OP_OR_uxn_opcodes_h_l172_c3_c031_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_c031_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_c031_return_output := BIN_OP_OR_uxn_opcodes_h_l172_c3_c031_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_c29f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_03cb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l163_c21_c3cd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_c3cd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_297c_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l168_c3_0281] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l168_c3_0281_x <= VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_0281_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_0281_return_output := CONST_SL_8_uxn_opcodes_h_l168_c3_0281_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1_right := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_c031_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_c031_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_f201_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_c3cd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_be98_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_0281_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_03cb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_03cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_be98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_43c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_43c4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l160_c7_43c4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_return_output := result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_be98] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_43c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_e8a1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_be98] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l171_c7_03cb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_c29f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_c29f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_e8a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_be98_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_be98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_43c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_43c4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_be98_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_03cb_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_ec65] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_43c4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_c29f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_43c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l144_c2_c29f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_return_output := result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l166_c7_be98] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_be98_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_be98_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_be98_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_be98_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_be98_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_be98_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_be98_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_be98_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l174_c3_e00e := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_ec65_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_43c4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_43c4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_be98_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue := VAR_result_u16_value_uxn_opcodes_h_l174_c3_e00e;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_c29f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l160_c7_43c4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_cond;
     tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_return_output := tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l171_c7_03cb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_return_output := result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_c29f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_03cb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_43c4_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l144_c2_c29f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_return_output := tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l166_c7_be98] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_cond;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_return_output := result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_be98_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_c29f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l160_c7_43c4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_return_output := result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_43c4_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l144_c2_c29f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_return_output := result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l178_l140_DUPLICATE_133d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l178_l140_DUPLICATE_133d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d9be(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_c29f_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_c29f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_c29f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_c29f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_c29f_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_c29f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_c29f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_c29f_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l178_l140_DUPLICATE_133d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l178_l140_DUPLICATE_133d_return_output;
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
