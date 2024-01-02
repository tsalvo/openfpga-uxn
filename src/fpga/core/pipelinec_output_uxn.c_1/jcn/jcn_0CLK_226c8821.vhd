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
-- BIN_OP_EQ[uxn_opcodes_h_l658_c6_23bd]
signal BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l658_c2_1bea]
signal n8_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l658_c2_1bea]
signal t8_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l658_c2_1bea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l658_c2_1bea]
signal result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l658_c2_1bea]
signal result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l658_c2_1bea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l658_c2_1bea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l658_c2_1bea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l658_c2_1bea]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l658_c2_1bea]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l658_c2_1bea]
signal result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l671_c11_a871]
signal BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l671_c7_b2aa]
signal n8_MUX_uxn_opcodes_h_l671_c7_b2aa_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l671_c7_b2aa]
signal t8_MUX_uxn_opcodes_h_l671_c7_b2aa_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l671_c7_b2aa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l671_c7_b2aa]
signal result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l671_c7_b2aa]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l671_c7_b2aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l671_c7_b2aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l674_c11_2cbf]
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l674_c7_70ef]
signal n8_MUX_uxn_opcodes_h_l674_c7_70ef_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l674_c7_70ef_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l674_c7_70ef]
signal t8_MUX_uxn_opcodes_h_l674_c7_70ef_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l674_c7_70ef_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l674_c7_70ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l674_c7_70ef]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l674_c7_70ef]
signal result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l674_c7_70ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l677_c11_887a]
signal BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l677_c7_ed1d]
signal n8_MUX_uxn_opcodes_h_l677_c7_ed1d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l677_c7_ed1d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l677_c7_ed1d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l677_c7_ed1d]
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l677_c7_ed1d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l679_c30_ff9f]
signal sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l681_c22_4253]
signal BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l681_c37_fe93]
signal BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l681_c22_0b62]
signal MUX_uxn_opcodes_h_l681_c22_0b62_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l681_c22_0b62_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l681_c22_0b62_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l681_c22_0b62_return_output : unsigned(15 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_af90( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
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
      base.sp_relative_shift := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd
BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_left,
BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_right,
BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_return_output);

-- n8_MUX_uxn_opcodes_h_l658_c2_1bea
n8_MUX_uxn_opcodes_h_l658_c2_1bea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l658_c2_1bea_cond,
n8_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue,
n8_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse,
n8_MUX_uxn_opcodes_h_l658_c2_1bea_return_output);

-- t8_MUX_uxn_opcodes_h_l658_c2_1bea
t8_MUX_uxn_opcodes_h_l658_c2_1bea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l658_c2_1bea_cond,
t8_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue,
t8_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse,
t8_MUX_uxn_opcodes_h_l658_c2_1bea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea
result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_cond,
result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871
BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_left,
BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_right,
BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_return_output);

-- n8_MUX_uxn_opcodes_h_l671_c7_b2aa
n8_MUX_uxn_opcodes_h_l671_c7_b2aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l671_c7_b2aa_cond,
n8_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue,
n8_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse,
n8_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output);

-- t8_MUX_uxn_opcodes_h_l671_c7_b2aa
t8_MUX_uxn_opcodes_h_l671_c7_b2aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l671_c7_b2aa_cond,
t8_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue,
t8_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse,
t8_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa
result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_cond,
result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf
BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_left,
BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_right,
BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_return_output);

-- n8_MUX_uxn_opcodes_h_l674_c7_70ef
n8_MUX_uxn_opcodes_h_l674_c7_70ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l674_c7_70ef_cond,
n8_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue,
n8_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse,
n8_MUX_uxn_opcodes_h_l674_c7_70ef_return_output);

-- t8_MUX_uxn_opcodes_h_l674_c7_70ef
t8_MUX_uxn_opcodes_h_l674_c7_70ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l674_c7_70ef_cond,
t8_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue,
t8_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse,
t8_MUX_uxn_opcodes_h_l674_c7_70ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef
result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_cond,
result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a
BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_left,
BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_right,
BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_return_output);

