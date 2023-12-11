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
-- BIN_OP_EQ[uxn_opcodes_h_l71_c6_f81a]
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l71_c2_14bd]
signal t8_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l71_c2_14bd]
signal tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_14bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_14bd]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l71_c2_14bd]
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_14bd]
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_14bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_14bd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_14bd]
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_14bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_14bd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_6e77]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l85_c7_4ce4]
signal t8_MUX_uxn_opcodes_h_l85_c7_4ce4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_4ce4]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_4ce4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l85_c7_4ce4]
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_4ce4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_4ce4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_4ce4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_0973]
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_dd3d]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l90_c7_da45]
signal t8_MUX_uxn_opcodes_h_l90_c7_da45_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_da45_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_da45_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_da45_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_da45]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_da45_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_da45_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_da45_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_da45_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_da45]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_da45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_da45]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l90_c7_da45]
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l93_c3_c47d]
signal CONST_SL_8_uxn_opcodes_h_l93_c3_c47d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l93_c3_c47d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l96_c11_4ccf]
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l96_c7_cb58]
signal tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_cb58]
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_cb58]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l96_c7_cb58]
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l97_c3_1d85]
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c22_f325]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_96e2]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_a8e7]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_4964]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l99_c22_5f57]
signal MUX_uxn_opcodes_h_l99_c22_5f57_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_5f57_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_5f57_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_5f57_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_763b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a
BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_left,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_right,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_return_output);

-- t8_MUX_uxn_opcodes_h_l71_c2_14bd
t8_MUX_uxn_opcodes_h_l71_c2_14bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l71_c2_14bd_cond,
t8_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue,
t8_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse,
t8_MUX_uxn_opcodes_h_l71_c2_14bd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l71_c2_14bd
tmp16_MUX_uxn_opcodes_h_l71_c2_14bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_cond,
tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue,
tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse,
tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd
result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_cond,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77
BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_return_output);

-- t8_MUX_uxn_opcodes_h_l85_c7_4ce4
t8_MUX_uxn_opcodes_h_l85_c7_4ce4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l85_c7_4ce4_cond,
t8_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue,
t8_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse,
t8_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4
tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4
result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_cond,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973_left,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973_right,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d
BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_return_output);

-- t8_MUX_uxn_opcodes_h_l90_c7_da45
t8_MUX_uxn_opcodes_h_l90_c7_da45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l90_c7_da45_cond,
t8_MUX_uxn_opcodes_h_l90_c7_da45_iftrue,
t8_MUX_uxn_opcodes_h_l90_c7_da45_iffalse,
t8_MUX_uxn_opcodes_h_l90_c7_da45_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_da45
tmp16_MUX_uxn_opcodes_h_l90_c7_da45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_da45_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_da45_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_da45_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_da45_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45
result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_cond,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_return_output);

-- CONST_SL_8_uxn_opcodes_h_l93_c3_c47d
CONST_SL_8_uxn_opcodes_h_l93_c3_c47d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l93_c3_c47d_x,
CONST_SL_8_uxn_opcodes_h_l93_c3_c47d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf
BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_left,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_right,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l96_c7_cb58
tmp16_MUX_uxn_opcodes_h_l96_c7_cb58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_cond,
tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue,
tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse,
tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58
result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_cond,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85
BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85_left,
BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85_right,
BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325
BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964_return_output);

