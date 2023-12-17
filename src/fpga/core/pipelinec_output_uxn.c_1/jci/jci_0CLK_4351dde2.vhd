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
-- Submodules: 42
entity jci_0CLK_4351dde2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_4351dde2;
architecture arch of jci_0CLK_4351dde2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l71_c6_64fc]
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l71_c2_3ed2]
signal tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l71_c2_3ed2]
signal t8_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_3ed2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_3ed2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_3ed2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_3ed2]
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_3ed2]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_3ed2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l71_c2_3ed2]
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_3ed2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_3ed2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_3f9b]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_fc05]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l85_c7_fc05]
signal t8_MUX_uxn_opcodes_h_l85_c7_fc05_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_fc05_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_fc05]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l85_c7_fc05]
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_fc05]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_fc05]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_fc05]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_78b7]
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_a22e]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_5050]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_5050_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_5050_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_5050_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_5050_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l90_c7_5050]
signal t8_MUX_uxn_opcodes_h_l90_c7_5050_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_5050_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_5050_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_5050_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l90_c7_5050]
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_5050]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_5050]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_5050]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_return_output : signed(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l93_c3_12a3]
signal CONST_SL_8_uxn_opcodes_h_l93_c3_12a3_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l93_c3_12a3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l96_c11_6a26]
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l96_c7_05de]
signal tmp16_MUX_uxn_opcodes_h_l96_c7_05de_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_05de_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_05de_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_05de_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l96_c7_05de]
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_05de]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_05de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l97_c3_57ca]
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c22_4756]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_495a]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_3725]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_056d]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l99_c22_6773]
signal MUX_uxn_opcodes_h_l99_c22_6773_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_6773_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_6773_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_6773_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc
BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_left,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_right,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2
tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_cond,
tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue,
tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse,
tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output);

-- t8_MUX_uxn_opcodes_h_l71_c2_3ed2
t8_MUX_uxn_opcodes_h_l71_c2_3ed2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l71_c2_3ed2_cond,
t8_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue,
t8_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse,
t8_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2
result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_cond,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b
BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_fc05
tmp16_MUX_uxn_opcodes_h_l85_c7_fc05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_return_output);

-- t8_MUX_uxn_opcodes_h_l85_c7_fc05
t8_MUX_uxn_opcodes_h_l85_c7_fc05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l85_c7_fc05_cond,
t8_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue,
t8_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse,
t8_MUX_uxn_opcodes_h_l85_c7_fc05_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05
result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_cond,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7_left,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7_right,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e
BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_5050
tmp16_MUX_uxn_opcodes_h_l90_c7_5050 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_5050_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_5050_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_5050_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_5050_return_output);

-- t8_MUX_uxn_opcodes_h_l90_c7_5050
t8_MUX_uxn_opcodes_h_l90_c7_5050 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l90_c7_5050_cond,
t8_MUX_uxn_opcodes_h_l90_c7_5050_iftrue,
t8_MUX_uxn_opcodes_h_l90_c7_5050_iffalse,
t8_MUX_uxn_opcodes_h_l90_c7_5050_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050
result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_cond,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_return_output);

-- CONST_SL_8_uxn_opcodes_h_l93_c3_12a3
CONST_SL_8_uxn_opcodes_h_l93_c3_12a3 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l93_c3_12a3_x,
CONST_SL_8_uxn_opcodes_h_l93_c3_12a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26
BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_left,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_right,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_return_output);

-- tmp16_MUX_uxn_opcodes_h_l96_c7_05de
tmp16_MUX_uxn_opcodes_h_l96_c7_05de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l96_c7_05de_cond,
tmp16_MUX_uxn_opcodes_h_l96_c7_05de_iftrue,
tmp16_MUX_uxn_opcodes_h_l96_c7_05de_iffalse,
tmp16_MUX_uxn_opcodes_h_l96_c7_05de_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de
result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_cond,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca
BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca_left,
BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca_right,
BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756
BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d_return_output);

