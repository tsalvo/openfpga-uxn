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
-- BIN_OP_EQ[uxn_opcodes_h_l675_c6_b31b]
signal BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l675_c2_f155]
signal t8_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l675_c2_f155]
signal n8_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l675_c2_f155]
signal result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l675_c2_f155]
signal result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l675_c2_f155]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l675_c2_f155]
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l675_c2_f155]
signal result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l675_c2_f155]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l675_c2_f155]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l675_c2_f155]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l675_c2_f155]
signal result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l688_c11_0e86]
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l688_c7_0b75]
signal t8_MUX_uxn_opcodes_h_l688_c7_0b75_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l688_c7_0b75_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l688_c7_0b75]
signal n8_MUX_uxn_opcodes_h_l688_c7_0b75_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l688_c7_0b75_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l688_c7_0b75]
signal result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l688_c7_0b75]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l688_c7_0b75]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l688_c7_0b75]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l688_c7_0b75]
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l691_c11_22f6]
signal BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l691_c7_ad4f]
signal t8_MUX_uxn_opcodes_h_l691_c7_ad4f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l691_c7_ad4f]
signal n8_MUX_uxn_opcodes_h_l691_c7_ad4f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l691_c7_ad4f]
signal result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l691_c7_ad4f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l691_c7_ad4f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l691_c7_ad4f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l694_c11_065f]
signal BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l694_c7_70f9]
signal n8_MUX_uxn_opcodes_h_l694_c7_70f9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c7_70f9_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l694_c7_70f9]
signal result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l694_c7_70f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l694_c7_70f9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l694_c7_70f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l696_c30_308b]
signal sp_relative_shift_uxn_opcodes_h_l696_c30_308b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l696_c30_308b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l696_c30_308b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l696_c30_308b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l698_c22_5fe5]
signal BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l698_c37_ba54]
signal BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l698_c22_8340]
signal MUX_uxn_opcodes_h_l698_c22_8340_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l698_c22_8340_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l698_c22_8340_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l698_c22_8340_return_output : unsigned(15 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_cbec( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b
BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_left,
BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_right,
BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_return_output);

-- t8_MUX_uxn_opcodes_h_l675_c2_f155
t8_MUX_uxn_opcodes_h_l675_c2_f155 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l675_c2_f155_cond,
t8_MUX_uxn_opcodes_h_l675_c2_f155_iftrue,
t8_MUX_uxn_opcodes_h_l675_c2_f155_iffalse,
t8_MUX_uxn_opcodes_h_l675_c2_f155_return_output);

-- n8_MUX_uxn_opcodes_h_l675_c2_f155
n8_MUX_uxn_opcodes_h_l675_c2_f155 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l675_c2_f155_cond,
n8_MUX_uxn_opcodes_h_l675_c2_f155_iftrue,
n8_MUX_uxn_opcodes_h_l675_c2_f155_iffalse,
n8_MUX_uxn_opcodes_h_l675_c2_f155_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155
result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155
result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155
result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155
result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_cond,
result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155
result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86
BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_left,
BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_right,
BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_return_output);

-- t8_MUX_uxn_opcodes_h_l688_c7_0b75
t8_MUX_uxn_opcodes_h_l688_c7_0b75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l688_c7_0b75_cond,
t8_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue,
t8_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse,
t8_MUX_uxn_opcodes_h_l688_c7_0b75_return_output);

-- n8_MUX_uxn_opcodes_h_l688_c7_0b75
n8_MUX_uxn_opcodes_h_l688_c7_0b75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l688_c7_0b75_cond,
n8_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue,
n8_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse,
n8_MUX_uxn_opcodes_h_l688_c7_0b75_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75
result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_cond,
result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6
BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_left,
BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_right,
BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_return_output);

-- t8_MUX_uxn_opcodes_h_l691_c7_ad4f
t8_MUX_uxn_opcodes_h_l691_c7_ad4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l691_c7_ad4f_cond,
t8_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue,
t8_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse,
t8_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output);

-- n8_MUX_uxn_opcodes_h_l691_c7_ad4f
n8_MUX_uxn_opcodes_h_l691_c7_ad4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l691_c7_ad4f_cond,
n8_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue,
n8_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse,
n8_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f
result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_cond,
result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f
result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f
result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f
result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f
BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_left,
BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_right,
BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_return_output);

-- n8_MUX_uxn_opcodes_h_l694_c7_70f9
n8_MUX_uxn_opcodes_h_l694_c7_70f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l694_c7_70f9_cond,
n8_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue,
n8_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse,
n8_MUX_uxn_opcodes_h_l694_c7_70f9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9
result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_cond,
result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9
result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_return_output);

