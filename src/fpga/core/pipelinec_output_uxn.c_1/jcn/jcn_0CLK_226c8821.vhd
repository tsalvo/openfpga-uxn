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
-- BIN_OP_EQ[uxn_opcodes_h_l675_c6_eb1d]
signal BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l675_c2_10a6]
signal t8_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l675_c2_10a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l675_c2_10a6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l675_c2_10a6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l675_c2_10a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l675_c2_10a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l675_c2_10a6]
signal result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l675_c2_10a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l675_c2_10a6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l675_c2_10a6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l675_c2_10a6]
signal n8_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l688_c11_2d1c]
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l688_c7_1ab1]
signal t8_MUX_uxn_opcodes_h_l688_c7_1ab1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l688_c7_1ab1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l688_c7_1ab1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l688_c7_1ab1]
signal result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l688_c7_1ab1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l688_c7_1ab1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l688_c7_1ab1]
signal n8_MUX_uxn_opcodes_h_l688_c7_1ab1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l691_c11_e26c]
signal BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l691_c7_99ba]
signal t8_MUX_uxn_opcodes_h_l691_c7_99ba_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l691_c7_99ba_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l691_c7_99ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l691_c7_99ba]
signal result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l691_c7_99ba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l691_c7_99ba]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l691_c7_99ba]
signal n8_MUX_uxn_opcodes_h_l691_c7_99ba_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l691_c7_99ba_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l694_c11_58aa]
signal BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l694_c7_92eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l694_c7_92eb]
signal result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l694_c7_92eb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l694_c7_92eb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l694_c7_92eb]
signal n8_MUX_uxn_opcodes_h_l694_c7_92eb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c7_92eb_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l696_c30_91cb]
signal sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l698_c22_dbeb]
signal BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l698_c37_f70a]
signal BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l698_c22_6411]
signal MUX_uxn_opcodes_h_l698_c22_6411_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l698_c22_6411_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l698_c22_6411_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l698_c22_6411_return_output : unsigned(15 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d
BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_left,
BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_right,
BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_return_output);

-- t8_MUX_uxn_opcodes_h_l675_c2_10a6
t8_MUX_uxn_opcodes_h_l675_c2_10a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l675_c2_10a6_cond,
t8_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue,
t8_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse,
t8_MUX_uxn_opcodes_h_l675_c2_10a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6
result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6
result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6
result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6
result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6
result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_cond,
result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_return_output);

-- n8_MUX_uxn_opcodes_h_l675_c2_10a6
n8_MUX_uxn_opcodes_h_l675_c2_10a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l675_c2_10a6_cond,
n8_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue,
n8_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse,
n8_MUX_uxn_opcodes_h_l675_c2_10a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c
BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_left,
BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_right,
BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_return_output);

-- t8_MUX_uxn_opcodes_h_l688_c7_1ab1
t8_MUX_uxn_opcodes_h_l688_c7_1ab1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l688_c7_1ab1_cond,
t8_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue,
t8_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse,
t8_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1
result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_cond,
result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output);

-- n8_MUX_uxn_opcodes_h_l688_c7_1ab1
n8_MUX_uxn_opcodes_h_l688_c7_1ab1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l688_c7_1ab1_cond,
n8_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue,
n8_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse,
n8_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c
BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_left,
BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_right,
BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_return_output);

-- t8_MUX_uxn_opcodes_h_l691_c7_99ba
t8_MUX_uxn_opcodes_h_l691_c7_99ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l691_c7_99ba_cond,
t8_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue,
t8_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse,
t8_MUX_uxn_opcodes_h_l691_c7_99ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba
result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba
result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_cond,
result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba
result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba
result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_return_output);

-- n8_MUX_uxn_opcodes_h_l691_c7_99ba
n8_MUX_uxn_opcodes_h_l691_c7_99ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l691_c7_99ba_cond,
n8_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue,
n8_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse,
n8_MUX_uxn_opcodes_h_l691_c7_99ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa
BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_left,
BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_right,
BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb
result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb
result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_cond,
result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_return_output);

-- n8_MUX_uxn_opcodes_h_l694_c7_92eb
n8_MUX_uxn_opcodes_h_l694_c7_92eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l694_c7_92eb_cond,
n8_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue,
n8_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse,
n8_MUX_uxn_opcodes_h_l694_c7_92eb_return_output);