-- MUX_uxn_opcodes_h_l99_c22_5f57
MUX_uxn_opcodes_h_l99_c22_5f57 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l99_c22_5f57_cond,
MUX_uxn_opcodes_h_l99_c22_5f57_iftrue,
MUX_uxn_opcodes_h_l99_c22_5f57_iffalse,
MUX_uxn_opcodes_h_l99_c22_5f57_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_return_output,
 t8_MUX_uxn_opcodes_h_l71_c2_14bd_return_output,
 tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_return_output,
 t8_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_return_output,
 t8_MUX_uxn_opcodes_h_l90_c7_da45_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_da45_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_return_output,
 CONST_SL_8_uxn_opcodes_h_l93_c3_c47d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_return_output,
 tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_return_output,
 BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964_return_output,
 MUX_uxn_opcodes_h_l99_c22_5f57_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_bd8d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_ac4e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_da45_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_da45_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l88_c3_ef22 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_4096 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_01f4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_4ce4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_da45_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_da45_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_da45_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_da45_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_da45_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_da45_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_5029 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_da45_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_c47d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_c47d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_5f57_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_5f57_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_5f57_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_5f57_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_6f4a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_d785_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_20d8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_61fa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_763b_uxn_opcodes_h_l103_l66_DUPLICATE_1e89_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_bd8d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_bd8d;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_5029 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_5029;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_01f4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_01f4;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_4096 := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_4096;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_ac4e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_ac4e;

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_da45_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_da45_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l96_c11_4ccf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_left;
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_return_output := BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_0973] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973_left;
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973_return_output := BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_d785 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_d785_return_output := result.is_pc_updated;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l71_c2_14bd] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_14bd_return_output := result.is_ram_write;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l71_c2_14bd] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_14bd_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c22_f325] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l71_c2_14bd] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_14bd_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_20d8 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_20d8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_96e2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_dd3d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_6e77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l71_c6_f81a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_left;
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_return_output := BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_6f4a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_6f4a_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_61fa LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_61fa_return_output := result.u16_value;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l90_c7_da45] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_da45_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l71_c2_14bd] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_14bd_return_output := result.is_stack_index_flipped;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l85_c7_4ce4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_4ce4_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_14bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_f81a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_6e77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_da45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_da45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dd3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_4ccf_return_output;
     VAR_MUX_uxn_opcodes_h_l99_c22_5f57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_f325_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l88_c3_ef22 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_0973_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l99_c22_5f57_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_96e2_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_20d8_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_c47d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_20d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_61fa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_61fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_6f4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_6f4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_6f4a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_d785_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_d785_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_d785_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_14bd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_14bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_14bd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_14bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_da45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_4ce4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue := VAR_result_u16_value_uxn_opcodes_h_l88_c3_ef22;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_14bd] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_14bd] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output;

     -- t8_MUX[uxn_opcodes_h_l90_c7_da45] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l90_c7_da45_cond <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_da45_cond;
     t8_MUX_uxn_opcodes_h_l90_c7_da45_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_da45_iftrue;
     t8_MUX_uxn_opcodes_h_l90_c7_da45_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_da45_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_da45_return_output := t8_MUX_uxn_opcodes_h_l90_c7_da45_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l93_c3_c47d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l93_c3_c47d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_c47d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_c47d_return_output := CONST_SL_8_uxn_opcodes_h_l93_c3_c47d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l97_c3_1d85] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85_left;
     BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85_return_output := BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_cb58] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_14bd] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_da45] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_4ce4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_14bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_cb58] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7_right := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_1d85_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_da45_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_c47d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cb58_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cb58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_da45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l90_c7_da45_return_output;
     -- t8_MUX[uxn_opcodes_h_l85_c7_4ce4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l85_c7_4ce4_cond <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce4_cond;
     t8_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue;
     t8_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output := t8_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l96_c7_cb58] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_cond;
     tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue;
     tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_return_output := tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_a8e7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_14bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_da45] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_da45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_4ce4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a8e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_da45_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_da45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse := VAR_t8_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_da45_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cb58_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_4964] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_4ce4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output;

     -- t8_MUX[uxn_opcodes_h_l71_c2_14bd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l71_c2_14bd_cond <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_14bd_cond;
     t8_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue;
     t8_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_14bd_return_output := t8_MUX_uxn_opcodes_h_l71_c2_14bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_14bd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_4ce4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l90_c7_da45] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_da45_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_da45_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_da45_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_da45_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_da45_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_da45_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_da45_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_da45_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l99_c22_5f57_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_4964_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l71_c2_14bd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_da45_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_14bd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_return_output;

     -- MUX[uxn_opcodes_h_l99_c22_5f57] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l99_c22_5f57_cond <= VAR_MUX_uxn_opcodes_h_l99_c22_5f57_cond;
     MUX_uxn_opcodes_h_l99_c22_5f57_iftrue <= VAR_MUX_uxn_opcodes_h_l99_c22_5f57_iftrue;
     MUX_uxn_opcodes_h_l99_c22_5f57_iffalse <= VAR_MUX_uxn_opcodes_h_l99_c22_5f57_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l99_c22_5f57_return_output := MUX_uxn_opcodes_h_l99_c22_5f57_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_14bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l85_c7_4ce4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue := VAR_MUX_uxn_opcodes_h_l99_c22_5f57_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l71_c2_14bd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_cond;
     tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_return_output := tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l96_c7_cb58] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_cond;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_return_output := result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cb58_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_14bd_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l90_c7_da45] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_cond;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_return_output := result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_da45_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l85_c7_4ce4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output := result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_4ce4_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l71_c2_14bd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_return_output := result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_763b_uxn_opcodes_h_l103_l66_DUPLICATE_1e89 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_763b_uxn_opcodes_h_l103_l66_DUPLICATE_1e89_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_763b(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_14bd_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_14bd_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_14bd_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_14bd_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_14bd_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_14bd_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_14bd_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_763b_uxn_opcodes_h_l103_l66_DUPLICATE_1e89_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_763b_uxn_opcodes_h_l103_l66_DUPLICATE_1e89_return_output;
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