-- sp_relative_shift_uxn_opcodes_h_l696_c30_308b
sp_relative_shift_uxn_opcodes_h_l696_c30_308b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l696_c30_308b_ins,
sp_relative_shift_uxn_opcodes_h_l696_c30_308b_x,
sp_relative_shift_uxn_opcodes_h_l696_c30_308b_y,
sp_relative_shift_uxn_opcodes_h_l696_c30_308b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5
BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5_left,
BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5_right,
BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54
BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54_left,
BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54_right,
BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54_return_output);

-- MUX_uxn_opcodes_h_l698_c22_8340
MUX_uxn_opcodes_h_l698_c22_8340 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l698_c22_8340_cond,
MUX_uxn_opcodes_h_l698_c22_8340_iftrue,
MUX_uxn_opcodes_h_l698_c22_8340_iffalse,
MUX_uxn_opcodes_h_l698_c22_8340_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_return_output,
 t8_MUX_uxn_opcodes_h_l675_c2_f155_return_output,
 n8_MUX_uxn_opcodes_h_l675_c2_f155_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_return_output,
 t8_MUX_uxn_opcodes_h_l688_c7_0b75_return_output,
 n8_MUX_uxn_opcodes_h_l688_c7_0b75_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_return_output,
 t8_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output,
 n8_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_return_output,
 n8_MUX_uxn_opcodes_h_l694_c7_70f9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_return_output,
 sp_relative_shift_uxn_opcodes_h_l696_c30_308b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54_return_output,
 MUX_uxn_opcodes_h_l698_c22_8340_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l688_c7_0b75_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l688_c7_0b75_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l680_c3_cd62 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l685_c3_5aa7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l688_c7_0b75_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l688_c7_0b75_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l689_c3_c493 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l688_c7_0b75_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l691_c7_ad4f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c7_70f9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l691_c7_ad4f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c7_70f9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_308b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_308b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_308b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_308b_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l698_c22_8340_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l698_c22_8340_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l698_c22_8340_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l698_c42_f810_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l698_c22_8340_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l694_l688_l691_DUPLICATE_4f73_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_8709_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_9579_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_682a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbec_uxn_opcodes_h_l702_l671_DUPLICATE_782a_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_308b_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l680_c3_cd62 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l680_c3_cd62;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l689_c3_c493 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l689_c3_c493;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l685_c3_5aa7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l685_c3_5aa7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_right := to_unsigned(3, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_308b_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_308b_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l675_c2_f155_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l698_c22_8340_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l675_c2_f155_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse := t8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_8709 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_8709_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l688_c11_0e86] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_left;
     BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_return_output := BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l691_c11_22f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l675_c2_f155] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l675_c2_f155_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l675_c2_f155] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l675_c2_f155_return_output := result.is_ram_write;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l675_c2_f155] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l675_c2_f155_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l696_c30_308b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l696_c30_308b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_308b_ins;
     sp_relative_shift_uxn_opcodes_h_l696_c30_308b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_308b_x;
     sp_relative_shift_uxn_opcodes_h_l696_c30_308b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_308b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_308b_return_output := sp_relative_shift_uxn_opcodes_h_l696_c30_308b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l694_c11_065f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_left;
     BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_return_output := BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l694_l688_l691_DUPLICATE_4f73 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l694_l688_l691_DUPLICATE_4f73_return_output := result.u16_value;

     -- CAST_TO_int8_t[uxn_opcodes_h_l698_c42_f810] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l698_c42_f810_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l675_c2_f155] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l675_c2_f155_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_682a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_682a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l698_c22_5fe5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5_left;
     BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5_return_output := BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l675_c6_b31b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_left;
     BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_return_output := BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_9579 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_9579_return_output := result.is_pc_updated;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l688_c7_0b75] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l688_c7_0b75_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l675_c2_f155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l675_c2_f155_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c6_b31b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l688_c7_0b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l688_c7_0b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_0e86_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l691_c7_ad4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l691_c7_ad4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l691_c11_22f6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l694_c7_70f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c11_065f_return_output;
     VAR_MUX_uxn_opcodes_h_l698_c22_8340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c22_5fe5_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l698_c42_f810_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_8709_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_8709_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_8709_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l694_l688_l691_DUPLICATE_4f73_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l694_l688_l691_DUPLICATE_4f73_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l694_l688_l691_DUPLICATE_4f73_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l694_l688_l691_DUPLICATE_4f73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_682a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_682a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_682a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_9579_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_9579_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l694_l688_l691_DUPLICATE_9579_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l675_c2_f155_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l675_c2_f155_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l675_c2_f155_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l675_c2_f155_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l688_c7_0b75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l696_c30_308b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l688_c7_0b75] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_return_output;

     -- t8_MUX[uxn_opcodes_h_l691_c7_ad4f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l691_c7_ad4f_cond <= VAR_t8_MUX_uxn_opcodes_h_l691_c7_ad4f_cond;
     t8_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue;
     t8_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output := t8_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l675_c2_f155] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l694_c7_70f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l675_c2_f155] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l694_c7_70f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l694_c7_70f9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l698_c37_ba54] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54_left;
     BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54_return_output := BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54_return_output;

     -- n8_MUX[uxn_opcodes_h_l694_c7_70f9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l694_c7_70f9_cond <= VAR_n8_MUX_uxn_opcodes_h_l694_c7_70f9_cond;
     n8_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue;
     n8_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l694_c7_70f9_return_output := n8_MUX_uxn_opcodes_h_l694_c7_70f9_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l675_c2_f155] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l675_c2_f155] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l698_c22_8340_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l698_c37_ba54_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l694_c7_70f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c7_70f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c7_70f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c7_70f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_0b75_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse := VAR_t8_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l691_c7_ad4f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l675_c2_f155] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_return_output;

     -- n8_MUX[uxn_opcodes_h_l691_c7_ad4f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l691_c7_ad4f_cond <= VAR_n8_MUX_uxn_opcodes_h_l691_c7_ad4f_cond;
     n8_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue;
     n8_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output := n8_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l691_c7_ad4f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l691_c7_ad4f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output;

     -- t8_MUX[uxn_opcodes_h_l688_c7_0b75] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l688_c7_0b75_cond <= VAR_t8_MUX_uxn_opcodes_h_l688_c7_0b75_cond;
     t8_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue;
     t8_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l688_c7_0b75_return_output := t8_MUX_uxn_opcodes_h_l688_c7_0b75_return_output;

     -- MUX[uxn_opcodes_h_l698_c22_8340] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l698_c22_8340_cond <= VAR_MUX_uxn_opcodes_h_l698_c22_8340_cond;
     MUX_uxn_opcodes_h_l698_c22_8340_iftrue <= VAR_MUX_uxn_opcodes_h_l698_c22_8340_iftrue;
     MUX_uxn_opcodes_h_l698_c22_8340_iffalse <= VAR_MUX_uxn_opcodes_h_l698_c22_8340_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l698_c22_8340_return_output := MUX_uxn_opcodes_h_l698_c22_8340_return_output;

     -- Submodule level 3
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue := VAR_MUX_uxn_opcodes_h_l698_c22_8340_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse := VAR_n8_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l675_c2_f155_iffalse := VAR_t8_MUX_uxn_opcodes_h_l688_c7_0b75_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l688_c7_0b75] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l688_c7_0b75] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_return_output;

     -- t8_MUX[uxn_opcodes_h_l675_c2_f155] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l675_c2_f155_cond <= VAR_t8_MUX_uxn_opcodes_h_l675_c2_f155_cond;
     t8_MUX_uxn_opcodes_h_l675_c2_f155_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l675_c2_f155_iftrue;
     t8_MUX_uxn_opcodes_h_l675_c2_f155_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l675_c2_f155_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l675_c2_f155_return_output := t8_MUX_uxn_opcodes_h_l675_c2_f155_return_output;

     -- n8_MUX[uxn_opcodes_h_l688_c7_0b75] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l688_c7_0b75_cond <= VAR_n8_MUX_uxn_opcodes_h_l688_c7_0b75_cond;
     n8_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue;
     n8_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l688_c7_0b75_return_output := n8_MUX_uxn_opcodes_h_l688_c7_0b75_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l688_c7_0b75] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l694_c7_70f9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_return_output := result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l675_c2_f155_iffalse := VAR_n8_MUX_uxn_opcodes_h_l688_c7_0b75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_0b75_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l688_c7_0b75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_0b75_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c7_70f9_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l675_c2_f155_return_output;
     -- n8_MUX[uxn_opcodes_h_l675_c2_f155] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l675_c2_f155_cond <= VAR_n8_MUX_uxn_opcodes_h_l675_c2_f155_cond;
     n8_MUX_uxn_opcodes_h_l675_c2_f155_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l675_c2_f155_iftrue;
     n8_MUX_uxn_opcodes_h_l675_c2_f155_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l675_c2_f155_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l675_c2_f155_return_output := n8_MUX_uxn_opcodes_h_l675_c2_f155_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l675_c2_f155] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l691_c7_ad4f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output := result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l675_c2_f155] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l675_c2_f155] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l675_c2_f155_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l691_c7_ad4f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l688_c7_0b75] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_cond;
     result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_return_output := result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l688_c7_0b75_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l675_c2_f155] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_cond;
     result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_return_output := result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_cbec_uxn_opcodes_h_l702_l671_DUPLICATE_782a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbec_uxn_opcodes_h_l702_l671_DUPLICATE_782a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cbec(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c2_f155_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c2_f155_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c2_f155_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c2_f155_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c2_f155_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l675_c2_f155_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l675_c2_f155_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbec_uxn_opcodes_h_l702_l671_DUPLICATE_782a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbec_uxn_opcodes_h_l702_l671_DUPLICATE_782a_return_output;
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
