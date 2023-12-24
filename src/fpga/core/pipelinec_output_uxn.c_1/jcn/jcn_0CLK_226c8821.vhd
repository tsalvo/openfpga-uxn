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
-- Submodules: 39
entity jcn_0CLK_226c8821 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn_0CLK_226c8821;
architecture arch of jcn_0CLK_226c8821 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l675_c6_a9f7]
signal BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l675_c2_1cdb]
signal n8_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l675_c2_1cdb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l675_c2_1cdb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l675_c2_1cdb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l675_c2_1cdb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l675_c2_1cdb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l675_c2_1cdb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l675_c2_1cdb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l675_c2_1cdb]
signal result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l675_c2_1cdb]
signal result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l675_c2_1cdb]
signal t8_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l688_c11_82e1]
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l688_c7_e863]
signal n8_MUX_uxn_opcodes_h_l688_c7_e863_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l688_c7_e863_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l688_c7_e863_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l688_c7_e863_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l688_c7_e863]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l688_c7_e863]
signal result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l688_c7_e863]
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l688_c7_e863]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l688_c7_e863]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l688_c7_e863]
signal t8_MUX_uxn_opcodes_h_l688_c7_e863_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l688_c7_e863_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l688_c7_e863_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l688_c7_e863_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l691_c11_ef6e]
signal BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l691_c7_e166]
signal n8_MUX_uxn_opcodes_h_l691_c7_e166_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l691_c7_e166_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l691_c7_e166_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l691_c7_e166_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l691_c7_e166]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l691_c7_e166]
signal result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l691_c7_e166]
signal result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l691_c7_e166]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l691_c7_e166]
signal t8_MUX_uxn_opcodes_h_l691_c7_e166_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l691_c7_e166_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l691_c7_e166_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l691_c7_e166_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l694_c11_9df4]
signal BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l694_c7_0ac8]
signal n8_MUX_uxn_opcodes_h_l694_c7_0ac8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l694_c7_0ac8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l694_c7_0ac8]
signal result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l694_c7_0ac8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l694_c7_0ac8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l696_c30_5a05]
signal sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l698_c22_532b]
signal BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l698_c37_a45c]
signal BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l698_c22_4ec5]
signal MUX_uxn_opcodes_h_l698_c22_4ec5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l698_c22_4ec5_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l698_c22_4ec5_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l698_c22_4ec5_return_output : unsigned(15 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_de89( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7
BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_left,
BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_right,
BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_return_output);

-- n8_MUX_uxn_opcodes_h_l675_c2_1cdb
n8_MUX_uxn_opcodes_h_l675_c2_1cdb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l675_c2_1cdb_cond,
n8_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue,
n8_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse,
n8_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb
result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb
result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb
result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb
result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_cond,
result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb
result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output);

-- t8_MUX_uxn_opcodes_h_l675_c2_1cdb
t8_MUX_uxn_opcodes_h_l675_c2_1cdb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l675_c2_1cdb_cond,
t8_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue,
t8_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse,
t8_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1
BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_left,
BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_right,
BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_return_output);

-- n8_MUX_uxn_opcodes_h_l688_c7_e863
n8_MUX_uxn_opcodes_h_l688_c7_e863 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l688_c7_e863_cond,
n8_MUX_uxn_opcodes_h_l688_c7_e863_iftrue,
n8_MUX_uxn_opcodes_h_l688_c7_e863_iffalse,
n8_MUX_uxn_opcodes_h_l688_c7_e863_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863
result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_cond,
result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_return_output);

-- t8_MUX_uxn_opcodes_h_l688_c7_e863
t8_MUX_uxn_opcodes_h_l688_c7_e863 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l688_c7_e863_cond,
t8_MUX_uxn_opcodes_h_l688_c7_e863_iftrue,
t8_MUX_uxn_opcodes_h_l688_c7_e863_iffalse,
t8_MUX_uxn_opcodes_h_l688_c7_e863_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e
BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_left,
BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_right,
BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_return_output);

-- n8_MUX_uxn_opcodes_h_l691_c7_e166
n8_MUX_uxn_opcodes_h_l691_c7_e166 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l691_c7_e166_cond,
n8_MUX_uxn_opcodes_h_l691_c7_e166_iftrue,
n8_MUX_uxn_opcodes_h_l691_c7_e166_iffalse,
n8_MUX_uxn_opcodes_h_l691_c7_e166_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166
result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166
result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_cond,
result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166
result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166
result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_return_output);

-- t8_MUX_uxn_opcodes_h_l691_c7_e166
t8_MUX_uxn_opcodes_h_l691_c7_e166 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l691_c7_e166_cond,
t8_MUX_uxn_opcodes_h_l691_c7_e166_iftrue,
t8_MUX_uxn_opcodes_h_l691_c7_e166_iffalse,
t8_MUX_uxn_opcodes_h_l691_c7_e166_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4
BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_left,
BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_right,
BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_return_output);

