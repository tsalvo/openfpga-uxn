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
-- BIN_OP_EQ[uxn_opcodes_h_l71_c6_07c8]
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l71_c2_894b]
signal t8_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_894b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_894b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_894b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_894b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_894b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l71_c2_894b]
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_894b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_894b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_894b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l71_c2_894b]
signal tmp16_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_61e8]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l85_c7_c4d6]
signal t8_MUX_uxn_opcodes_h_l85_c7_c4d6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_c4d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_c4d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l85_c7_c4d6]
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_c4d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_c4d6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_c4d6]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_9f47]
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_b80e]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l90_c7_ef11]
signal t8_MUX_uxn_opcodes_h_l90_c7_ef11_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_ef11_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_ef11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l90_c7_ef11]
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_ef11]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_ef11]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_ef11]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l93_c3_55e9]
signal CONST_SL_8_uxn_opcodes_h_l93_c3_55e9_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l93_c3_55e9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l96_c11_a289]
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_d3ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l96_c7_d3ba]
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_d3ba]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l96_c7_d3ba]
signal tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l97_c3_e7e7]
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c22_9a6e]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_a396]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_c865]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_1f6d]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l99_c22_7484]
signal MUX_uxn_opcodes_h_l99_c22_7484_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_7484_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_7484_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_7484_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_fe00( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8
BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_left,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_right,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_return_output);

-- t8_MUX_uxn_opcodes_h_l71_c2_894b
t8_MUX_uxn_opcodes_h_l71_c2_894b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l71_c2_894b_cond,
t8_MUX_uxn_opcodes_h_l71_c2_894b_iftrue,
t8_MUX_uxn_opcodes_h_l71_c2_894b_iffalse,
t8_MUX_uxn_opcodes_h_l71_c2_894b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b
result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_cond,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l71_c2_894b
tmp16_MUX_uxn_opcodes_h_l71_c2_894b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l71_c2_894b_cond,
tmp16_MUX_uxn_opcodes_h_l71_c2_894b_iftrue,
tmp16_MUX_uxn_opcodes_h_l71_c2_894b_iffalse,
tmp16_MUX_uxn_opcodes_h_l71_c2_894b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8
BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_return_output);

-- t8_MUX_uxn_opcodes_h_l85_c7_c4d6
t8_MUX_uxn_opcodes_h_l85_c7_c4d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l85_c7_c4d6_cond,
t8_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue,
t8_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse,
t8_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6
result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_cond,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6
tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47_left,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47_right,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e
BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_return_output);

-- t8_MUX_uxn_opcodes_h_l90_c7_ef11
t8_MUX_uxn_opcodes_h_l90_c7_ef11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l90_c7_ef11_cond,
t8_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue,
t8_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse,
t8_MUX_uxn_opcodes_h_l90_c7_ef11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11
result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_cond,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_ef11
tmp16_MUX_uxn_opcodes_h_l90_c7_ef11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_return_output);

-- CONST_SL_8_uxn_opcodes_h_l93_c3_55e9
CONST_SL_8_uxn_opcodes_h_l93_c3_55e9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l93_c3_55e9_x,
CONST_SL_8_uxn_opcodes_h_l93_c3_55e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289
BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_left,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_right,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba
result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_cond,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output);

-- tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba
tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_cond,
tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue,
tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse,
tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7
BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7_left,
BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7_right,
BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e
BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d_return_output);