-- sp_relative_shift_uxn_opcodes_h_l696_c30_91cb
sp_relative_shift_uxn_opcodes_h_l696_c30_91cb : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_ins,
sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_x,
sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_y,
sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb
BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb_left,
BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb_right,
BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a
BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a_left,
BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a_right,
BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a_return_output);

-- MUX_uxn_opcodes_h_l698_c22_6411
MUX_uxn_opcodes_h_l698_c22_6411 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l698_c22_6411_cond,
MUX_uxn_opcodes_h_l698_c22_6411_iftrue,
MUX_uxn_opcodes_h_l698_c22_6411_iffalse,
MUX_uxn_opcodes_h_l698_c22_6411_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_return_output,
 t8_MUX_uxn_opcodes_h_l675_c2_10a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_return_output,
 n8_MUX_uxn_opcodes_h_l675_c2_10a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_return_output,
 t8_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output,
 n8_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_return_output,
 t8_MUX_uxn_opcodes_h_l691_c7_99ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_return_output,
 n8_MUX_uxn_opcodes_h_l691_c7_99ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_return_output,
 n8_MUX_uxn_opcodes_h_l694_c7_92eb_return_output,
 sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a_return_output,
 MUX_uxn_opcodes_h_l698_c22_6411_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l685_c3_be5b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l680_c3_5e8f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c2_10a6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c2_10a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l691_c7_99ba_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l688_c7_1ab1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l689_c3_6c96 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l688_c7_1ab1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l691_c7_99ba_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l688_c7_1ab1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l691_c7_99ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c7_92eb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l691_c7_99ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c7_92eb_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l698_c22_6411_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l698_c22_6411_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l698_c22_6411_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l698_c42_df00_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l698_c22_6411_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l691_l688_l694_DUPLICATE_97c7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l694_l691_l688_DUPLICATE_e3b9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l694_l691_l688_DUPLICATE_ee37_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l694_l691_l688_DUPLICATE_2e69_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fe00_uxn_opcodes_h_l671_l702_DUPLICATE_cc97_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l689_c3_6c96 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l689_c3_6c96;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l680_c3_5e8f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l680_c3_5e8f;
     VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l685_c3_be5b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l685_c3_be5b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l698_c22_6411_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l688_c11_2d1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l694_c11_58aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l675_c2_10a6] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l675_c2_10a6_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l675_c6_eb1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l698_c22_dbeb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb_left;
     BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb_return_output := BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l694_l691_l688_DUPLICATE_2e69 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l694_l691_l688_DUPLICATE_2e69_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l691_c11_e26c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_left;
     BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_return_output := BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l696_c30_91cb] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_ins;
     sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_x <= VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_x;
     sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_y <= VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_return_output := sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l675_c2_10a6] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l675_c2_10a6_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l694_l691_l688_DUPLICATE_e3b9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l694_l691_l688_DUPLICATE_e3b9_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l688_c7_1ab1] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l688_c7_1ab1_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l675_c2_10a6] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l675_c2_10a6_return_output := result.is_vram_write;

     -- CAST_TO_int8_t[uxn_opcodes_h_l698_c42_df00] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l698_c42_df00_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l691_l688_l694_DUPLICATE_97c7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l691_l688_l694_DUPLICATE_97c7_return_output := result.u16_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l694_l691_l688_DUPLICATE_ee37 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l694_l691_l688_DUPLICATE_ee37_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l675_c2_10a6] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l675_c2_10a6_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l675_c2_10a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l675_c2_10a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_eb1d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l688_c7_1ab1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l688_c7_1ab1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_2d1c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l691_c7_99ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l691_c7_99ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_e26c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l694_c7_92eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_58aa_return_output;
     VAR_MUX_uxn_opcodes_h_l698_c22_6411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_dbeb_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l698_c42_df00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l694_l691_l688_DUPLICATE_ee37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l694_l691_l688_DUPLICATE_ee37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l694_l691_l688_DUPLICATE_ee37_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l691_l688_l694_DUPLICATE_97c7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l691_l688_l694_DUPLICATE_97c7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l691_l688_l694_DUPLICATE_97c7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l691_l688_l694_DUPLICATE_97c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l694_l691_l688_DUPLICATE_e3b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l694_l691_l688_DUPLICATE_e3b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l694_l691_l688_DUPLICATE_e3b9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l694_l691_l688_DUPLICATE_2e69_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l694_l691_l688_DUPLICATE_2e69_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l694_l691_l688_DUPLICATE_2e69_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l675_c2_10a6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l675_c2_10a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l675_c2_10a6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l675_c2_10a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l688_c7_1ab1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_91cb_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l675_c2_10a6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l698_c37_f70a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l688_c7_1ab1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l675_c2_10a6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l675_c2_10a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l694_c7_92eb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_return_output;

     -- n8_MUX[uxn_opcodes_h_l694_c7_92eb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l694_c7_92eb_cond <= VAR_n8_MUX_uxn_opcodes_h_l694_c7_92eb_cond;
     n8_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue;
     n8_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l694_c7_92eb_return_output := n8_MUX_uxn_opcodes_h_l694_c7_92eb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l694_c7_92eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l675_c2_10a6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output;

     -- t8_MUX[uxn_opcodes_h_l691_c7_99ba] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l691_c7_99ba_cond <= VAR_t8_MUX_uxn_opcodes_h_l691_c7_99ba_cond;
     t8_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue;
     t8_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l691_c7_99ba_return_output := t8_MUX_uxn_opcodes_h_l691_c7_99ba_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l694_c7_92eb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l698_c22_6411_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_f70a_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse := VAR_n8_MUX_uxn_opcodes_h_l694_c7_92eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_92eb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_92eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_92eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l691_c7_99ba_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l691_c7_99ba] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_return_output;

     -- n8_MUX[uxn_opcodes_h_l691_c7_99ba] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l691_c7_99ba_cond <= VAR_n8_MUX_uxn_opcodes_h_l691_c7_99ba_cond;
     n8_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue;
     n8_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l691_c7_99ba_return_output := n8_MUX_uxn_opcodes_h_l691_c7_99ba_return_output;

     -- t8_MUX[uxn_opcodes_h_l688_c7_1ab1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l688_c7_1ab1_cond <= VAR_t8_MUX_uxn_opcodes_h_l688_c7_1ab1_cond;
     t8_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue;
     t8_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output := t8_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output;

     -- MUX[uxn_opcodes_h_l698_c22_6411] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l698_c22_6411_cond <= VAR_MUX_uxn_opcodes_h_l698_c22_6411_cond;
     MUX_uxn_opcodes_h_l698_c22_6411_iftrue <= VAR_MUX_uxn_opcodes_h_l698_c22_6411_iftrue;
     MUX_uxn_opcodes_h_l698_c22_6411_iffalse <= VAR_MUX_uxn_opcodes_h_l698_c22_6411_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l698_c22_6411_return_output := MUX_uxn_opcodes_h_l698_c22_6411_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l691_c7_99ba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l675_c2_10a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l691_c7_99ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_return_output;

     -- Submodule level 3
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue := VAR_MUX_uxn_opcodes_h_l698_c22_6411_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l691_c7_99ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_99ba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_99ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_99ba_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output;
     -- t8_MUX[uxn_opcodes_h_l675_c2_10a6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l675_c2_10a6_cond <= VAR_t8_MUX_uxn_opcodes_h_l675_c2_10a6_cond;
     t8_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue;
     t8_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l675_c2_10a6_return_output := t8_MUX_uxn_opcodes_h_l675_c2_10a6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l694_c7_92eb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_return_output := result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l688_c7_1ab1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l688_c7_1ab1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output;

     -- n8_MUX[uxn_opcodes_h_l688_c7_1ab1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l688_c7_1ab1_cond <= VAR_n8_MUX_uxn_opcodes_h_l688_c7_1ab1_cond;
     n8_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue;
     n8_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output := n8_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l688_c7_1ab1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_92eb_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l675_c2_10a6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l675_c2_10a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_return_output;

     -- n8_MUX[uxn_opcodes_h_l675_c2_10a6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l675_c2_10a6_cond <= VAR_n8_MUX_uxn_opcodes_h_l675_c2_10a6_cond;
     n8_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue;
     n8_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l675_c2_10a6_return_output := n8_MUX_uxn_opcodes_h_l675_c2_10a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l675_c2_10a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l675_c2_10a6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l691_c7_99ba] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_cond;
     result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_return_output := result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l675_c2_10a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_99ba_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l688_c7_1ab1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output := result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_1ab1_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l675_c2_10a6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_return_output := result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fe00_uxn_opcodes_h_l671_l702_DUPLICATE_cc97 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fe00_uxn_opcodes_h_l671_l702_DUPLICATE_cc97_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fe00(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_10a6_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_10a6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_10a6_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_10a6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_10a6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_10a6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_10a6_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fe00_uxn_opcodes_h_l671_l702_DUPLICATE_cc97_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fe00_uxn_opcodes_h_l671_l702_DUPLICATE_cc97_return_output;
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