-- n8_MUX_uxn_opcodes_h_l694_c7_0ac8
n8_MUX_uxn_opcodes_h_l694_c7_0ac8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l694_c7_0ac8_cond,
n8_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue,
n8_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse,
n8_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8
result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_cond,
result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8
result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output);

-- sp_relative_shift_uxn_opcodes_h_l696_c30_5a05
sp_relative_shift_uxn_opcodes_h_l696_c30_5a05 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_ins,
sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_x,
sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_y,
sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b
BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b_left,
BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b_right,
BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c
BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c_left,
BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c_right,
BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c_return_output);

-- MUX_uxn_opcodes_h_l698_c22_4ec5
MUX_uxn_opcodes_h_l698_c22_4ec5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l698_c22_4ec5_cond,
MUX_uxn_opcodes_h_l698_c22_4ec5_iftrue,
MUX_uxn_opcodes_h_l698_c22_4ec5_iffalse,
MUX_uxn_opcodes_h_l698_c22_4ec5_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_return_output,
 n8_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output,
 t8_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_return_output,
 n8_MUX_uxn_opcodes_h_l688_c7_e863_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_return_output,
 t8_MUX_uxn_opcodes_h_l688_c7_e863_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_return_output,
 n8_MUX_uxn_opcodes_h_l691_c7_e166_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_return_output,
 t8_MUX_uxn_opcodes_h_l691_c7_e166_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_return_output,
 n8_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output,
 sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c_return_output,
 MUX_uxn_opcodes_h_l698_c22_4ec5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l688_c7_e863_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l680_c3_4e71 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l685_c3_75ff : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l688_c7_e863_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c2_1cdb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l688_c7_e863_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l688_c7_e863_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l691_c7_e166_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l688_c7_e863_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l689_c3_a768 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l688_c7_e863_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l688_c7_e863_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l688_c7_e863_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l691_c7_e166_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l688_c7_e863_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l691_c7_e166_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l691_c7_e166_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l691_c7_e166_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l691_c7_e166_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l691_c7_e166_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l691_c7_e166_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c7_0ac8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l698_c22_4ec5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l698_c22_4ec5_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l698_c22_4ec5_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l698_c42_2a8e_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l698_c22_4ec5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l694_l688_l691_DUPLICATE_93cd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_ee82_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_94ad_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_0c8f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_de89_uxn_opcodes_h_l702_l671_DUPLICATE_4f4c_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l689_c3_a768 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l689_c3_a768;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l680_c3_4e71 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l680_c3_4e71;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l685_c3_75ff := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l685_c3_75ff;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l688_c7_e863_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l691_c7_e166_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l698_c22_4ec5_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l691_c7_e166_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l688_c7_e863_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l691_c7_e166_iffalse := t8;
     -- sp_relative_shift[uxn_opcodes_h_l696_c30_5a05] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_ins;
     sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_x <= VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_x;
     sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_y <= VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_return_output := sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l675_c2_1cdb] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l675_c2_1cdb_return_output := result.is_stack_index_flipped;

     -- CAST_TO_int8_t[uxn_opcodes_h_l698_c42_2a8e] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l698_c42_2a8e_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l675_c2_1cdb] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l675_c2_1cdb_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l675_c6_a9f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l691_c11_ef6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_94ad LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_94ad_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l694_c11_9df4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_left;
     BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_return_output := BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_ee82 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_ee82_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l694_l688_l691_DUPLICATE_93cd LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l694_l688_l691_DUPLICATE_93cd_return_output := result.u16_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_0c8f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_0c8f_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l688_c7_e863] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l688_c7_e863_return_output := result.stack_address_sp_offset;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l675_c2_1cdb] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l675_c2_1cdb_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l688_c11_82e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l698_c22_532b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b_left;
     BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b_return_output := BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l675_c2_1cdb] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l675_c2_1cdb_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l675_c2_1cdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l675_c2_1cdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_a9f7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l688_c7_e863_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l688_c7_e863_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_82e1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l691_c7_e166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l691_c7_e166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_ef6e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l694_c7_0ac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_9df4_return_output;
     VAR_MUX_uxn_opcodes_h_l698_c22_4ec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_532b_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l698_c42_2a8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_0c8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_0c8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_0c8f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l694_l688_l691_DUPLICATE_93cd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l694_l688_l691_DUPLICATE_93cd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l694_l688_l691_DUPLICATE_93cd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l694_l688_l691_DUPLICATE_93cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_94ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_94ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_94ad_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_ee82_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_ee82_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_ee82_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l675_c2_1cdb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l675_c2_1cdb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l675_c2_1cdb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l675_c2_1cdb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l688_c7_e863_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_5a05_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l694_c7_0ac8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output;

     -- n8_MUX[uxn_opcodes_h_l694_c7_0ac8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l694_c7_0ac8_cond <= VAR_n8_MUX_uxn_opcodes_h_l694_c7_0ac8_cond;
     n8_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue;
     n8_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output := n8_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l694_c7_0ac8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l694_c7_0ac8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l675_c2_1cdb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l675_c2_1cdb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output;

     -- t8_MUX[uxn_opcodes_h_l691_c7_e166] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l691_c7_e166_cond <= VAR_t8_MUX_uxn_opcodes_h_l691_c7_e166_cond;
     t8_MUX_uxn_opcodes_h_l691_c7_e166_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l691_c7_e166_iftrue;
     t8_MUX_uxn_opcodes_h_l691_c7_e166_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l691_c7_e166_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l691_c7_e166_return_output := t8_MUX_uxn_opcodes_h_l691_c7_e166_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l675_c2_1cdb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l688_c7_e863] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l675_c2_1cdb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l698_c37_a45c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l698_c22_4ec5_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_a45c_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l691_c7_e166_iffalse := VAR_n8_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_e863_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l688_c7_e863_iffalse := VAR_t8_MUX_uxn_opcodes_h_l691_c7_e166_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l691_c7_e166] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_return_output;

     -- t8_MUX[uxn_opcodes_h_l688_c7_e863] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l688_c7_e863_cond <= VAR_t8_MUX_uxn_opcodes_h_l688_c7_e863_cond;
     t8_MUX_uxn_opcodes_h_l688_c7_e863_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l688_c7_e863_iftrue;
     t8_MUX_uxn_opcodes_h_l688_c7_e863_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l688_c7_e863_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l688_c7_e863_return_output := t8_MUX_uxn_opcodes_h_l688_c7_e863_return_output;

     -- n8_MUX[uxn_opcodes_h_l691_c7_e166] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l691_c7_e166_cond <= VAR_n8_MUX_uxn_opcodes_h_l691_c7_e166_cond;
     n8_MUX_uxn_opcodes_h_l691_c7_e166_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l691_c7_e166_iftrue;
     n8_MUX_uxn_opcodes_h_l691_c7_e166_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l691_c7_e166_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l691_c7_e166_return_output := n8_MUX_uxn_opcodes_h_l691_c7_e166_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l675_c2_1cdb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l691_c7_e166] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l691_c7_e166] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_return_output;

     -- MUX[uxn_opcodes_h_l698_c22_4ec5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l698_c22_4ec5_cond <= VAR_MUX_uxn_opcodes_h_l698_c22_4ec5_cond;
     MUX_uxn_opcodes_h_l698_c22_4ec5_iftrue <= VAR_MUX_uxn_opcodes_h_l698_c22_4ec5_iftrue;
     MUX_uxn_opcodes_h_l698_c22_4ec5_iffalse <= VAR_MUX_uxn_opcodes_h_l698_c22_4ec5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l698_c22_4ec5_return_output := MUX_uxn_opcodes_h_l698_c22_4ec5_return_output;

     -- Submodule level 3
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue := VAR_MUX_uxn_opcodes_h_l698_c22_4ec5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l688_c7_e863_iffalse := VAR_n8_MUX_uxn_opcodes_h_l691_c7_e166_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_e166_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_e166_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_e166_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse := VAR_t8_MUX_uxn_opcodes_h_l688_c7_e863_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l688_c7_e863] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l694_c7_0ac8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output := result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l688_c7_e863] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l688_c7_e863] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_return_output;

     -- n8_MUX[uxn_opcodes_h_l688_c7_e863] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l688_c7_e863_cond <= VAR_n8_MUX_uxn_opcodes_h_l688_c7_e863_cond;
     n8_MUX_uxn_opcodes_h_l688_c7_e863_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l688_c7_e863_iftrue;
     n8_MUX_uxn_opcodes_h_l688_c7_e863_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l688_c7_e863_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l688_c7_e863_return_output := n8_MUX_uxn_opcodes_h_l688_c7_e863_return_output;

     -- t8_MUX[uxn_opcodes_h_l675_c2_1cdb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l675_c2_1cdb_cond <= VAR_t8_MUX_uxn_opcodes_h_l675_c2_1cdb_cond;
     t8_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue;
     t8_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output := t8_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l688_c7_e863_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_e863_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_e863_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_e863_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_0ac8_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l691_c7_e166] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_cond;
     result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_return_output := result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l675_c2_1cdb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l675_c2_1cdb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output;

     -- n8_MUX[uxn_opcodes_h_l675_c2_1cdb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l675_c2_1cdb_cond <= VAR_n8_MUX_uxn_opcodes_h_l675_c2_1cdb_cond;
     n8_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue;
     n8_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output := n8_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l675_c2_1cdb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_e166_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l688_c7_e863] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_cond;
     result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_return_output := result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_e863_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l675_c2_1cdb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output := result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_de89_uxn_opcodes_h_l702_l671_DUPLICATE_4f4c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_de89_uxn_opcodes_h_l702_l671_DUPLICATE_4f4c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_de89(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_1cdb_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_de89_uxn_opcodes_h_l702_l671_DUPLICATE_4f4c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_de89_uxn_opcodes_h_l702_l671_DUPLICATE_4f4c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
