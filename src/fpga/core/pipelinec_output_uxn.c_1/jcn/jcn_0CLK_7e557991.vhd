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
-- Submodules: 38
entity jcn_0CLK_7e557991 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn_0CLK_7e557991;
architecture arch of jcn_0CLK_7e557991 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l663_c6_ac38]
signal BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l663_c2_6d7b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l663_c2_6d7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l663_c2_6d7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l663_c2_6d7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l663_c2_6d7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l663_c2_6d7b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l663_c2_6d7b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l663_c2_6d7b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l663_c2_6d7b]
signal result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l663_c2_6d7b]
signal n8_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l663_c2_6d7b]
signal t8_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l676_c11_f153]
signal BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l676_c7_0417]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l676_c7_0417]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l676_c7_0417]
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l676_c7_0417]
signal result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l676_c7_0417]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l676_c7_0417]
signal n8_MUX_uxn_opcodes_h_l676_c7_0417_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l676_c7_0417_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l676_c7_0417_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l676_c7_0417_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l676_c7_0417]
signal t8_MUX_uxn_opcodes_h_l676_c7_0417_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l676_c7_0417_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l676_c7_0417_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l676_c7_0417_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l679_c11_d9d0]
signal BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l679_c7_44ab]
signal result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l679_c7_44ab]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l679_c7_44ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l679_c7_44ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l679_c7_44ab]
signal n8_MUX_uxn_opcodes_h_l679_c7_44ab_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l679_c7_44ab_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l679_c7_44ab]
signal t8_MUX_uxn_opcodes_h_l679_c7_44ab_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l679_c7_44ab_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l682_c11_d063]
signal BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l682_c7_42ff]
signal result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l682_c7_42ff]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l682_c7_42ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l682_c7_42ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l682_c7_42ff]
signal n8_MUX_uxn_opcodes_h_l682_c7_42ff_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l682_c7_42ff_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l684_c30_fb7c]
signal sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l686_c22_7f7c]
signal BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c_return_output : unsigned(0 downto 0);

-- u16_add_u8_as_i8[uxn_opcodes_h_l686_c37_62b9]
signal u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9_u16 : unsigned(15 downto 0);
signal u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9_u8 : unsigned(7 downto 0);
signal u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l686_c22_68a0]
signal MUX_uxn_opcodes_h_l686_c22_68a0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l686_c22_68a0_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l686_c22_68a0_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l686_c22_68a0_return_output : unsigned(15 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_f623( ref_toks_0 : opcode_result_t;
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
      base.is_vram_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_ram_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.u16_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38
BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_left,
BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_right,
BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b
result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b
result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b
result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b
result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b
result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b
result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_cond,
result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output);

-- n8_MUX_uxn_opcodes_h_l663_c2_6d7b
n8_MUX_uxn_opcodes_h_l663_c2_6d7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l663_c2_6d7b_cond,
n8_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue,
n8_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse,
n8_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output);

-- t8_MUX_uxn_opcodes_h_l663_c2_6d7b
t8_MUX_uxn_opcodes_h_l663_c2_6d7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l663_c2_6d7b_cond,
t8_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue,
t8_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse,
t8_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153
BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_left,
BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_right,
BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417
result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417
result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_cond,
result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_return_output);

-- n8_MUX_uxn_opcodes_h_l676_c7_0417
n8_MUX_uxn_opcodes_h_l676_c7_0417 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l676_c7_0417_cond,
n8_MUX_uxn_opcodes_h_l676_c7_0417_iftrue,
n8_MUX_uxn_opcodes_h_l676_c7_0417_iffalse,
n8_MUX_uxn_opcodes_h_l676_c7_0417_return_output);

-- t8_MUX_uxn_opcodes_h_l676_c7_0417
t8_MUX_uxn_opcodes_h_l676_c7_0417 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l676_c7_0417_cond,
t8_MUX_uxn_opcodes_h_l676_c7_0417_iftrue,
t8_MUX_uxn_opcodes_h_l676_c7_0417_iffalse,
t8_MUX_uxn_opcodes_h_l676_c7_0417_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0
BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_left,
BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_right,
BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab
result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_cond,
result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab
result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab
result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_return_output);