-- MUX_uxn_opcodes_h_l99_c22_6773
MUX_uxn_opcodes_h_l99_c22_6773 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l99_c22_6773_cond,
MUX_uxn_opcodes_h_l99_c22_6773_iftrue,
MUX_uxn_opcodes_h_l99_c22_6773_iffalse,
MUX_uxn_opcodes_h_l99_c22_6773_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp16,
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_return_output,
 tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output,
 t8_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_return_output,
 t8_MUX_uxn_opcodes_h_l85_c7_fc05_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_5050_return_output,
 t8_MUX_uxn_opcodes_h_l90_c7_5050_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_return_output,
 CONST_SL_8_uxn_opcodes_h_l93_c3_12a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_return_output,
 tmp16_MUX_uxn_opcodes_h_l96_c7_05de_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_return_output,
 BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d_return_output,
 MUX_uxn_opcodes_h_l99_c22_6773_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_fc05_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_cf89 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_0a64 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_5050_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_5050_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_fc05_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_a268 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_fc05_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l88_c3_88f0 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_f9d1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_5050_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_5050_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_05de_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_5050_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_5050_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_5050_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_5050_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_27bc : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_5050_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_12a3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_12a3_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_05de_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_05de_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_05de_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_6773_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_6773_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_6773_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_6773_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_2356_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_9cb5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_00d2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_9cec_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc_uxn_opcodes_h_l103_l66_DUPLICATE_8de6_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_cf89 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_cf89;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_f9d1 := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_f9d1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_a268 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_a268;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_27bc := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_27bc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_0a64 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_0a64;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_5050_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_5050_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_05de_iffalse := tmp16;
     -- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_78b7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7_left;
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7_return_output := BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_9cb5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_9cb5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_3f9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l96_c11_6a26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_left;
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_return_output := BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l71_c2_3ed2] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_3ed2_return_output := result.is_ram_write;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l71_c2_3ed2] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_3ed2_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l71_c2_3ed2] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_3ed2_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_2356 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_2356_return_output := result.is_pc_updated;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l90_c7_5050] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_5050_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l85_c7_fc05] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_fc05_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l71_c6_64fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c22_4756] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l71_c2_3ed2] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_3ed2_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_00d2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_00d2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_a22e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_9cec LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_9cec_return_output := result.u16_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_495a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_3ed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_64fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_fc05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3f9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_5050_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_5050_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_a22e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_05de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_6a26_return_output;
     VAR_MUX_uxn_opcodes_h_l99_c22_6773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_4756_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l88_c3_88f0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_78b7_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l99_c22_6773_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_495a_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_00d2_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_12a3_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_00d2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_9cec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_9cec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_9cb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_9cb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_9cb5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_2356_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_2356_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_2356_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_3ed2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_3ed2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_3ed2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_3ed2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_5050_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_fc05_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue := VAR_result_u16_value_uxn_opcodes_h_l88_c3_88f0;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_3ed2] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_05de] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l93_c3_12a3] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l93_c3_12a3_x <= VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_12a3_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_12a3_return_output := CONST_SL_8_uxn_opcodes_h_l93_c3_12a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_5050] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_3ed2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output;

     -- t8_MUX[uxn_opcodes_h_l90_c7_5050] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l90_c7_5050_cond <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_5050_cond;
     t8_MUX_uxn_opcodes_h_l90_c7_5050_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_5050_iftrue;
     t8_MUX_uxn_opcodes_h_l90_c7_5050_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_5050_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_5050_return_output := t8_MUX_uxn_opcodes_h_l90_c7_5050_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_fc05] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_05de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_3ed2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l97_c3_57ca] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca_left;
     BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca_return_output := BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_3ed2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725_right := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_05de_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_57ca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_5050_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_12a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_05de_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_05de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_5050_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_fc05_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse := VAR_t8_MUX_uxn_opcodes_h_l90_c7_5050_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_5050] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_3725] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_fc05] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_return_output;

     -- t8_MUX[uxn_opcodes_h_l85_c7_fc05] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l85_c7_fc05_cond <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_fc05_cond;
     t8_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue;
     t8_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_fc05_return_output := t8_MUX_uxn_opcodes_h_l85_c7_fc05_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_5050] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l96_c7_05de] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l96_c7_05de_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_05de_cond;
     tmp16_MUX_uxn_opcodes_h_l96_c7_05de_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_05de_iftrue;
     tmp16_MUX_uxn_opcodes_h_l96_c7_05de_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_05de_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_05de_return_output := tmp16_MUX_uxn_opcodes_h_l96_c7_05de_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_3ed2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3725_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_5050_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_5050_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_fc05_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l85_c7_fc05_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_5050_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_05de_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_3ed2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l90_c7_5050] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_5050_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_5050_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_5050_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_5050_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_5050_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_5050_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_5050_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_5050_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_fc05] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_return_output;

     -- t8_MUX[uxn_opcodes_h_l71_c2_3ed2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l71_c2_3ed2_cond <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_3ed2_cond;
     t8_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue;
     t8_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output := t8_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_056d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_fc05] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l99_c22_6773_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_056d_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_fc05_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_fc05_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_5050_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_3ed2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output;

     -- MUX[uxn_opcodes_h_l99_c22_6773] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l99_c22_6773_cond <= VAR_MUX_uxn_opcodes_h_l99_c22_6773_cond;
     MUX_uxn_opcodes_h_l99_c22_6773_iftrue <= VAR_MUX_uxn_opcodes_h_l99_c22_6773_iftrue;
     MUX_uxn_opcodes_h_l99_c22_6773_iffalse <= VAR_MUX_uxn_opcodes_h_l99_c22_6773_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l99_c22_6773_return_output := MUX_uxn_opcodes_h_l99_c22_6773_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_3ed2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l85_c7_fc05] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_iftrue := VAR_MUX_uxn_opcodes_h_l99_c22_6773_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_fc05_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l96_c7_05de] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_cond;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_return_output := result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l71_c2_3ed2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_cond;
     tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output := tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_05de_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l90_c7_5050] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_cond;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_return_output := result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_5050_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l85_c7_fc05] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_cond;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_return_output := result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_fc05_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l71_c2_3ed2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output := result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc_uxn_opcodes_h_l103_l66_DUPLICATE_8de6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc_uxn_opcodes_h_l103_l66_DUPLICATE_8de6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_3ed2_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc_uxn_opcodes_h_l103_l66_DUPLICATE_8de6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc_uxn_opcodes_h_l103_l66_DUPLICATE_8de6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