-- MUX_uxn_opcodes_h_l99_c22_7484
MUX_uxn_opcodes_h_l99_c22_7484 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l99_c22_7484_cond,
MUX_uxn_opcodes_h_l99_c22_7484_iftrue,
MUX_uxn_opcodes_h_l99_c22_7484_iffalse,
MUX_uxn_opcodes_h_l99_c22_7484_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_return_output,
 t8_MUX_uxn_opcodes_h_l71_c2_894b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_return_output,
 tmp16_MUX_uxn_opcodes_h_l71_c2_894b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_return_output,
 t8_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_return_output,
 t8_MUX_uxn_opcodes_h_l90_c7_ef11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_return_output,
 CONST_SL_8_uxn_opcodes_h_l93_c3_55e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output,
 tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output,
 BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d_return_output,
 MUX_uxn_opcodes_h_l99_c22_7484_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_6dda : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_9a40 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_894b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_894b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_894b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_894b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_ef11_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_c4d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_5361 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_c4d6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l88_c3_8f29 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_f5fb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_ef11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_e9a3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_ef11_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_55e9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_55e9_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_7484_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_7484_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_7484_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_7484_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_fe77_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_48dc_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_7708_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_550a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fe00_uxn_opcodes_h_l103_l66_DUPLICATE_54eb_return_output : opcode_result_t;
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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_f5fb := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_f5fb;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_9a40 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_9a40;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_6dda := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_6dda;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_5361 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_5361;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_e9a3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_e9a3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_894b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_894b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse := tmp16;
     -- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_9f47] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47_left;
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47_return_output := BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l71_c2_894b] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_894b_return_output := result.is_vram_write;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l90_c7_ef11] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_ef11_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l96_c11_a289] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_left;
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_return_output := BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_61e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l71_c2_894b] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_894b_return_output := result.is_ram_write;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l71_c2_894b] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_894b_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l71_c2_894b] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_894b_return_output := result.is_stack_index_flipped;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l85_c7_c4d6] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_c4d6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_a396] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_550a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_550a_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_48dc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_48dc_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_fe77 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_fe77_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_7708 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_7708_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_b80e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c22_9a6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l71_c6_07c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_894b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_894b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_07c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_c4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_61e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_ef11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_b80e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a289_return_output;
     VAR_MUX_uxn_opcodes_h_l99_c22_7484_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_9a6e_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l88_c3_8f29 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_9f47_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l99_c22_7484_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_a396_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_7708_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_55e9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_7708_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_550a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_550a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_fe77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_fe77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_fe77_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_48dc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_48dc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_48dc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_894b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_894b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_894b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_894b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_ef11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_c4d6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue := VAR_result_u16_value_uxn_opcodes_h_l88_c3_8f29;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_c4d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_894b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_d3ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_d3ba] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l93_c3_55e9] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l93_c3_55e9_x <= VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_55e9_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_55e9_return_output := CONST_SL_8_uxn_opcodes_h_l93_c3_55e9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_894b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_894b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_ef11] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_return_output;

     -- t8_MUX[uxn_opcodes_h_l90_c7_ef11] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l90_c7_ef11_cond <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_ef11_cond;
     t8_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue;
     t8_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_ef11_return_output := t8_MUX_uxn_opcodes_h_l90_c7_ef11_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l97_c3_e7e7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7_left;
     BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7_return_output := BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_894b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865_right := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_e7e7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_55e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_ef11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l90_c7_ef11_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l96_c7_d3ba] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_cond;
     tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue;
     tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output := tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_ef11] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_c865] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_894b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_ef11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_c4d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output;

     -- t8_MUX[uxn_opcodes_h_l85_c7_c4d6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l85_c7_c4d6_cond <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_c4d6_cond;
     t8_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue;
     t8_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output := t8_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_c865_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_ef11_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_ef11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_894b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_894b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_c4d6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_1f6d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_c4d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output;

     -- t8_MUX[uxn_opcodes_h_l71_c2_894b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l71_c2_894b_cond <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_894b_cond;
     t8_MUX_uxn_opcodes_h_l71_c2_894b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_894b_iftrue;
     t8_MUX_uxn_opcodes_h_l71_c2_894b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_894b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_894b_return_output := t8_MUX_uxn_opcodes_h_l71_c2_894b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l90_c7_ef11] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l99_c22_7484_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_1f6d_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l71_c2_894b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_ef11_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_894b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l85_c7_c4d6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output;

     -- MUX[uxn_opcodes_h_l99_c22_7484] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l99_c22_7484_cond <= VAR_MUX_uxn_opcodes_h_l99_c22_7484_cond;
     MUX_uxn_opcodes_h_l99_c22_7484_iftrue <= VAR_MUX_uxn_opcodes_h_l99_c22_7484_iftrue;
     MUX_uxn_opcodes_h_l99_c22_7484_iffalse <= VAR_MUX_uxn_opcodes_h_l99_c22_7484_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l99_c22_7484_return_output := MUX_uxn_opcodes_h_l99_c22_7484_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_894b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue := VAR_MUX_uxn_opcodes_h_l99_c22_7484_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_894b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l71_c2_894b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l71_c2_894b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_894b_cond;
     tmp16_MUX_uxn_opcodes_h_l71_c2_894b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_894b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l71_c2_894b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_894b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_894b_return_output := tmp16_MUX_uxn_opcodes_h_l71_c2_894b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l96_c7_d3ba] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_cond;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output := result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_d3ba_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_894b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l90_c7_ef11] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_cond;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_return_output := result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_ef11_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l85_c7_c4d6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output := result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c4d6_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l71_c2_894b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_return_output := result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fe00_uxn_opcodes_h_l103_l66_DUPLICATE_54eb LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fe00_uxn_opcodes_h_l103_l66_DUPLICATE_54eb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fe00(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_894b_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_894b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_894b_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_894b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_894b_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_894b_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_894b_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fe00_uxn_opcodes_h_l103_l66_DUPLICATE_54eb_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fe00_uxn_opcodes_h_l103_l66_DUPLICATE_54eb_return_output;
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