-- n8_MUX_uxn_opcodes_h_l679_c7_44ab
n8_MUX_uxn_opcodes_h_l679_c7_44ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l679_c7_44ab_cond,
n8_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue,
n8_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse,
n8_MUX_uxn_opcodes_h_l679_c7_44ab_return_output);

-- t8_MUX_uxn_opcodes_h_l679_c7_44ab
t8_MUX_uxn_opcodes_h_l679_c7_44ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l679_c7_44ab_cond,
t8_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue,
t8_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse,
t8_MUX_uxn_opcodes_h_l679_c7_44ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063
BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_left,
BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_right,
BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff
result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_cond,
result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff
result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff
result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_return_output);

-- n8_MUX_uxn_opcodes_h_l682_c7_42ff
n8_MUX_uxn_opcodes_h_l682_c7_42ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l682_c7_42ff_cond,
n8_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue,
n8_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse,
n8_MUX_uxn_opcodes_h_l682_c7_42ff_return_output);

-- sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c
sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_ins,
sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_x,
sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_y,
sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c
BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c_left,
BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c_right,
BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c_return_output);

-- u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9
u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9 : entity work.u16_add_u8_as_i8_0CLK_e595f783 port map (
u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9_u16,
u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9_u8,
u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9_return_output);

-- MUX_uxn_opcodes_h_l686_c22_68a0
MUX_uxn_opcodes_h_l686_c22_68a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l686_c22_68a0_cond,
MUX_uxn_opcodes_h_l686_c22_68a0_iftrue,
MUX_uxn_opcodes_h_l686_c22_68a0_iffalse,
MUX_uxn_opcodes_h_l686_c22_68a0_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output,
 n8_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output,
 t8_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_return_output,
 n8_MUX_uxn_opcodes_h_l676_c7_0417_return_output,
 t8_MUX_uxn_opcodes_h_l676_c7_0417_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_return_output,
 n8_MUX_uxn_opcodes_h_l679_c7_44ab_return_output,
 t8_MUX_uxn_opcodes_h_l679_c7_44ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_return_output,
 n8_MUX_uxn_opcodes_h_l682_c7_42ff_return_output,
 sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c_return_output,
 u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9_return_output,
 MUX_uxn_opcodes_h_l686_c22_68a0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l673_c3_d2f3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l668_c3_e558 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l676_c7_0417_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l676_c7_0417_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l663_c2_6d7b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l677_c3_647b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l676_c7_0417_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l676_c7_0417_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l676_c7_0417_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l679_c7_44ab_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l676_c7_0417_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l676_c7_0417_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l676_c7_0417_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l679_c7_44ab_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l676_c7_0417_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l682_c7_42ff_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l679_c7_44ab_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l679_c7_44ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l682_c7_42ff_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l686_c22_68a0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l686_c22_68a0_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l686_c22_68a0_iffalse : unsigned(15 downto 0);
 variable VAR_u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9_u16 : unsigned(15 downto 0);
 variable VAR_u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9_u8 : unsigned(7 downto 0);
 variable VAR_u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l686_c22_68a0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l663_l676_l682_l679_DUPLICATE_7995_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l679_l676_l682_DUPLICATE_e84b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l679_l676_l682_DUPLICATE_a9b7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l679_l676_l682_DUPLICATE_48ad_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f623_uxn_opcodes_h_l690_l659_DUPLICATE_23f1_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_y := resize(to_signed(-2, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l668_c3_e558 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l668_c3_e558;
     VAR_sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l677_c3_647b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l677_c3_647b;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l673_c3_d2f3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l673_c3_d2f3;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l676_c7_0417_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse := n8;
     VAR_MUX_uxn_opcodes_h_l686_c22_68a0_iftrue := VAR_pc;
     VAR_u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9_u16 := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l676_c7_0417_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse := t8;
     VAR_u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9_u8 := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l663_c6_ac38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_left;
     BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_return_output := BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l684_c30_fb7c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_ins;
     sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_x;
     sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_return_output := sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l663_l676_l682_l679_DUPLICATE_7995 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l663_l676_l682_l679_DUPLICATE_7995_return_output := result.u16_value;

     -- u16_add_u8_as_i8[uxn_opcodes_h_l686_c37_62b9] LATENCY=0
     -- Inputs
     u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9_u16 <= VAR_u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9_u16;
     u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9_u8 <= VAR_u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9_u8;
     -- Outputs
     VAR_u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9_return_output := u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l676_c11_f153] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_left;
     BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_return_output := BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l676_c7_0417] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l676_c7_0417_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l663_c2_6d7b] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l663_c2_6d7b_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l682_c11_d063] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_left;
     BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_return_output := BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l686_c22_7f7c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c_left;
     BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c_return_output := BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l663_c2_6d7b] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l663_c2_6d7b_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l663_c2_6d7b] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l663_c2_6d7b_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l679_c11_d9d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l679_l676_l682_DUPLICATE_48ad LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l679_l676_l682_DUPLICATE_48ad_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l679_l676_l682_DUPLICATE_e84b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l679_l676_l682_DUPLICATE_e84b_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l663_c2_6d7b] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l663_c2_6d7b_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l679_l676_l682_DUPLICATE_a9b7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l679_l676_l682_DUPLICATE_a9b7_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l663_c2_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l663_c2_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c6_ac38_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l676_c7_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l676_c7_0417_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c11_f153_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l679_c7_44ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l679_c7_44ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l679_c11_d9d0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l682_c7_42ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_d063_return_output;
     VAR_MUX_uxn_opcodes_h_l686_c22_68a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c22_7f7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l679_l676_l682_DUPLICATE_e84b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l679_l676_l682_DUPLICATE_e84b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l679_l676_l682_DUPLICATE_e84b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l663_l676_l682_l679_DUPLICATE_7995_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l663_l676_l682_l679_DUPLICATE_7995_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l663_l676_l682_l679_DUPLICATE_7995_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l663_l676_l682_l679_DUPLICATE_7995_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l679_l676_l682_DUPLICATE_a9b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l679_l676_l682_DUPLICATE_a9b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l679_l676_l682_DUPLICATE_a9b7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l679_l676_l682_DUPLICATE_48ad_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l679_l676_l682_DUPLICATE_48ad_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l679_l676_l682_DUPLICATE_48ad_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l663_c2_6d7b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l663_c2_6d7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l663_c2_6d7b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l663_c2_6d7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l676_c7_0417_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l684_c30_fb7c_return_output;
     VAR_MUX_uxn_opcodes_h_l686_c22_68a0_iffalse := VAR_u16_add_u8_as_i8_uxn_opcodes_h_l686_c37_62b9_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l663_c2_6d7b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l682_c7_42ff] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_return_output;

     -- t8_MUX[uxn_opcodes_h_l679_c7_44ab] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l679_c7_44ab_cond <= VAR_t8_MUX_uxn_opcodes_h_l679_c7_44ab_cond;
     t8_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue;
     t8_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l679_c7_44ab_return_output := t8_MUX_uxn_opcodes_h_l679_c7_44ab_return_output;

     -- MUX[uxn_opcodes_h_l686_c22_68a0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l686_c22_68a0_cond <= VAR_MUX_uxn_opcodes_h_l686_c22_68a0_cond;
     MUX_uxn_opcodes_h_l686_c22_68a0_iftrue <= VAR_MUX_uxn_opcodes_h_l686_c22_68a0_iftrue;
     MUX_uxn_opcodes_h_l686_c22_68a0_iffalse <= VAR_MUX_uxn_opcodes_h_l686_c22_68a0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l686_c22_68a0_return_output := MUX_uxn_opcodes_h_l686_c22_68a0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l682_c7_42ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l663_c2_6d7b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l663_c2_6d7b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output;

     -- n8_MUX[uxn_opcodes_h_l682_c7_42ff] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l682_c7_42ff_cond <= VAR_n8_MUX_uxn_opcodes_h_l682_c7_42ff_cond;
     n8_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue;
     n8_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l682_c7_42ff_return_output := n8_MUX_uxn_opcodes_h_l682_c7_42ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l663_c2_6d7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l676_c7_0417] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l682_c7_42ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue := VAR_MUX_uxn_opcodes_h_l686_c22_68a0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse := VAR_n8_MUX_uxn_opcodes_h_l682_c7_42ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_42ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l682_c7_42ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_42ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c7_0417_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l676_c7_0417_iffalse := VAR_t8_MUX_uxn_opcodes_h_l679_c7_44ab_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l679_c7_44ab] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l663_c2_6d7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l679_c7_44ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_return_output;

     -- t8_MUX[uxn_opcodes_h_l676_c7_0417] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l676_c7_0417_cond <= VAR_t8_MUX_uxn_opcodes_h_l676_c7_0417_cond;
     t8_MUX_uxn_opcodes_h_l676_c7_0417_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l676_c7_0417_iftrue;
     t8_MUX_uxn_opcodes_h_l676_c7_0417_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l676_c7_0417_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l676_c7_0417_return_output := t8_MUX_uxn_opcodes_h_l676_c7_0417_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l682_c7_42ff] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_cond;
     result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_return_output := result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l679_c7_44ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_return_output;

     -- n8_MUX[uxn_opcodes_h_l679_c7_44ab] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l679_c7_44ab_cond <= VAR_n8_MUX_uxn_opcodes_h_l679_c7_44ab_cond;
     n8_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue;
     n8_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l679_c7_44ab_return_output := n8_MUX_uxn_opcodes_h_l679_c7_44ab_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l676_c7_0417_iffalse := VAR_n8_MUX_uxn_opcodes_h_l679_c7_44ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l679_c7_44ab_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l679_c7_44ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l679_c7_44ab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l682_c7_42ff_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l676_c7_0417_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l679_c7_44ab] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_cond;
     result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_return_output := result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l676_c7_0417] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_return_output;

     -- n8_MUX[uxn_opcodes_h_l676_c7_0417] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l676_c7_0417_cond <= VAR_n8_MUX_uxn_opcodes_h_l676_c7_0417_cond;
     n8_MUX_uxn_opcodes_h_l676_c7_0417_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l676_c7_0417_iftrue;
     n8_MUX_uxn_opcodes_h_l676_c7_0417_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l676_c7_0417_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l676_c7_0417_return_output := n8_MUX_uxn_opcodes_h_l676_c7_0417_return_output;

     -- t8_MUX[uxn_opcodes_h_l663_c2_6d7b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l663_c2_6d7b_cond <= VAR_t8_MUX_uxn_opcodes_h_l663_c2_6d7b_cond;
     t8_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue;
     t8_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output := t8_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l676_c7_0417] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l676_c7_0417] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l676_c7_0417_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c7_0417_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l676_c7_0417_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c7_0417_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l679_c7_44ab_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l663_c2_6d7b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l663_c2_6d7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l663_c2_6d7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l676_c7_0417] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_cond;
     result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_return_output := result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_return_output;

     -- n8_MUX[uxn_opcodes_h_l663_c2_6d7b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l663_c2_6d7b_cond <= VAR_n8_MUX_uxn_opcodes_h_l663_c2_6d7b_cond;
     n8_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue;
     n8_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output := n8_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l676_c7_0417_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l663_c2_6d7b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output := result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f623_uxn_opcodes_h_l690_l659_DUPLICATE_23f1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f623_uxn_opcodes_h_l690_l659_DUPLICATE_23f1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f623(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c2_6d7b_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f623_uxn_opcodes_h_l690_l659_DUPLICATE_23f1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f623_uxn_opcodes_h_l690_l659_DUPLICATE_23f1_return_output;
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