-- n8_MUX_uxn_opcodes_h_l677_c7_ed1d
n8_MUX_uxn_opcodes_h_l677_c7_ed1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l677_c7_ed1d_cond,
n8_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue,
n8_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse,
n8_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d
result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_cond,
result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f
sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_ins,
sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_x,
sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_y,
sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253
BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253_left,
BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253_right,
BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93
BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93_left,
BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93_right,
BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93_return_output);

-- MUX_uxn_opcodes_h_l681_c22_0b62
MUX_uxn_opcodes_h_l681_c22_0b62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l681_c22_0b62_cond,
MUX_uxn_opcodes_h_l681_c22_0b62_iftrue,
MUX_uxn_opcodes_h_l681_c22_0b62_iffalse,
MUX_uxn_opcodes_h_l681_c22_0b62_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_return_output,
 n8_MUX_uxn_opcodes_h_l658_c2_1bea_return_output,
 t8_MUX_uxn_opcodes_h_l658_c2_1bea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_return_output,
 n8_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output,
 t8_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_return_output,
 n8_MUX_uxn_opcodes_h_l674_c7_70ef_return_output,
 t8_MUX_uxn_opcodes_h_l674_c7_70ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_return_output,
 n8_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output,
 sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93_return_output,
 MUX_uxn_opcodes_h_l681_c22_0b62_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l663_c3_bad2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l668_c3_9280 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l674_c7_70ef_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l671_c7_b2aa_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l674_c7_70ef_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l671_c7_b2aa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_705a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l671_c7_b2aa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l674_c7_70ef_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l674_c7_70ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_ed1d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l681_c22_0b62_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l681_c22_0b62_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l681_c22_0b62_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l681_c42_5224_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l681_c22_0b62_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_3dbf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_9074_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_1efa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_cd0e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af90_uxn_opcodes_h_l685_l654_DUPLICATE_a6b5_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l668_c3_9280 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l668_c3_9280;
     VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l663_c3_bad2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l663_c3_bad2;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_705a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_705a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l681_c22_0b62_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l658_c6_23bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_9074 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_9074_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l674_c11_2cbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_left;
     BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_return_output := BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l681_c22_4253] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253_left;
     BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253_return_output := BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_1efa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_1efa_return_output := result.is_pc_updated;

     -- CAST_TO_int8_t[uxn_opcodes_h_l681_c42_5224] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l681_c42_5224_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_cd0e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_cd0e_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l658_c2_1bea] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l658_c2_1bea_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l679_c30_ff9f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_ins;
     sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_x;
     sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_return_output := sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l671_c7_b2aa] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l671_c7_b2aa_return_output := result.stack_address_sp_offset;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l658_c2_1bea] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l658_c2_1bea_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l658_c2_1bea] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l658_c2_1bea_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l677_c11_887a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_left;
     BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_return_output := BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_3dbf LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_3dbf_return_output := result.u16_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l658_c2_1bea] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l658_c2_1bea_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l671_c11_a871] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_left;
     BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_return_output := BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l658_c2_1bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l658_c2_1bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_23bd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l671_c7_b2aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l671_c7_b2aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_a871_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l674_c7_70ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l674_c7_70ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_2cbf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_ed1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_887a_return_output;
     VAR_MUX_uxn_opcodes_h_l681_c22_0b62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_4253_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l681_c42_5224_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_9074_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_9074_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_9074_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_3dbf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_3dbf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_3dbf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_3dbf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_cd0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_cd0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_cd0e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_1efa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_1efa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_1efa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l658_c2_1bea_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l658_c2_1bea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l658_c2_1bea_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l658_c2_1bea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l671_c7_b2aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_ff9f_return_output;
     -- t8_MUX[uxn_opcodes_h_l674_c7_70ef] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l674_c7_70ef_cond <= VAR_t8_MUX_uxn_opcodes_h_l674_c7_70ef_cond;
     t8_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue;
     t8_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l674_c7_70ef_return_output := t8_MUX_uxn_opcodes_h_l674_c7_70ef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l658_c2_1bea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l671_c7_b2aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l677_c7_ed1d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l658_c2_1bea] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output;

     -- n8_MUX[uxn_opcodes_h_l677_c7_ed1d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l677_c7_ed1d_cond <= VAR_n8_MUX_uxn_opcodes_h_l677_c7_ed1d_cond;
     n8_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue;
     n8_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output := n8_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l658_c2_1bea] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l677_c7_ed1d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l677_c7_ed1d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l658_c2_1bea] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l681_c37_fe93] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93_left;
     BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93_return_output := BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l681_c22_0b62_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_fe93_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse := VAR_n8_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse := VAR_t8_MUX_uxn_opcodes_h_l674_c7_70ef_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l658_c2_1bea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_return_output;

     -- t8_MUX[uxn_opcodes_h_l671_c7_b2aa] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l671_c7_b2aa_cond <= VAR_t8_MUX_uxn_opcodes_h_l671_c7_b2aa_cond;
     t8_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue;
     t8_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output := t8_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output;

     -- n8_MUX[uxn_opcodes_h_l674_c7_70ef] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l674_c7_70ef_cond <= VAR_n8_MUX_uxn_opcodes_h_l674_c7_70ef_cond;
     n8_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue;
     n8_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l674_c7_70ef_return_output := n8_MUX_uxn_opcodes_h_l674_c7_70ef_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l674_c7_70ef] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_return_output;

     -- MUX[uxn_opcodes_h_l681_c22_0b62] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l681_c22_0b62_cond <= VAR_MUX_uxn_opcodes_h_l681_c22_0b62_cond;
     MUX_uxn_opcodes_h_l681_c22_0b62_iftrue <= VAR_MUX_uxn_opcodes_h_l681_c22_0b62_iftrue;
     MUX_uxn_opcodes_h_l681_c22_0b62_iffalse <= VAR_MUX_uxn_opcodes_h_l681_c22_0b62_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l681_c22_0b62_return_output := MUX_uxn_opcodes_h_l681_c22_0b62_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l674_c7_70ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l674_c7_70ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_return_output;

     -- Submodule level 3
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue := VAR_MUX_uxn_opcodes_h_l681_c22_0b62_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse := VAR_n8_MUX_uxn_opcodes_h_l674_c7_70ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_70ef_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_70ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_70ef_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse := VAR_t8_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l677_c7_ed1d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output := result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output;

     -- t8_MUX[uxn_opcodes_h_l658_c2_1bea] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l658_c2_1bea_cond <= VAR_t8_MUX_uxn_opcodes_h_l658_c2_1bea_cond;
     t8_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue;
     t8_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l658_c2_1bea_return_output := t8_MUX_uxn_opcodes_h_l658_c2_1bea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l671_c7_b2aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l671_c7_b2aa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l671_c7_b2aa] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output;

     -- n8_MUX[uxn_opcodes_h_l671_c7_b2aa] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l671_c7_b2aa_cond <= VAR_n8_MUX_uxn_opcodes_h_l671_c7_b2aa_cond;
     n8_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue;
     n8_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output := n8_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse := VAR_n8_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_ed1d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l658_c2_1bea_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l658_c2_1bea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l658_c2_1bea] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_return_output;

     -- n8_MUX[uxn_opcodes_h_l658_c2_1bea] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l658_c2_1bea_cond <= VAR_n8_MUX_uxn_opcodes_h_l658_c2_1bea_cond;
     n8_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue;
     n8_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l658_c2_1bea_return_output := n8_MUX_uxn_opcodes_h_l658_c2_1bea_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l674_c7_70ef] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_cond;
     result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_return_output := result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l658_c2_1bea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l658_c2_1bea_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_70ef_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l671_c7_b2aa] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_cond;
     result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output := result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_b2aa_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l658_c2_1bea] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_cond;
     result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_return_output := result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_af90_uxn_opcodes_h_l685_l654_DUPLICATE_a6b5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af90_uxn_opcodes_h_l685_l654_DUPLICATE_a6b5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_af90(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_1bea_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_1bea_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_1bea_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_1bea_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_1bea_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_1bea_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_1bea_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af90_uxn_opcodes_h_l685_l654_DUPLICATE_a6b5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af90_uxn_opcodes_h_l685_l654_DUPLICATE_a6b5_return_output;
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
